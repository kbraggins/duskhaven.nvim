# 🌆 duskhaven.nvim

A dark, neon/cyberpunk-inspired colorscheme for Neovim. Duskhaven combines cyberpunk aesthetics with a cozy, high-contrast palette designed to be easy on the eyes during late-night coding.

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
