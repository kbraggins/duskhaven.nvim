local M = {}

M.defaults = {
	-- Set to false to disable italics across all highlight groups.
	italic = true,

	-- Set to false to disable bold text across all highlight groups.
	bold = true,

	-- Override individual palette colors. Merged over the base palette before
	--
	--   palette = { orange = "#ff8c42" }
	palette = {},

	-- Additional highlight groups to set/override, applied after the
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
