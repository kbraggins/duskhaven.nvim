-- ANSI colors for |:terminal| buffers and anything rendering ANSI escapes
-- (lazygit, delta, fzf, ...). Returned in slot order 0-15.
return function(colors)
	return {
		colors.black, -- 0  black
		colors.red, -- 1  red
		colors.green, -- 2  green
		colors.cream, -- 3  yellow
		colors.blue, -- 4  blue
		colors.magenta, -- 5  magenta
		colors.blue_light, -- 6  cyan
		colors.fg_dim, -- 7  white

		colors.gray_dark, -- 8  bright black
		colors.orange, -- 9  bright red
		colors.yellow, -- 10 bright green
		colors.peach, -- 11 bright yellow
		colors.blue_light, -- 12 bright blue
		colors.magenta, -- 13 bright magenta
		colors.blue_light, -- 14 bright cyan
		colors.fg, -- 15 bright white
	}
end
