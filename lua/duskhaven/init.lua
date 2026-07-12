local M = {}

local colors = require("duskhaven.palette")
local config = require("duskhaven.config")

-- Merge user options and (re)apply the colorscheme immediately if it's
-- already active, so live config changes take effect without re-running
-- `:colorscheme duskhaven`.
M.setup = function(opts)
	config.setup(opts)
	if vim.g.colors_name == "duskhaven" then
		M.load()
	end
end

M.load = function()
	vim.cmd([[hi clear]])
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "duskhaven"

	-- Highlight groups
	local highlights = {
		require("duskhaven.highlights.base")(colors),
		require("duskhaven.highlights.treesitter")(colors),
		require("duskhaven.highlights.completion")(colors),
		require("duskhaven.highlights.plugins")(colors),
	}

	for _, group in ipairs(highlights) do
		for name, hl in pairs(group) do
			if not config.options.italic then
				hl.italic = nil
			end
			if not config.options.bold then
				hl.bold = nil
			end
			vim.api.nvim_set_hl(0, name, hl)
		end
	end

	for name, hl in pairs(config.options.highlight_overrides) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

-- Auto-setup when selected
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "duskhaven",
	callback = M.load,
})

return M
