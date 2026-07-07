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
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
		Comment = { fg = colors.gray },
		LineNr = { fg = colors.yellow },
		Cursor = { fg = colors.bg, bg = colors.orange },
		CursorLineNr = { fg = colors.yellow, bold = true },
		Keyword = { fg = colors.yellow },
		String = { fg = colors.yellow },
		EndOfBuffer = { fg = colors.fg, bg = colors.bg },
		Function = { fg = colors.blue },
		Macro = { fg = colors.magenta },
		Type = { fg = colors.blue_light },
		Constant = { fg = colors.peach },
		Title = { fg = colors.orange, bold = true },
		NonText = { fg = colors.gray_dark },
		Special = { fg = colors.magenta },
		MatchParen = { fg = colors.cream, bold = true },

		-- UI Elements
		Visual = { bg = colors.gray_darker },
		CursorLine = { bg = colors.bg_light },
		Search = { fg = colors.bg, bg = colors.yellow },
		IncSearch = { fg = colors.bg, bg = colors.orange },
		CmdlineBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		FloatBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		WinSeparator = { fg = colors.blue_dark },
		Folded = { fg = colors.blue, bg = colors.bg_dark },
		FoldColumn = { fg = colors.gray, bg = colors.magenta },

		-- Statusline / Tabline
		StatusLine = { fg = colors.fg_dim, bg = colors.bg_dark },
		StatusLineNC = { fg = colors.gray, bg = colors.bg_dark },
		TabLine = { fg = colors.gray, bg = colors.bg_dark },
		TabLineSel = { fg = colors.fg, bg = colors.bg_light, bold = true },
		TabLineFill = { bg = colors.bg_dark },

		-- Diagnostics
		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.yellow },
		DiagnosticInfo = { fg = colors.cream },
		DiagnosticHint = { fg = colors.peach },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cream },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.peach },

		-- Spelling
		SpellBad = { undercurl = true, sp = colors.red },
		SpellRare = { undercurl = true, sp = colors.magenta },
		SpellCap = { undercurl = true, sp = colors.blue_light },

		-- Completion Menu (Pmenu + Cmp + Blink)
		Pmenu = { fg = colors.fg, bg = colors.bg_dark },
		PmenuSel = { fg = colors.fg, bg = colors.bg_light, bold = true },
		PmenuBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		PmenuThumb = { bg = colors.gray_dark },

		CmpItemAbbr = { fg = colors.fg },
		CmpItemAbbrDeprecated = { fg = colors.gray, strikethrough = true },
		CmpItemAbbrMatch = { fg = colors.blue_light, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = colors.blue_light, bold = true },

		CmpItemKind = { fg = colors.blue },
		CmpItemMenu = { fg = colors.fg_dim },

		CmpItemKindMethod = { fg = colors.blue },
		CmpItemKindFunction = { fg = colors.blue },
		CmpItemKindConstructor = { fg = colors.blue },
		CmpItemKindClass = { fg = colors.blue_light },
		CmpItemKindInterface = { fg = colors.blue_light },
		CmpItemKindStruct = { fg = colors.blue_light },
		CmpItemKindModule = { fg = colors.blue_dark },
		CmpItemKindVariable = { fg = colors.orange },
		CmpItemKindProperty = { fg = colors.orange },
		CmpItemKindField = { fg = colors.orange },
		CmpItemKindConstant = { fg = colors.peach },
		CmpItemKindEnum = { fg = colors.yellow },
		CmpItemKindEnumMember = { fg = colors.yellow },
		CmpItemKindSnippet = { fg = colors.magenta },
		CmpItemKindKeyword = { fg = colors.yellow },
		CmpItemKindText = { fg = colors.fg_dim },
		CmpGhostText = { fg = colors.gray, italic = true },

		BlinkCmpLabel = { fg = colors.fg },
		BlinkCmpLabelMatch = { fg = colors.blue_light, bold = true },
		BlinkCmpLabelDetail = { fg = colors.fg_dim },

		BlinkCmpMenu = { fg = colors.fg, bg = colors.bg_dark },
		BlinkCmpMenuSelection = { fg = colors.fg, bg = colors.bg_light, bold = true },

		BlinkCmpKind = { fg = colors.blue },
		BlinkCmpKindMethod = { fg = colors.blue },
		BlinkCmpKindFunction = { fg = colors.blue },
		BlinkCmpKindConstructor = { fg = colors.blue },
		BlinkCmpKindClass = { fg = colors.blue_light },
		BlinkCmpKindInterface = { fg = colors.blue_light },
		BlinkCmpKindStruct = { fg = colors.blue_light },
		BlinkCmpKindModule = { fg = colors.blue_dark },
		BlinkCmpKindVariable = { fg = colors.orange },
		BlinkCmpKindProperty = { fg = colors.orange },
		BlinkCmpKindField = { fg = colors.orange },
		BlinkCmpKindConstant = { fg = colors.peach },
		BlinkCmpKindEnum = { fg = colors.yellow },
		BlinkCmpKindEnumMember = { fg = colors.yellow },
		BlinkCmpKindSnippet = { fg = colors.magenta },
		BlinkCmpKindKeyword = { fg = colors.yellow },
		BlinkCmpKindText = { fg = colors.fg_dim },

		-- Treesitter
		["@variable"] = { fg = colors.orange },
		["@keyword"] = { fg = colors.yellow },
		["@type"] = { fg = colors.blue_light },
		["@type.builtin"] = { fg = colors.yellow },
		["@function"] = { fg = colors.blue },
		["@string"] = { fg = colors.yellow },
		["@punctuation"] = { fg = colors.magenta },
		["@constant"] = { fg = colors.peach },
		["@constant.macro"] = { fg = colors.magenta },
		["@operator"] = { fg = colors.magenta },
		["@tag"] = { fg = colors.blue_light },
		["@tag.attribute"] = { fg = colors.peach },
		["@tag.delimiter"] = { fg = colors.magenta },

		-- Lazy.nvim
		LazyNormal = { fg = colors.fg, bg = colors.bg_dark },
		LazyBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		LazyButton = { fg = colors.fg, bg = colors.bg_light },
		LazyButtonActive = { fg = colors.fg, bg = colors.blue_light, bold = true },

		LazyH1 = { fg = colors.orange, bold = true }, -- Main title
		LazyH2 = { fg = colors.blue_light, bold = true }, -- Section headers

		LazyComment = { fg = colors.gray },
		LazyCommit = { fg = colors.blue },
		LazyCommitIssue = { fg = colors.orange },
		LazyCommitScope = { fg = colors.fg_dim, italic = true },

		LazyProgressDone = { fg = colors.green },
		LazyProgressTodo = { fg = colors.gray },

		LazySpecial = { fg = colors.magenta },
		LazyValue = { fg = colors.peach },
		LazyReason = { fg = colors.fg_dim },
		LazyReasonKeys = { fg = colors.yellow },
		LazyReasonPlugin = { fg = colors.blue_light },
		LazyReasonRuntime = { fg = colors.gray },
		LazyReasonSource = { fg = colors.orange },
		LazyReasonStart = { fg = colors.green },

		-- Mason
		MasonNormal = { fg = colors.fg, bg = colors.bg_dark },
		MasonHeader = { fg = colors.orange, bold = true },
		MasonHighlight = { fg = colors.blue },

		-- Snacks Dashboard
		SnacksDashboardHeader = { fg = colors.orange },
		SnacksDashboardIcon = { fg = colors.yellow },
		SnacksDashboardDesc = { fg = colors.orange },
		SnacksDashboardKey = { fg = colors.yellow },
		SnacksDashboardFooter = { fg = colors.yellow },
		SnacksDashboardSpecial = { fg = colors.magenta },

		-- Snacks Picker
		SnacksPicker = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		SnacksPickerTitle = { fg = colors.orange, bold = true },
		SnacksPickerPrompt = { fg = colors.magenta },
		SnacksPickerTree = { fg = colors.gray_dark },
		SnacksPickerDirectory = { fg = colors.yellow },
		SnacksPickerDir = { fg = colors.yellow },

		SnacksPickerCursor = { fg = colors.bg, bg = colors.orange },
		SnacksPickerCursorLine = { bg = colors.bg_light },
		SnacksPickerCursorLineNr = { fg = colors.yellow, bold = true },

		SnacksPickerMatch = { fg = colors.blue_light, bold = true },
		SnacksPickerSelected = { fg = colors.fg, bg = colors.bg_light, bold = true },

		SnacksPickerGitStatusAdded = { fg = colors.green },
		SnacksPickerGitStatusUntracked = { fg = colors.green, italic = true },
		SnacksPickerGitStatusModified = { fg = colors.cream },
		SnacksPickerGitStatusDeleted = { fg = colors.red },
		SnacksPickerGitStatusIgnored = { fg = colors.gray_dark },

		-- Preview window in picker
		SnacksPickerPreview = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerPreviewBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		SnacksPickerPreviewTitle = { fg = colors.orange, bold = true },

		-- Input / Search bar
		SnacksPickerInput = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerInputBorder = { fg = colors.orange, bg = colors.bg_dark },

		-- Help / Footer
		SnacksPickerHelp = { fg = colors.fg_dim },
		SnacksPickerHelpBorder = { fg = colors.gray },

		-- Snacks Explorer
		SnacksExplorer = { fg = colors.fg, bg = colors.bg_dark },
		SnacksExplorerBorder = { fg = colors.blue_light, bg = colors.bg_dark },

		SnacksExplorerDir = { fg = colors.yellow, bold = true },
		SnacksExplorerFile = { fg = colors.fg },
		SnacksExplorerFileOpened = { fg = colors.blue, bold = true },
		SnacksExplorerHidden = { fg = colors.gray_dark },
		SnacksExplorerRoot = { fg = colors.magenta, bold = true },

		SnacksExplorerIndent = { fg = colors.gray_dark },
		SnacksExplorerExpander = { fg = colors.gray },

		SnacksExplorerGitAdded = { fg = colors.green },
		SnacksExplorerGitUntracked = { fg = colors.green, italic = true },
		SnacksExplorerGitModified = { fg = colors.cream },
		SnacksExplorerGitDeleted = { fg = colors.red },
		SnacksExplorerGitIgnored = { fg = colors.gray_dark },

		SnacksExplorerCursor = { fg = colors.fg, bg = colors.bg_light, bold = true },
		SnacksExplorerCursorLine = { bg = colors.bg_light },
		SnacksExplorerCursorLineNr = { fg = colors.yellow, bold = true },

		-- NeoTree
		NeoTreeDirectoryName = { fg = colors.yellow, bold = true },
		NeoTreeFileName = { fg = colors.fg },
		NeoTreeFileNameOpened = { fg = colors.blue, bold = true },
		NeoTreeDotfile = { fg = colors.gray_dark },
		NeoTreeRootName = { fg = colors.magenta, bold = true },
		NeoTreeFloatBorder = { fg = colors.blue_light },
		NeoTreeWinSeparator = { fg = colors.blue_dark },
		NeoTreeIndentMarker = { fg = colors.gray_dark },
		NeoTreeExpander = { fg = colors.gray },

		NeoTreeGitAdded = { fg = colors.green },
		NeoTreeGitUntracked = { fg = colors.green, italic = true },
		NeoTreeGitModified = { fg = colors.cream },
		NeoTreeGitDeleted = { fg = colors.red },
		NeoTreeGitIgnored = { fg = colors.gray_dark },

		-- WhichKey
		WhichKey = { fg = colors.yellow },
		WhichKeyGroup = { fg = colors.blue_light },
		WhichKeyDesc = { fg = colors.fg_dim },
		WhichKeySeparator = { fg = colors.gray },

		-- Git signs
		GitSignsAdd = { fg = colors.green },
		GitSignsChange = { fg = colors.cream },
		GitSignsDelete = { fg = colors.red },
		GitSignsUntracked = { fg = colors.gray },

		-- fzf-lua
		FzfLuaNormal = { fg = colors.fg, bg = colors.bg_dark },
		FzfLuaBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		FzfLuaTitle = { fg = colors.orange, bold = true },
		FzfLuaTitleFlag = { fg = colors.magenta },

		FzfLuaCursor = { fg = colors.bg, bg = colors.orange },
		FzfLuaCursorLine = { bg = colors.bg_light },
		FzfLuaCursorLineNr = { fg = colors.yellow, bold = true },

		FzfLuaSearch = { fg = colors.bg, bg = colors.yellow },
		FzfLuaMatch = { fg = colors.blue_light, bold = true },

		FzfLuaPreviewTitle = { fg = colors.orange, bold = true },
		FzfLuaPreviewBorder = { fg = colors.blue_light },

		-- Help / Header
		FzfLuaHelpNormal = { fg = colors.fg_dim },
		FzfLuaHelpBorder = { fg = colors.gray },

		-- Selection
		FzfLuaSel = { fg = colors.fg, bg = colors.bg_light, bold = true },

		-- Git / Status
		FzfLuaGitAdd = { fg = colors.green },
		FzfLuaGitDelete = { fg = colors.red },
		FzfLuaGitChange = { fg = colors.cream },

		-- Icons / Kinds
		FzfLuaDir = { fg = colors.blue_light, bold = true },
		FzfLuaFile = { fg = colors.fg },
		FzfLuaSymlink = { fg = colors.peach },

		-- Telescope
		TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
		TelescopeBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_light },
		TelescopePromptBorder = { fg = colors.bg_light, bg = colors.bg_light },
		TelescopeSelection = { fg = colors.fg, bg = colors.bg_light, bold = true },
		TelescopeMatching = { fg = colors.blue_light, bold = true },

		-- noice.nvim
		NoiceCmdlinePopupBorder = { fg = colors.blue_light },
		NoiceCmdlinePopupBorderSearch = { fg = colors.orange },
		NoiceCmdlineIcon = { fg = colors.magenta },
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
