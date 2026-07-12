local M = {}

M.defaults = {
	-- Set to false to disable italics across all highlight groups.
	italic = true,

	-- Set to false to disable bold text across all highlight groups.
	bold = true,

	-- Additional highlight groups to set/override, applied after the
	highlight_overrides = {},
}

M.options = vim.deepcopy(M.defaults)

M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

return M
