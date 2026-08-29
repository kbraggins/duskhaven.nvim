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
	-- which lands dark-on-dark. Safe to set here rather than defer: with
	-- `colors_name` unset there is no active scheme for Neovim to re-source.
	vim.o.background = "dark"

	vim.cmd([[hi clear]])
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "duskhaven"

	-- Every group is defined in gui colors only, so without 'termguicolors' the
	-- editor falls back to the terminal's 16 colors and the theme looks like it
	-- never loaded.
	if not vim.o.termguicolors then
		vim.schedule(function()
			vim.notify(
				"duskhaven: 'termguicolors' is off, so the theme's colors are ignored. "
					.. "Set `vim.o.termguicolors = true` in a true-color terminal.",
				vim.log.levels.WARN
			)
		end)
	end

	local colors = config.strict_colors()

	for i, color in ipairs(require("duskhaven.terminal")(colors)) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end

	-- Lookup of the groups whose background is dropped for `transparent = true`.
	local transparent = {}
	if config.options.transparent then
		for _, name in ipairs(require("duskhaven.transparency")) do
			transparent[name] = true
		end
	end

	-- Collected into a single table rather than set as we go, so that user
	-- overrides can be merged over the theme's own definition below.
	local groups = {}
	for _, module in ipairs({ "base", "treesitter", "completion", "plugins" }) do
		for name, hl in pairs(require("duskhaven.highlights." .. module)(colors)) do
			if not config.options.italic then
				hl.italic = nil
			end
			if not config.options.bold then
				hl.bold = nil
			end
			if transparent[name] then
				hl.bg = nil
			end
			groups[name] = hl
		end
	end

	-- `nvim_set_hl` replaces a group wholesale, so a partial override such as
	-- `{ Comment = { italic = true } }` would drop the theme's foreground. Merge
	-- here instead: whatever the override states wins, and anything it leaves
	-- out is inherited from the theme.
	for name, override in pairs(config.options.highlight_overrides) do
		local base = groups[name]
		if base and not override.link then
			groups[name] = vim.tbl_extend("force", base, override)
			-- A linked group cannot carry its own attributes, so an override
			-- that sets any would be silently ignored. Keep the attributes.
			groups[name].link = nil
		else
			-- Unknown to the theme, or the override is itself a link. Nothing
			-- meaningful to inherit either way.
			groups[name] = override
		end
	end

	for name, hl in pairs(groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end

	-- The lualine theme resolves the palette at require-time, so drop it from
	-- the module cache to make sure a re-require picks up palette overrides.
	package.loaded["lualine.themes.duskhaven"] = nil
end

M.colors = config.colors

return M
