local M = {}

local colors = require("duskhaven.palette")

M.setup = function()
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
			vim.api.nvim_set_hl(0, name, hl)
		end
	end
end

-- Auto-setup when selected
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "duskhaven",
	callback = M.setup,
})

return M
