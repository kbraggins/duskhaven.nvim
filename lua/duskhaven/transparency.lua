-- Highlight groups whose background is dropped when `transparent = true`.
--
-- These are the groups that paint the editor surface itself. Anything that
-- floats *over* the buffer -- NormalFloat, Pmenu, pickers, borders -- keeps
-- its background, because transparent text layered on top of code is hard to
-- read. Override those individually via `highlight_overrides` if you want them
-- transparent too.
--
-- TabLineSel and CursorLine are excluded on purpose: they mark a selection, so
-- they need a background to remain visible.
return {
	"Normal",
	"NormalNC",
	"SignColumn",
	"EndOfBuffer",
	"FoldColumn",
	"Folded",
	"MsgArea",
	"StatusLine",
	"StatusLineNC",
	"TabLine",
	"TabLineFill",
	"WinBar",
	"WinBarNC",
}
