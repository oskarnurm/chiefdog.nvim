<div align="center">
  <h1>Koda</h1>
  <p>Code's quiet companion</p>
  <p>A minimalist theme for Neovim, written in Lua</p>
</div>

![Dark Mode](https://github.com/user-attachments/assets/e892c373-ebc2-436d-8efa-7d1fd3d1f1a7)
![Light Mode](https://github.com/user-attachments/assets/02a71d9a-3067-4bce-a535-afebb1e190dc)

> [!NOTE]
> Developed on a 14" XDR retina display, your mileage may vary depending on your screen and brightness.

## Features

- Minimalist design, easy on the eyes while providing a clear semantic distinction.
- Blazingly fast, automatically loads highlights only for the plugins you use
- Supports stable and the latest [Neovim 0.12](https://neovim.io/roadmap/) features.

<details>
  <summary>Supported plugins</summary>

> Please open an issue if you notice any problems, or if a plugin you think should have explicit support is missing from the list.

- [blink.cmp](https://github.com/saghen/blink.cmp)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [mini.pick](https://github.com/nvim-mini/mini.pick)
- [mini.statusline](https://github.com/nvim-mini/mini.statusline)
- [mini.icons](https://github.com/nvim-mini/mini.icons?tab=readme-ov-file)
- [modes.nvim](https://github.com/mvllow/modes.nvim)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [trouble](https://github.com/folke/trouble.nvim)

</details>

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

<details>
  <summary>Default options</summary>
  
```lua
require("koda").setup({
    transparent = false, -- enable for transparent backgrounds

    -- Automatically enable highlights for plugins installed by your plugin manager
    -- Currently only supports `lazy.nvim` and `vim.pack`
    -- Default set to `false` because vim.pack can introduce breaking changes
    auto = false,

    cache = true, -- cache for better performance

    -- Style to be applied to different syntax groups
    -- Common use case would be to set either `italic = true` or `bold = true` for a desired group
    -- See `:help nvim_set_hl` for more valid values
    styles = {
       functions = { bold = true },
       keywords  = {},
       comments  = {},
       strings   = {},
       constants = {}, -- includes numbers, booleans
    },

    -- Override colors
    -- These will be merged into the active palette (Dark or Light)
    -- Example default palette for dark background:
    colors = {
        bg         = "#101010",
        fg         = "#b0b0b0",
        dim        = "#000000",
        line       = "#272727",
        keyword    = "#777777",
        comment    = "#50585d",
        border     = "#ffffff",
        emphasis   = "#ffffff",
        func       = "#ffffff",
        string     = "#ffffff",
        const      = "#d9ba73",
        highlight  = "#458ee6",
        info       = "#8ebeec",
        success    = "#86cd82",
        warning    = "#d9ba73",
        danger     = "#ff7676",
        green      = "#14ba19",
        orange     = "#f54d27",
        red        = "#701516",
        yellow     = "#d0bf41",
        pink       = "#f2a4db",
        cyan       = "#5abfb5",
    },

    -- You can modify or extend highlight groups using the `on_highlights` configuration option
    -- Any changes made take effect when highlights are applied
    on_highlights = function(hl, c) end,
})

````

</details>

<details>
  <summary>Example Overriding Colors & Highlights</summary>

```lua
-- Override specific palette colors or any highlights to your liking
-- Note: The palette key names (e.g., 'func') must match those found
-- in Koda's internal configuration (see above)
require("koda").setup({
  colors = {
    func = "#4078F2", -- changes the color of functions
    keyword = "#A627A4", -- changes the color of keywords
  },

  on_highlights = function(hl, c)
    hl.LineNr = { fg = c.info } -- change a specific highlight to use a different palette color
    hl.Comment = { fg = c.emphasis, italic = true } -- modify a syntax group (add bold, italic, etc)
    hl.RainbowDelimiterRed = { fg = "#fb2b2b" } -- add a custom highlight group for another plugin
  end,
})
````

</details>

## Language support

Most languages have sensible defaults thanks to Neovim's built-in queries, so I've opted not to add anything language-specific to keep the footprint smaller. Feel free to open an issue.
