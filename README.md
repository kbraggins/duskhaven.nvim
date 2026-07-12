# 🌆 duskhaven.nvim

A dark, neon/cyberpunk-inspired colorscheme for Neovim. Duskhaven combines cyberpunk aesthetics with a cozy, high-contrast palette designed to be easy on the eyes during late-night coding.
<img width="1624" height="1061" alt="menu" src="https://github.com/user-attachments/assets/dc9d11e7-137f-420d-ab14-806ba8a64359" />

## ✨ Features

- Dark background with vibrant neon accents (yellows, oranges, blues, and magentas).
- High contrast for readability and reduced eye strain.
- Out-of-the-box support for modern Neovim plugins.

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
