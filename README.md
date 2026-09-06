# 🌆 duskhaven.nvim

A dark, neon/cyberpunk-inspired colorscheme for Neovim. Duskhaven combines cyberpunk aesthetics with a cozy, high-contrast palette designed to be easy on the eyes during late-night coding.

The name comes from the palette itself: a deep navy-black sky (`bg`), a warm sunset orange fading on the horizon, and neon blues, magentas, and yellow-greens standing in for a lit-up city skyline just after dusk.

<img width="1624" height="1061" alt="menu" src="https://github.com/user-attachments/assets/dc9d11e7-137f-420d-ab14-806ba8a64359" />

## ✨ Features

- Dark background with vibrant neon accents (yellows, oranges, blues, and magentas).
- High contrast for readability and reduced eye strain.
- Out-of-the-box support for modern Neovim plugins.

---

## 🎨 Palette

| Color                                | Hex                               |
| ------------------------------------ | --------------------------------- |
| `bg`                                 | `#0c1021`                         |
| `bg_dark`                            | `#0a0d1a`                         |
| `bg_light`                           | `#1a1f35`                         |
| `fg`                                 | `#fdfff1`                         |
| `fg_dim`                             | `#d8d9c8`                         |
| `orange`                             | `#f25e01`                         |
| `yellow`                             | `#b3f63a`                         |
| `magenta`                            | `#ff0cac`                         |
| `blue`                               | `#6b8ab8`                         |
| `blue_light`                         | `#97c7e9`                         |
| `blue_dark`                          | `#3c5ea9`                         |
| `red`                                | `#e04a5f`                         |
| `green`                              | `#55ba30`                         |
| `peach`                              | `#ea9a86`                         |
| `cream`                              | `#eadbb8`                         |
| `gray` / `gray_dark` / `gray_darker` | `#a4a7a7` / `#505257` / `#35384a` |
| `black`                              | `#272822`                         |
| `diff_add` / `diff_change`           | `#14301c` / `#16233d`             |
| `diff_delete` / `diff_text`          | `#3a1721` / `#223a63`             |

---

## 📦 Installation

With **[lazy.nvim](https://github.com/folke/lazy.nvim)**:

```lua
{
  "kbraggins/duskhaven.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("duskhaven")
  end,
}
```

### Requirements

- Neovim >= 0.9
- A terminal with true color support, with `vim.o.termguicolors = true` set (LazyVim enables this by default). Duskhaven warns on load if it is off.

---

## ⚙️ Configuration

Duskhaven works out of the box with no configuration, but can be customized by passing options to `setup()` before the colorscheme is applied.

Copy this as-is for the stock theme, then uncomment only the options you want to change — see [Defaults](#defaults) for more info:

```lua
{
  "kbraggins/duskhaven.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- Every option is customizable; an empty table gives you the defaults.
    -- Uncomment a line to override.
    --
    -- italic = false,
    -- bold = false,
    -- transparent = true,
    -- palette = { orange = "#ff8c42" },
    -- highlight_overrides = {
    --   Comment = { fg = "#7a7f9e", italic = true },
    -- },
  },
  config = function(_, opts)
    require("duskhaven").setup(opts)
    vim.cmd.colorscheme("duskhaven")
  end,
}
```

### Defaults

```lua
require("duskhaven").setup({
  -- Set to false to disable italics across all highlight groups.
  italic = true,

  -- Set to false to disable bold text across all highlight groups.
  bold = true,

  -- Set to true to drop the background from the editor surface to
  -- support transparent terminals. Floats and popups stay opaque.
  transparent = false,

  -- Override individual palette colors. Merged over the base palette before
  -- any highlight group is built.
  palette = {},

  -- Additional highlight groups to set/override, applied after the
  -- built-in groups. Uses the same format as `nvim_set_hl`. An override is
  -- merged over the theme's own definition of that group, and is not
  -- affected by the `italic` / `bold` options above.
  highlight_overrides = {},
})
```

### Overriding palette colors

Use `palette` when you want to change a _color_ rather than one specific group.
A single entry retints every highlight that uses it — including the bundled
lualine theme:

```lua
require("duskhaven").setup({
  palette = {
    orange = "#ff8c42",
    bg = "#0a0d1c",
  },
})
```

Any key from the [palette table](#-palette) can be overridden. The resolved
palette is available as `require("duskhaven").colors()` if you want to build
matching highlights of your own.

### Overriding highlight groups

```lua
require("duskhaven").setup({
  highlight_overrides = {
    Comment = { fg = "#7a7f9e", italic = true },
    ["@keyword"] = { fg = "#ff0cac", bold = true },
  },
})
```

Overrides are merged over the theme's definition of the same group, so an
override only has to name what it wants to change — everything it leaves out is
inherited:

```lua
require("duskhaven").setup({
  highlight_overrides = {
    -- Keeps duskhaven's comment color, just adds the italics.
    Comment = { italic = true },
  },
})
```

Groups the theme does not define are set as-is, so this is also the place to
add highlights for a plugin duskhaven does not cover yet. An override that sets
`link` replaces the group outright, since a linked group cannot carry its own
attributes. Partial overrides of built-in linked groups inherit the target's
built-in colors and styles before applying your changes.

`setup()` validates option types, palette colors, and highlight definitions
before reloading. Invalid configuration raises an error naming the option and
leaves the previous configuration and active highlights intact.

---

## 🔌 Plugin Support

Duskhaven includes tailored highlights across common plugin categories — pickers/explorers, completion, git signs, dashboards, and more. Most of these live in [`lua/duskhaven/highlights/plugins.lua`](lua/duskhaven/highlights/plugins.lua), though a few plugin-specific groups (e.g. completion, treesitter) are broken out into their own files under [`lua/duskhaven/highlights/`](lua/duskhaven/highlights/) — that folder is the exact, up-to-date source of truth for what's covered.

[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) gets its own bundled theme at `lua/lualine/themes/duskhaven.lua`. Lualine's default `theme = "auto"` picks this up automatically once Duskhaven is active — no extra config needed, unless you've explicitly set `options.theme` to something else.
