local config = require("duskhaven.config")
local colors = config.colors()

-- The `c` fill and the inactive sections drop their background when
-- `transparent = true`, so the terminal shows through the statusline. The `a`
-- (mode) and `b` sections keep their colours -- they read as solid chips.
local fill = config.options.transparent and "none" or colors.bg_dark
local style = config.options.bold and "bold" or nil

return {
	normal = {
		a = { bg = colors.orange, fg = colors.bg, gui = style },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = fill, fg = colors.gray },
	},
	insert = {
		a = { bg = colors.yellow, fg = colors.bg, gui = style },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = fill, fg = colors.gray },
	},
	visual = {
		a = { bg = colors.magenta, fg = colors.bg, gui = style },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = fill, fg = colors.gray },
	},
	replace = {
		a = { bg = colors.red, fg = colors.bg, gui = style },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = fill, fg = colors.gray },
	},
	command = {
		a = { bg = colors.peach, fg = colors.bg, gui = style },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = fill, fg = colors.gray },
	},
	inactive = {
		a = { bg = fill, fg = colors.gray, gui = style },
		b = { bg = fill, fg = colors.gray },
		c = { bg = fill, fg = colors.gray },
	},
}
