<div align="center">
  <h1>Koda</h1>
  <p>Code's quiet companion</p>
  <p>A minimalist theme for Neovim, written in Lua</p>
</div>

<img width="1136" height="745" alt="image" src="https://github.com/user-attachments/assets/8e31231c-d40d-44b5-8e29-0be77339fca9" />
<img width="1136" height="745" alt="image" src="https://github.com/user-attachments/assets/d2018883-036b-4276-913e-b0d638b98972" />

> [!NOTE]
> Developed on a 14" XDR retina display, your mileage may vary depending on your screen and brightness.

## Features

- **Minimalist design**: easy on the eyes while providing a clear semantic distinction.
- **Fast**: caches the theme for blazingly fast startup times.
- **Lean**: skips highlights for plugins that aren't installed.
- Supports stable and the latest [Neovim 0.12](https://neovim.io/roadmap/) features.

<details id="plugin-support">
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
- [mini.jump2d](https://github.com/nvim-mini/mini.jump2d)
- [modes.nvim](https://github.com/mvllow/modes.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [snacks.dashboard](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md)
- [snacks.input](https://github.com/folke/snacks.nvim/blob/main/docs/input.md)
- [snacks.notifier](https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md)
- [snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [trouble.nvim](https://github.com/folke/trouble.nvim)

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

    -- Automatically enable highlights only for plugins installed by your plugin manager
    -- Currently only supports `lazy.nvim` and `vim.pack`
    -- Disable this to load ALL available plugin highlights
    auto = true,

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
        char       = "#ffffff",
        const      = "#d9ba73",
        highlight  = "#458ee6",
        info       = "#8ebeec",
        success    = "#86cd82",
        warning    = "#d9ba73",
        danger     = "#ff7676",
        green      = "#14ba19",
        orange     = "#f54d27",
        red        = "#701516",
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
    char = "#f2a4db", -- make characters pop out more by adding a different color
  },

  on_highlights = function(hl, c)
    hl.LineNr = { fg = c.info } -- change a specific highlight to use a different palette color
    hl.Comment = { fg = c.emphasis, italic = true } -- modify a syntax group (add bold, italic, etc)
    hl.RainbowDelimiterRed = { fg = "#fb2b2b" } -- add a custom highlight group for another plugin
  end,
})
````

</details>

## API

Koda exposes a few utility functions to allow users to integrate the theme with other parts of their configuration.

```lua
local koda = require("koda")
local colors = koda.get_palette() -- returns the active palette (dark or light) with any of your user overrides applied

some_plugin.error = koda.blend(colors.danger, colors.bg, 0.3) -- blends two colors together. Useful for creating custom shades that match the theme
```

## Language support

Most languages have sensible defaults thanks to Neovim's built-in queries, so I've opted not to add anything language-specific to keep the footprint smaller. Feel free to open an issue.

## Extras

Extra color configs for [WezTerm](https://wezterm.org/), [Ghostty](https://ghostty.org/), [Lazygit](https://github.com/jesseduffield/lazygit), [fzf](https://github.com/junegunn/fzf) and others can be found in [extras](extras/). To use them, refer to their respective documentation.
