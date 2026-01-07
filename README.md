<div align="center"><h1>Koda</h1></div>
<p align="center">Code's quiet companion. A minimalistic theme for Neovim, written in Lua.</p>

<img width="1487" height="916" alt="image" src="https://github.com/user-attachments/assets/5c118fcf-b30a-4606-8200-fdfaba4d3993" />

> [!NOTE]
> Developed on a 14" XDR retina display, your mileage may vary depending on your screen and brightness.

## Installation:

[lazy.nvim:](https://github.com/folke/lazy.nvim)

```lua
{
  "oskarnurm/koda.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd("colorscheme koda")
  end,
}
```

[vim.pack:](https://neovim.io/doc/user/pack.html#vim.pack)

```lua
vim.pack.add({
  "https://github.com/oskarnurm/koda.nvim",
})

vim.cmd("colorscheme koda")
```

## Configuration

You only need to call `setup` if you wish to override the following defaults:

```lua
require("koda").setup({
    bold = true           -- Disable bold for functions and keywords
    italic = false,      -- Enable italics for comments and strings
    transparent = false,  -- Enable for transparent terminal backgrounds

    -- Override colors
    -- These will be merged into the active palette (Dark or Light)
    -- Example colors for dark background
    colors = {
        transparent = "none",
        bg          = "#101010",
        fg          = "#b0b0b0",
        line        = "#272727",
        match       = "#4d4d4d",
        comment     = "#50585d",
        number      = "#808080",
        keyword     = "#777777",
        func        = "#ffffff",
        string      = "#ffffff",
        constant    = "#d9ba73",
        visual      = "#0058D0",
        hint        = "#8ebeec",
        error       = "#ff7676",
        add         = "#86CD82",
        change      = "#d9ba73",
        delete      = "#ff7676",
    }
})
```

<!--
## Color Groups

When overriding colors, you can use any of the following keys from the colors palette:

| Key      | Description                                |
| -------- | ------------------------------------------ |
| bg       | Main editor background                     |
| fg       | Main editor foreground                     |
| func     | Functions and Headings                     |
| keyword  | Language keywords (`if`, `else`, `return`) |
| constant | Numbers, Booleans, and Constants           |
| comment  | Code comments                              |
| string   | String literals                            |
| line     | CursorLine and UI borders                  |
| visual   | Selection background                       |
| hint     | Diagnostic hints, directories              |
| error    | Error messages, delete                     |
| add      | Diff/git related add                       |
| change   | Diff/git related change                    |
-->

## Plugin support:

- [blink.cmp](https://github.com/saghen/blink.cmp)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [mini.pick](https://github.com/nvim-mini/mini.pick)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
