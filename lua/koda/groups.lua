-- lua/koda/groups.lua
local utils = require("koda.utils")
local M = {}

function M.setup(c, opts)
	local groups = {}

	if vim.o.background == "dark" then
		-- dark
		-- in case bg is 'none' we use the default color to calculate blends
		local bg = c.bg == "none" and "#101010" or c.bg

    -- stylua: ignore
		groups = {
			Normal            = { fg = c.fg, bg = c.bg },
			NormalFloat       = { link = "Normal" },
			FloatBorder       = { fg = c.func, bg = c.bg, },
			Cursor            = { fg = c.fg, bg = c.func },
			TermCursor        = { link = "Cursor" },
			CursorLine        = { bg = c.line },
			CursorLineNr      = { fg = c.func, bold = opts.bold },
			LineNr            = { fg = c.number },
			StatusLine        = { fg = c.fg, bg = c.line },
			StatusLineNC      = { link = "Normal" },
			StatusLineTerm    = { link = "StatusLine" },
			StatusLineTermNC  = { link = "StatusLineNC" },
			WinBar            = { link = "Normal" },
			WinBarNC          = { link = "Normal" },
			WinSeparator      = { fg = c.line },
			Pmenu             = { fg = c.fg, bg = c.transparent },
			PmenuSel          = { fg = c.func, bg = utils.blend(c.visual, bg, 0.4), bold = opts.bold },
			PmenuThumb        = { bg = c.fg },
			PmenuMatch        = { fg = c.constant, bold = opts.bold },
			Visual            = { fg = c.func, bg = utils.blend(c.visual, bg, 0.4) },
			Search            = { link = "Visual" },
			IncSearch         = { link = "Search" },
			CurSearch         = { link = "Search" },
			MatchParen        = { fg = c.fg, bg = c.match },
			NonText           = { fg = c.line },
			EndOfBuffer       = { fg = c.line },
			Question          = { fg = c.constant },
			MoreMsg           = { fg = c.constant },
			ErrorMsg          = { fg = c.error },
			WarningMsg        = { fg = c.constant },
			ModeMsg           = { fg = c.constant },
			Directory         = { fg = c.hint },
			QuickFixLine      = { fg = c.constant, underline = true },
			qfLineNr          = { fg = c.number },

			-- Syntax
			Keyword           = { fg = c.keyword },
			Conditional       = { link = "Keyword" },
			Repeat            = { link = "Keyword" },
			Label             = { link = "Keyword" },
			Exception         = { link = "Keyword" },
			Statement         = { link = "Keyword" },
			Operator          = { link = "Keyword" },
			Delimiter         = { fg = c.func },
			Type              = { link = "Keyword" },
			Structure         = { link = "Keyword" },
			Identifier        = { fg = c.fg },
			PreProc           = { link = "Keyword" },
			Include           = { link = "Keyword" },
			Define            = { link = "Keyword" },
			PreCondit         = { link = "Keyword" },
			StorageClass      = { link = "Keyword" },
			Typedef           = { link = "Keyword" },
			Tag               = { link = "Keyword" },
			Function          = { fg = c.func, bold = opts.bold },
			Title             = { fg = c.func, bold = opts.bold },
			String            = { fg = c.string, italic = opts.italic },
			Character         = { link = "String" },
			Number            = { fg = c.constant },
			Boolean           = { fg = c.constant },
			Float             = { fg = c.constant },
			Constant          = { fg = c.constant },
			Macro             = { fg = c.constant },
			Comment           = { fg = c.comment, italic = opts.italic },
			Todo              = { fg = c.bg, bg = c.hint, bold = opts.bold },
			Special           = { fg = c.fg },
			SpecialChar       = { link = "Special" },
			SpecialComment    = { link = "Comment" },
			Error             = { fg = c.error },
			Debug             = { fg = c.constant },
			LspInlayHint      = { fg = c.comment },
      Underlined        = { underline = true },

			-- Treesitter
			["@function"]              = { link = "Function" },
			["@function.call"]         = { fg = c.fg },
			["@function.builtin"]      = { fg = c.fg },
			["@function.macro"]        = { link = "Macro" },
			["@function.method"]       = { link = "Function" },
			["@function.method.call"]  = { fg = c.fg },

			["@keyword"]               = { link = "Keyword" },
			["@keyword.function"]      = { link = "Keyword" },
			["@keyword.return"]        = { fg = c.func, bold = opts.bold },
			["@keyword.conditional"]   = { link = "Conditional" },
			["@keyword.exception"]     = { link = "Exception" },
			["@keyword.import"]        = { link = "Include" },
			["@keyword.operator"]      = { link = "Operator" },
			["@operator"]              = { link = "Operator" },
			["@punctuation"]           = { link = "Keyword" },
			["@punctuation.delimiter"] = { link = "Delimiter" },
			["@punctuation.bracket"]   = { link = "Delimiter" },
			["@punctuation.special"]   = { link = "Delimiter" },

			["@variable"]           = { link = "Identifier" },
			["@variable.builtin"]   = { link = "Constant" },
			["@variable.parameter"] = { link = "Identifier" },
			["@variable.member"]    = { link = "Identifier" },
			["@property"]           = { link = "Identifier" },
			["@attribute"]          = { link = "Keyword" },
			["@module"]             = { link = "Structure" },

			["@constant"]           = { link = "Constant" },
			["@constant.builtin"]   = { link = "Constant" },
			["@string"]             = { link = "String" },
			["@string.regexp"]      = { link = "String" },
			["@string.escape"]      = { link = "Special" },
			["@string.special"]     = { link = "Special" },
			["@character"]          = { link = "Character" },
			["@number"]             = { link = "Number" },
			["@boolean"]            = { link = "Boolean" },
			["@constructor"]        = { link = "Identifier" },

			["@tag"]                = { link = "Keyword" },
			["@tag.delimiter"]      = { link = "Keyword" },
			["@tag.attribute"]      = { link = "Keyword" },

			["@markup.heading"]     = { link = "Title" },
			["@markup.italic"]      = { fg = c.fg, italic = true },
			["@markup.strong"]      = { fg = c.fg, bold = true },
			["@markup.link"]        = { link = "Underlined" },
			["@markup.link.uri"]    = { link = "Underlined" },
			["@markup.list"]        = { fg = c.constant },
			["@markup.raw"]         = { link = "Constant" },
			["@markup.quote"]       = { link = "Comment" },

			-- Diff / Git
			DiffAdd     = { fg = c.add, bg = utils.blend(c.add, bg, 0.2) },
			DiffChange  = { fg = c.change, bg = utils.blend(c.change, bg, 0.2) },
			DiffDelete  = { fg = c.delete, bg = utils.blend(c.delete, bg, 0.2) },
			DiffText    = { fg = c.change, bg = utils.blend(c.change, bg, 0.4) },

			["@text.diff.add"]    = { link = "DiffAdd" },
			["@text.diff.delete"] = { link = "DiffDelete" },
			["@diff.plus"]        = { link = "GitSignsAdd" },
			["@diff.minus"]       = { link = "GitSignsDelete" },
			["@diff.delta"]       = { link = "GitSignsChange" },

			-- Diagnostics
			DiagnosticError = { fg = c.error },
			DiagnosticWarn  = { fg = c.constant },
			DiagnosticHint  = { fg = c.hint },
			DiagnosticInfo  = { fg = c.fg },

			-- Gitsigns
			GitSignsAdd    = { fg = c.add },
			GitSignsChange = { fg = c.change },
			GitSignsDelete = { fg = c.delete },

			-- Blink
			BlinkCmpLabelMatch = { fg = c.constant },

			-- Mini.pick
			MiniPickMatchRanges = { fg = c.constant },

			-- Oil
			OilCreate = { fg = c.add },

			-- Snacks
			SnacksPickerDir = { fg = c.keyword },
			SnacksPickerMatch = { fg = c.constant },
		}
	else
		-- light
		-- in case bg is 'none' we use the default color to calculate blends
		local bg = c.bg == "none" and "#fAf9F5" or c.bg

    -- stylua: ignore
		groups = {
			Normal            = { fg = c.fg, bg = c.bg },
			NormalFloat       = { link = "Normal" },
			FloatBorder       = { link = "Normal" },
			Cursor            = { fg = c.bg, bg = c.fg },
      TermCursor        = { link = "Cursor" },
      CursorLine        = { bg = c.line },
			CursorColumn      = { link = "CursorLine" },
			CursorLineNr      = { fg = c.fg, bold = opts.bold },
			LineNr            = { fg = c.comment },
			StatusLine        = { fg = c.fg, bg = c.line },
			StatusLineNC      = { link = "Normal" },
			StatusLineTerm    = { link = "StatusLine" },
			StatusLineTermNC  = { link = "Normal" },
			WinBar            = { link = "StatusLine" },
			WinBarNC          = { link = "Normal" },
			WinSeparator      = { fg = c.comment },
			Pmenu             = { fg = c.fg, bg = c.transparent },
			PmenuSel          = { fg = c.fg, bg = utils.blend(c.func, c.bg, 0.25), bold = opts.bold },
			PmenuThumb        = { bg = c.comment },
			PmenuMatch        = { fg = c.constant, bold = opts.bold },
			Visual            = { fg = c.fg, bg = utils.blend(c.visual, c.bg, 0.25) },
			Search            = { link = "Visual" },
			IncSearch         = { link = "Search" },
			CurSearch         = { link = "Search" },
			MatchParen        = { fg = c.fg, bg = c.match },
			NonText           = { fg = c.line },
			EndOfBuffer       = { fg = c.comment },
      Question          = { fg = c.fg, bg = utils.blend(c.constant, c.bg, 0.25) },
			MoreMsg           = { fg = c.fg, bg = utils.blend(c.constant, c.bg, 0.25) },
			ErrorMsg          = { fg = c.fg, bg = utils.blend(c.error, c.bg, 0.25) },
			WarningMsg        = { fg = c.fg, bg = utils.blend(c.constant, c.bg, 0.25) },
			ModeMsg           = { fg = c.fg, bg = utils.blend(c.constant, c.bg, 0.25) },
			Directory         = { fg = c.hint },
			QuickFixLine      = { fg = c.fg, bg = utils.blend(c.constant, c.bg, 0.25), underline = true },
			qfLineNr          = { fg = c.comment },

			-- Syntax
			Keyword           = { fg = c.keyword },
			Conditional       = { link = "Keyword" },
			Repeat            = { link = "Keyword" },
			Label             = { link = "Keyword" },
			Exception         = { link = "Keyword" },
			Statement         = { link = "Keyword" },
			Operator          = { link = "Keyword" },
			Delimiter         = { fg = c.number },
			Type              = { link = "Keyword" },
			Structure         = { link = "Keyword" },
			Identifier        = { fg = c.fg },
			PreProc           = { link = "Keyword" },
			Include           = { link = "Keyword" },
			Define            = { link = "Keyword" },
			PreCondit         = { link = "Keyword" },
			StorageClass      = { link = "Keyword" },
			Typedef           = { link = "Keyword" },
			Tag               = { link = "Keyword" },
			Function          = { fg = c.func, bold = opts.bold },
			Title             = { fg = c.func, bold = opts.bold },
			String            = { fg = c.string, italic = opts.italic },
			Character         = { link = "String" },
			Number            = { fg = c.constant },
			Boolean           = { fg = c.constant },
			Float             = { fg = c.constant },
			Constant          = { fg = c.constant },
			Macro             = { fg = c.constant },
			Comment           = { fg = c.comment, italic = opts.italic },
			Todo              = { fg = c.bg, bg = c.hint, bold = opts.bold },
			Special           = { fg = c.fg },
			SpecialChar       = { link = "Special" },
			SpecialComment    = { link = "Comment" },
			Error             = { fg = c.error },
			Debug             = { fg = c.constant },
			LspInlayHint      = { fg = c.comment },
      Underlined        = { underline = true },

			-- Treesitter
			["@function"]              = { link = "Function" },
			["@function.call"]         = { fg = c.fg },
			["@function.builtin"]      = { fg = c.fg },
			["@function.macro"]        = { link = "Macro" },
			["@function.method"]       = { link = "Function" },
			["@function.method.call"]  = { fg = c.fg },

			["@keyword"]               = { link = "Keyword" },
			["@keyword.function"]      = { link = "Keyword" },
			["@keyword.return"]        = { fg = c.func, bold = opts.bold },
			["@keyword.conditional"]   = { link = "Conditional" },
			["@keyword.exception"]     = { link = "Exception" },
			["@keyword.import"]        = { link = "Include" },
			["@keyword.operator"]      = { link = "Operator" },
			["@operator"]              = { link = "Operator" },
			["@punctuation"]           = { link = "Keyword" },
			["@punctuation.delimiter"] = { fg = c.number },
			["@punctuation.bracket"]   = { fg = c.number },
			["@punctuation.special"]   = { fg = c.number },

			["@variable"]           = { link = "Identifier" },
			["@variable.builtin"]   = { link = "Constant" },
			["@variable.parameter"] = { link = "Identifier" },
			["@variable.member"]    = { link = "Identifier" },
			["@property"]           = { link = "Identifier" },
			["@attribute"]          = { link = "Keyword" },
			["@module"]             = { link = "Structure" },

			["@constant"]           = { link = "Constant" },
			["@constant.builtin"]   = { link = "Constant" },
			["@string"]             = { link = "String" },
			["@string.regexp"]      = { link = "String" },
			["@string.escape"]      = { link = "Special" },
			["@string.special"]     = { link = "Special" },
			["@character"]          = { link = "Character" },
			["@number"]             = { link = "Number" },
			["@boolean"]            = { link = "Boolean" },
			["@constructor"]        = { link = "Identifier" },

			["@tag"]                = { link = "Keyword" },
			["@tag.delimiter"]      = { link = "Keyword" },
			["@tag.attribute"]      = { link = "Keyword" },

			["@markup.heading"]     = { link = "Title" },
			["@markup.italic"]      = { fg = c.fg, italic = true },
      ["@markup.strong"]      = { fg = c.fg, bold = true },
			["@markup.link"]        = { link = "Underlined" },
			["@markup.link.uri"]    = { link = "Underlined" },
			["@markup.list"]        = { fg = c.constant },
			["@markup.raw"]         = { link = "Constant" },
			["@markup.quote"]       = { link = "Comment" },

			-- Diff / Git
			DiffAdd     = { fg = c.add, bg = utils.blend(c.add, bg, 0.2) },
			DiffChange  = { fg = c.change, bg = utils.blend(c.change, bg, 0.2) },
			DiffDelete  = { fg = c.delete, bg = utils.blend(c.delete, bg, 0.2) },
			DiffText    = { fg = c.change, bg = utils.blend(c.change, bg, 0.4) },

			["@text.diff.add"]    = { link = "DiffAdd" },
			["@text.diff.delete"] = { link = "DiffDelete" },
			["@diff.plus"]        = { link = "GitSignsAdd" },
			["@diff.minus"]       = { link = "GitSignsDelete" },
			["@diff.delta"]       = { link = "GitSignsChange" },

			-- Diagnostics
			DiagnosticError = { fg = c.error },
			DiagnosticWarn  = { fg = c.constant },
			DiagnosticHint  = { fg = c.hint },
			DiagnosticInfo  = { fg = c.fg },

			-- Gitsigns
			GitSignsAdd    = { fg = c.add },
			GitSignsChange = { fg = c.change },
			GitSignsDelete = { fg = c.delete },

			-- Blink
			BlinkCmpLabelMatch = { fg = c.constant },

			-- Mini.pick
			MiniPickMatchRanges = { fg = c.constant },

			-- Oil
			OilCreate = { fg = c.add },

			-- Snacks
			SnacksPickerDir = { fg = c.keyword },
			SnacksPickerMatch = { fg = c.constant },
		}
	end
	return groups
end

return M
