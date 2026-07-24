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

| Color | Hex |
| --- | --- |
| `bg` | `#0c1021` |
| `bg_dark` | `#0a0d1a` |
| `bg_light` | `#1a1f35` |
| `fg` | `#fdfff1` |
| `fg_dim` | `#d8d9c8` |
| `orange` | `#f25e01` |
| `yellow` | `#b3f63a` |
| `magenta` | `#ff0cac` |
| `blue` | `#6b8ab8` |
| `blue_light` | `#97c7e9` |
| `blue_dark` | `#3c5ea9` |
| `red` | `#e04a5f` |
| `green` | `#55ba30` |
| `peach` | `#ea9a86` |
| `cream` | `#eadbb8` |
| `gray` / `gray_dark` / `gray_darker` | `#a4a7a7` / `#505257` / `#35384a` |

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
- A terminal with true color support, with `vim.o.termguicolors = true` set (LazyVim enables this by default).

---

## ⚙️ Configuration

Duskhaven works out of the box with no configuration, but can be customized by passing options to `setup()` before the colorscheme is applied:

```lua
{
  "kbraggins/duskhaven.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- your customizations here
    italic = false,
    bold = false,
    highlight_overrides = {
      Comment = { fg = "#7a7f9e", italic = true },
    },
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

  -- Additional highlight groups to set/override, applied after the
  -- built-in groups. Uses the same format as `nvim_set_hl`.
  highlight_overrides = {},
})
```

### Overriding highlight groups

```lua
require("duskhaven").setup({
  highlight_overrides = {
    Comment = { fg = "#7a7f9e", italic = true },
    ["@keyword"] = { fg = "#ff0cac", bold = true },
  },
})
```

---

## 🔌 Plugin Support

Duskhaven includes tailored highlights across common plugin categories — pickers/explorers, completion, git signs, dashboards, and more. Most of these live in [`lua/duskhaven/highlights/plugins.lua`](lua/duskhaven/highlights/plugins.lua), though a few plugin-specific groups (e.g. completion, treesitter) are broken out into their own files under [`lua/duskhaven/highlights/`](lua/duskhaven/highlights/) — that folder is the exact, up-to-date source of truth for what's covered.

[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) gets its own bundled theme at `lua/lualine/themes/duskhaven.lua`. Lualine's default `theme = "auto"` picks this up automatically once Duskhaven is active — no extra config needed, unless you've explicitly set `options.theme` to something else.
