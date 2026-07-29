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
	-- Clear `colors_name` first: changing 'background' re-runs `:colorscheme`
	-- for the active scheme, which would recurse back into this function.
	vim.g.colors_name = nil

	-- duskhaven is a dark theme. Without this, a user running `background=light`
	-- gets Neovim's light-mode defaults for every group the theme leaves unset,
	-- which lands dark-on-dark
	if vim.o.background ~= "dark" then
		vim.o.background = "dark"
	end

	vim.cmd([[hi clear]])
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "duskhaven"

	local colors = config.colors()

	for i, color in ipairs(require("duskhaven.terminal")(colors)) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end

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

	-- The lualine theme resolves the palette at require-time, so drop it from
	-- the module cache to make sure a re-require picks up palette overrides.
	package.loaded["lualine.themes.duskhaven"] = nil
end

M.colors = config.colors

return M
