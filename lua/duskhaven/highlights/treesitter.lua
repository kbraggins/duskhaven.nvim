return function(colors)
	return {
		["@variable"] = { fg = colors.orange },
		["@keyword"] = { fg = colors.yellow },
		["@constructor"] = { fg = colors.blue },
		["@constructor.lua"] = { fg = colors.magenta },
		["@type"] = { fg = colors.blue_light },
		["@type.builtin"] = { fg = colors.blue_light, italic = true },
		["@function"] = { fg = colors.blue },
		["@function.builtin"] = { fg = colors.blue, italic = true },
		["@variable.builtin"] = { fg = colors.orange, italic = true },
		["@string"] = { fg = colors.yellow },
		["@punctuation"] = { fg = colors.magenta },
		["@constant"] = { fg = colors.peach },
		["@constant.builtin"] = { fg = colors.peach, italic = true },
		["@constant.macro"] = { fg = colors.magenta },
		["@operator"] = { fg = colors.magenta },
		["@tag"] = { fg = colors.blue_light },
		["@tag.attribute"] = { fg = colors.peach },
		["@tag.delimiter"] = { fg = colors.magenta },
		["@module"] = { fg = colors.blue_dark },
		["@module.builtin"] = { fg = colors.blue_dark, italic = true },
	}
end
