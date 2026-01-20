---@class koda.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias koda.Highlights table<string, koda.Highlight>
--- Values can be either:
---  - koda.Highlight: Full highlight definition with fg, bg, style, etc.
---  - string: Link to another highlight group (e.g., "Normal")

---@alias koda.HighlightsFn fun(colors: koda.Palette, opts: koda.Config): koda.Highlights
--- Takes color palette and config, returns highlight definitions

---@class koda.Cache
--- Cached colorscheme data stored in stdpath("cache")
---@field groups koda.Highlights Compiled highlight groups
---@field config table The configuration fingerprint used to generate cache (for invalidation)

---@class koda.Palette
--- Color palette with semantic color names
---@field bg string?
---@field fg string?
---@field dim string?
---@field line string?
---@field keyword string?
---@field comment string?
---@field border string?
---@field emphasis string?
---@field func string?
---@field string string?
---@field const string?
---@field highlight string?
---@field info string?
---@field success string?
---@field warning string?
---@field danger string?
---@field green string?
---@field orange string?
---@field red string?
---@field yellow string?
---@field pink string?
---@field cyan string?

---@class koda.Config
--- User configuration options for the theme
---@field transparent? boolean
---@field cache? boolean
---@field styles? table<string, vim.api.keyset.highlight>
---@field colors? table<string, string>
---@field auto? boolean
---@field on_highlights? fun(highlights: koda.Highlights, colors: koda.Palette)
