local M = {}

local colors = require("duskhaven.palette")

M.setup = function()
	vim.g.colors_name = "duskhaven"

	vim.cmd([[hi clear]])
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	local highlights = {
		Normal = { fg = colors.fg, bg = colors.bg },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

-- Auto-setup when selected
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "duskhaven",
	callback = M.setup,
})

return M
