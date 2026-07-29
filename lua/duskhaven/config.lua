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
	-- own groups. These are set verbatim and are not subject to the `italic`
	-- and `bold` options above:
	--
	--   highlight_overrides = { Comment = { fg = "#7a7a7a", italic = true } }
	highlight_overrides = {},
}

M.options = vim.deepcopy(M.defaults)

M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

--- The base palette with any user overrides merged in.
---@return table<string, string>
M.colors = function()
	return vim.tbl_extend("force", require("duskhaven.palette"), M.options.palette or {})
end

return M
