return function(colors)
	return {
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
		Comment = { fg = colors.gray },
		LineNr = { fg = colors.blue_dark },
		Cursor = { fg = colors.bg, bg = colors.orange },
		CursorLineNr = { fg = colors.cream, bold = true },
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
		Statement = { fg = colors.yellow },
		PreProc = { fg = colors.magenta },
		Number = { fg = colors.peach },
		Boolean = { fg = colors.peach },
		Label = { fg = colors.yellow },
		Directory = { fg = colors.blue_light, bold = true },
		Underlined = { fg = colors.blue_light, underline = true },
		Todo = { fg = colors.bg, bg = colors.cream, bold = true },

		-- UI Elements
		Visual = { bg = colors.gray_darker },
		CursorLine = { bg = colors.bg_light },
		Search = { fg = colors.bg, bg = colors.yellow },
		IncSearch = { fg = colors.bg, bg = colors.orange },
		CmdlineBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		FloatBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		WinSeparator = { fg = colors.blue_dark },
		Folded = { fg = colors.blue, bg = colors.bg_dark },
		FoldColumn = { fg = colors.gray, bg = colors.gray_darker },
		SignColumn = { bg = colors.bg },
		ColorColumn = { bg = colors.bg_light },
		ErrorMsg = { fg = colors.red, bold = true },
		WarningMsg = { fg = colors.yellow, bold = true },
		ModeMsg = { fg = colors.orange, bold = true },

		-- Statusline / Tabline
		StatusLine = { fg = colors.fg_dim, bg = colors.bg_dark },
		StatusLineNC = { fg = colors.gray, bg = colors.bg_dark },
		TabLine = { fg = colors.gray, bg = colors.bg_dark },
		TabLineSel = { fg = colors.fg, bg = colors.bg_light, bold = true },
		TabLineFill = { bg = colors.bg_dark },

		-- Diff
		DiffAdd = { fg = colors.green },
		DiffChange = { fg = colors.cream },
		DiffDelete = { fg = colors.red },
		DiffText = { fg = colors.blue_light, bold = true },

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

		-- Completion Menu
		Pmenu = { fg = colors.fg, bg = colors.bg_dark },
		PmenuSel = { fg = colors.fg, bg = colors.bg_light, bold = true },
		PmenuBorder = { fg = colors.blue_light, bg = colors.bg_dark },
		PmenuThumb = { bg = colors.gray_dark },
	}
end
