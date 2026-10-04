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

-- Groups left untouched by the `italic` / `bold` options.
local emphasis = {
	Bold = true,
	Italic = true,
	["@markup.strong"] = true,
	["@markup.italic"] = true,
}

-- Every group is defined in gui colors only, so without 'termguicolors' the
-- editor falls back to the terminal's 16 colors and the theme looks like it
-- never loaded.
local check_pending = false
local function check_termguicolors()
	if check_pending then
		return
	end
	check_pending = true
	local function check()
		check_pending = false
		if vim.o.termguicolors or vim.g.colors_name ~= "duskhaven" then
			return
		end
		vim.notify(
			"duskhaven: 'termguicolors' is off, so the theme's colors are ignored. "
				.. "Set `vim.o.termguicolors = true` in a true-color terminal.",
			vim.log.levels.WARN
		)
	end
	if vim.v.vim_did_enter == 1 then
		vim.schedule(check)
		return
	end
	-- During startup, the user's config may still set the option after the
	-- colorscheme, and Neovim itself may enable it once the terminal answers
	-- its truecolor query, which it waits up to a second for.
	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			vim.defer_fn(check, 1500)
		end,
	})
end

-- The attributes a group currently displays, following links (the theme's or
-- Neovim's defaults) through to the group that defines them.
local function resolve_current(name)
	local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
	-- Treesitter falls back from an undefined capture like `@keyword.import`
	-- to `@keyword`, so that is what the group displays.
	if vim.tbl_isempty(hl) and name:find("^@.+%.") then
		return resolve_current((name:gsub("%.[^.]*$", "")))
	end
	-- Neovim derives cterm attributes from the gui ones when none are given.
	-- Inheriting them would keep e.g. cterm italics an override turns off.
	hl.cterm = nil
	return hl
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

	check_termguicolors()

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

	for _, module in ipairs({ "base", "treesitter", "completion", "plugins" }) do
		for name, hl in pairs(require("duskhaven.highlights." .. module)(colors)) do
			-- The emphasis groups render markup the author wrote, not the theme's
			-- styling, so the `italic` / `bold` options leave them alone.
			if not emphasis[name] then
				if not config.options.italic then
					hl.italic = nil
				end
				if not config.options.bold then
					hl.bold = nil
				end
			end
			if transparent[name] then
				hl.bg = nil
			end
			-- `fg = bg` hides text by painting it in the editor background. With
			-- that background gone it would show up against the terminal's
			-- instead, so dim it like other filler text.
			if config.options.transparent and hl.fg == colors.bg and hl.bg == nil then
				hl.fg = colors.gray_dark
			end
			vim.api.nvim_set_hl(0, name, hl)
		end
	end

	-- `nvim_set_hl` replaces a group wholesale, so a partial override such as
	-- `{ Comment = { italic = true } }` would drop the theme's foreground. Merge
	-- instead: whatever the override states wins, and anything it leaves out is
	-- inherited from what the group currently displays. That is resolved for
	-- every override before any is applied, so overrides never inherit from
	-- one another.
	local merged = {}
	for name, override in pairs(config.options.highlight_overrides) do
		if override.link then
			-- A link carries no attributes of its own; nothing to inherit.
			merged[name] = override
		else
			-- The result is never a link, since a linked group cannot carry its
			-- own attributes and the override's would be silently ignored.
			merged[name] = vim.tbl_extend("force", resolve_current(name), override)
		end
	end
	for name, hl in pairs(merged) do
		vim.api.nvim_set_hl(0, name, hl)
	end

	-- The lualine theme resolves the palette at require-time, so drop it from
	-- the module cache to make sure a re-require picks up palette overrides.
	package.loaded["lualine.themes.duskhaven"] = nil
end

M.colors = config.colors

return M
