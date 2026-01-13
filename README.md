<div align="center"><h1>Koda</h1></div>
<p align="center">Code's quiet companion.</p>
<p align="center"> A minimalist theme for Neovim, written in Lua.</p>

### Dark

<img width="1127" height="746" alt="Screenshot 2026-01-07 at 21 34 20" src="https://github.com/user-attachments/assets/e892c373-ebc2-436d-8efa-7d1fd3d1f1a7" />

### Light

<img width="1127" height="746" alt="Screenshot 2026-01-07 at 21 36 22" src="https://github.com/user-attachments/assets/02a71d9a-3067-4bce-a535-afebb1e190dc" />

> [!NOTE]
> Developed on a 14" XDR retina display, your mileage may vary depending on your screen and brightness.

## Installation

[lazy.nvim:](https://github.com/folke/lazy.nvim)

```lua
{
  "oskarnurm/koda.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- require("koda").setup({ transparent = true })
    vim.cmd("colorscheme koda")
  end,
}
```

[vim.pack:](https://neovim.io/doc/user/pack.html#vim.pack)

```lua
vim.pack.add({
  "https://github.com/oskarnurm/koda.nvim",
})
-- require("koda").setup({ transparent = true })
vim.cmd("colorscheme koda")
```

## Configuration

> [!IMPORTANT]
> Set the configuration **BEFORE** calling `vim.cmd("colorscheme koda")`.

> Because the theme applies the same background for pop-up menus and floating windows to match the rest of the UI, I recommend setting both `winborder` and `pumborder` to _at least_ "single" in Neovim.

<details>
  <summary>Default Options</summary>
  
```lua
require("koda").setup({
    transparent = false,  -- enable for transparent backgrounds

    -- Style to be applied to different syntax groups.
    -- Common use case would be to set either `italic = true` or `bold = true` for a desired group.
    -- See `:help nvim_set_hl` for more valid values.
    styles = {
       functions = { bold = true },
       keywords  = {},
       comments  = {},
       strings   = {},
       constants = {}, -- includes numbers, booleans
    },

    -- Override colors
    -- These will be merged into the active palette (Dark or Light)
    -- Example colors for dark background:
    colors = {
        bg        = "#101010", -- editor background
        fg        = "#b0b0b0", -- primary text color
        dim       = "#50585d", -- line numbers, inlay hints
        line      = "#272727", -- line highlights
        keyword   = "#777777", -- language syntax
        comment   = "#50585d", -- code comments
        border    = "#ffffff", -- floating window borders
        emphasis  = "#ffffff", -- bold text and prominent UI elements
        func      = "#ffffff", -- function names and headings
        string    = "#ffffff", -- string literals
        const     = "#d9ba73", -- numbers, booleans, and constants
        highlight = "#0058d0", -- search results and selection base
        info      = "#8ebeec", -- diagnostic hints and informative icons
        success   = "#86cd82", -- added git lines and positive diagnostics
        warning   = "#d9ba73", -- modified git lines and warning diagnostics
        danger    = "#ff7676", -- removed git lines and error diagnostics
    },

})

````

</details>

<details>
  <summary>Override Colors</summary>

```lua
-- Override specific palette colors to your liking.
-- Note: The key names (e.g., 'func') must match those found
-- in Koda's internal palette (see configuration above).
require("koda").setup({
  colors = {
    func = "#4078F2",    -- changes the color of functions
    keyword = "#A627A4", -- changes the color of keywords
  },
})
````

</details>

## Plugin support

> Below are some explicitly supported plugins. Note that `Koda` should support most other plugins by default...but I might be out of touch. Feel free to open an issue.

- [blink.cmp](https://github.com/saghen/blink.cmp)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [mini.pick](https://github.com/nvim-mini/mini.pick)
- [mini.statusline](https://github.com/nvim-mini/mini.statusline)
- [modes.nvim](https://github.com/mvllow/modes.nvim)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Language support

I feel like most languages have sensible defaults thanks to Neovim's built-in queries, so I've opted not to add anything specific to a language to keep the footprint smaller. Feel free to open an issue.
