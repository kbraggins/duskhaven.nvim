local M = {}

M.defaults = {
	-- Set to false to disable italics across all highlight groups.
	italic = true,

	-- Set to false to disable bold text across all highlight groups.
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
	-- own groups. An override is merged over the theme's definition of the
	-- same group, so it only has to name what it wants to change, and is not
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

M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
	warn_unknown_palette_keys(M.options.palette)
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
