local M = {}

local config = require("duskhaven.config")

-- Merge user options and reload the colorscheme through Neovim's normal
-- lifecycle when it is already active. This also lets dependent plugins
-- respond to the ColorScheme event.
M.setup = function(opts)
	config.setup(opts)
	if vim.g.colors_name == "duskhaven" then
		vim.cmd.colorscheme("duskhaven")
	end
end

M.load = function()
	vim.cmd([[hi clear]])
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "duskhaven"

	local colors = config.colors()

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

M.colors = config.colors

return M
