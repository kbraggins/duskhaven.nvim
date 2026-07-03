local colors = require("duskhaven.palette")

return {
	normal = {
		a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = colors.bg_dark, fg = colors.gray },
	},
	insert = {
		a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = colors.bg_dark, fg = colors.gray },
	},
	visual = {
		a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = colors.bg_dark, fg = colors.gray },
	},
	replace = {
		a = { bg = colors.red, fg = colors.bg, gui = "bold" },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = colors.bg_dark, fg = colors.gray },
	},
	command = {
		a = { bg = colors.peach, fg = colors.bg, gui = "bold" },
		b = { bg = colors.gray_darker, fg = colors.fg },
		c = { bg = colors.bg_dark, fg = colors.gray },
	},
	inactive = {
		a = { bg = colors.bg_dark, fg = colors.gray, gui = "bold" },
		b = { bg = colors.bg_dark, fg = colors.gray },
		c = { bg = colors.bg_dark, fg = colors.gray },
	},
}
