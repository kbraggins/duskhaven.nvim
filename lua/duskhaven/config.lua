local M = {}

M.defaults = {
	-- Set to false to disable italics across all highlight groups. Markup
	-- emphasis (e.g. *italic* in markdown) is kept.
	italic = true,

	-- Set to false to disable bold text across all highlight groups. Markup
	-- emphasis (e.g. **bold** in markdown) is kept.
	bold = true,

	-- Set to true to drop the background from the editor surface so a
	-- transparent terminal shows through. Floats, popups and pickers keep
	-- their background on purpose
	transparent = false,

	-- Override individual palette colors. Merged over the base palette before
	-- any highlight group is built, so a change here applies theme-wide:
	--
	--   palette = { orange = "#ff8c42" }
	palette = {},

	-- Additional highlight groups to set/override, applied after the theme's
	-- own groups. An override is merged over what the group currently
	-- displays, so it only has to name what it wants to change, and is not
	-- subject to the `italic` and `bold` options above:
	--
	--   highlight_overrides = { Comment = { fg = "#7a7a7a", italic = true } }
	highlight_overrides = {},
}

M.options = vim.deepcopy(M.defaults)

-- `palette` is keyed by color name, so a typo (`{ orage = ... }`) would merge
-- cleanly and simply never be read. Say so instead of silently ignoring it.
local function warn_unknown_palette_keys(palette)
	local base = require("duskhaven.palette")
	local unknown = {}
	for name in pairs(palette) do
		if base[name] == nil then
			table.insert(unknown, name)
		end
	end
	if #unknown > 0 then
		table.sort(unknown)
		vim.schedule(function()
			vim.notify(
				("duskhaven: unknown palette %s in `setup()`: %s"):format(
					#unknown == 1 and "color" or "colors",
					table.concat(unknown, ", ")
				),
				vim.log.levels.WARN
			)
		end)
	end
end

local validation_ns

-- Error levels point past `M.setup` and `require("duskhaven").setup` to the
-- user's call, so the message names their config rather than this file.
local function expect(value, kind, path)
	if type(value) ~= kind then
		error(("duskhaven: %s must be a %s"):format(path, kind), 4)
	end
end

M.setup = function(opts)
	if opts == nil then
		opts = {}
	end
	expect(opts, "table", "options")
	local options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts)
	for _, name in ipairs({ "italic", "bold", "transparent" }) do
		expect(options[name], "boolean", name)
	end
	expect(options.palette, "table", "palette")
	for name, color in pairs(options.palette) do
		expect(name, "string", "palette key")
		expect(color, "string", "palette." .. name)
		if (color:sub(1, 1) == "#" and not color:match("^#%x%x%x%x%x%x$"))
			or vim.api.nvim_get_color_by_name(color) == -1 then
			error(("duskhaven: palette.%s has invalid color %q"):format(name, color), 3)
		end
	end
	expect(options.highlight_overrides, "table", "highlight_overrides")
	-- Let Neovim validate its own highlight API in an inactive namespace,
	-- before committing options or clearing the currently active colorscheme.
	validation_ns = validation_ns or vim.api.nvim_create_namespace("duskhaven.validation")
	for name, hl in pairs(options.highlight_overrides) do
		expect(name, "string", "highlight_overrides key")
		expect(hl, "table", "highlight_overrides." .. name)
		local ok, err = pcall(vim.api.nvim_set_hl, validation_ns, name, hl)
		if not ok then
			error(("duskhaven: highlight_overrides.%s: %s"):format(name, err), 3)
		end
	end
	warn_unknown_palette_keys(options.palette)
	M.options = options
end

--- The base palette with any user overrides merged in.
---@return table<string, string>
M.colors = function()
	return vim.tbl_extend("force", require("duskhaven.palette"), M.options.palette or {})
end

--- The same palette, but reading a color it does not define raises instead of
--- returning nil. A typo like `colors.blue_ligt` otherwise produces a highlight
--- group that is simply missing a foreground, with no error to trace it back to.
--- Used when building the theme's own groups; `M.colors` stays permissive for
--- callers outside the theme.
---@return table<string, string>
M.strict_colors = function()
	return setmetatable(M.colors(), {
		__index = function(_, name)
			error(("duskhaven: unknown palette color '%s'"):format(tostring(name)), 2)
		end,
	})
end

return M
