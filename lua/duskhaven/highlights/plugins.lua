return function(colors)
	return {
		-- Lazy.nvim
		LazyNormal = { fg = colors.fg, bg = colors.bg_dark },
		LazyBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		LazyButton = { fg = colors.fg, bg = colors.bg_light },
		LazyButtonActive = { fg = colors.bg, bg = colors.blue_light, bold = true },

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

		-- mason.nvim
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
		SnacksPickerFooter = { fg = colors.gray },
		SnacksPickerPrompt = { fg = colors.magenta },
		SnacksPickerTree = { fg = colors.gray_dark },
		SnacksPickerDirectory = { fg = colors.yellow },
		SnacksPickerDir = { fg = colors.yellow },
		SnacksPickerFile = { fg = colors.fg },
		SnacksPickerPathHidden = { fg = colors.gray_dark },
		SnacksPickerPathIgnored = { fg = colors.gray_dark },

		SnacksPickerCursorLine = { bg = colors.bg_light },

		SnacksPickerMatch = { fg = colors.blue_light, bold = true },
		SnacksPickerSelected = { fg = colors.fg, bg = colors.bg_light, bold = true },

		SnacksPickerGitStatusAdded = { fg = colors.green },
		SnacksPickerGitStatusUntracked = { fg = colors.green, italic = true },
		SnacksPickerGitStatusModified = { fg = colors.cream },
		SnacksPickerGitStatusDeleted = { fg = colors.red },
		SnacksPickerGitStatusRenamed = { fg = colors.blue_light },
		SnacksPickerGitStatusCopied = { fg = colors.blue_light },
		SnacksPickerGitStatusUnmerged = { fg = colors.red, bold = true },
		SnacksPickerGitStatusStaged = { fg = colors.green },
		SnacksPickerGitStatusIgnored = { fg = colors.gray_dark },

		-- Snacks Preview window in picker
		SnacksPickerPreview = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerPreviewBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		SnacksPickerPreviewTitle = { fg = colors.orange, bold = true },
		SnacksPickerPreviewFooter = { fg = colors.gray },
		SnacksPickerPreviewCursorLine = { bg = colors.bg_light },

		-- Snacks Input / Search bar
		SnacksPickerInput = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerInputBorder = { fg = colors.orange, bg = colors.bg_dark },
		SnacksPickerInputTitle = { fg = colors.orange, bold = true },
		SnacksPickerInputFooter = { fg = colors.gray },
		SnacksPickerInputCursorLine = { bg = colors.bg_light },

		-- Snacks List / Box windows
		SnacksPickerList = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerListBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		SnacksPickerListTitle = { fg = colors.orange, bold = true },
		SnacksPickerListFooter = { fg = colors.gray },
		SnacksPickerListCursorLine = { bg = colors.bg_light },

		SnacksPickerBox = { fg = colors.fg, bg = colors.bg_dark },
		SnacksPickerBoxBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		SnacksPickerBoxTitle = { fg = colors.orange, bold = true },
		SnacksPickerBoxFooter = { fg = colors.gray },
		SnacksPickerBoxCursorLine = { bg = colors.bg_light },

		-- neo-tree.nvim
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

		-- which-key.nvim
		WhichKey = { fg = colors.yellow },
		WhichKeyGroup = { fg = colors.blue_light },
		WhichKeyDesc = { fg = colors.fg_dim },
		WhichKeySeparator = { fg = colors.gray },

		-- gitsigns.nvim
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

		-- fzf-lua Help / Header
		FzfLuaHelpNormal = { fg = colors.fg_dim },
		FzfLuaHelpBorder = { fg = colors.gray },

		-- fzf-lua Selection
		FzfLuaSel = { fg = colors.fg, bg = colors.bg_light, bold = true },

		-- fzf-lua Git / Status
		FzfLuaGitAdd = { fg = colors.green },
		FzfLuaGitDelete = { fg = colors.red },
		FzfLuaGitChange = { fg = colors.cream },

		-- fzf-lua Icons / Kinds
		FzfLuaDir = { fg = colors.blue_light, bold = true },
		FzfLuaFile = { fg = colors.fg },
		FzfLuaSymlink = { fg = colors.peach },

		-- Telescope
		TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
		TelescopeBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_light },
		TelescopePromptBorder = { fg = colors.blue_light, bg = colors.bg_light },
		TelescopeSelection = { fg = colors.fg, bg = colors.bg_light, bold = true },
		TelescopeMatching = { fg = colors.blue_light, bold = true },

		-- noice.nvim
		NoiceCmdlinePopupBorder = { fg = colors.blue_light },
		NoiceCmdlinePopupBorderSearch = { fg = colors.orange },
		NoiceCmdlineIcon = { fg = colors.magenta },
	}
end
