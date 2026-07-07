-- One Dark Darkened colorscheme for Neovim.
-- Mirrors the Zed extension "One Dark - Darkened" by Pavle Sokic so the
-- editor palette matches Ghostty and the rest of the desktop.
-- Source of truth: ~/Library/Application Support/Zed/extensions/installed/one-dark-darkened/themes/one-dark-darkened.json
return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      -- Override only the named color palette; onedarkpro regenerates its
      -- built-in highlights from these. Custom highlight overrides are applied
      -- via nvim_set_hl after the colorscheme loads, to avoid onedarkpro's
      -- compile step which does not handle all value shapes.
      require("onedarkpro").setup({
        options = {
          transparency = false,
          cursorline = true,
          bold = true,
          italic = true,
          underline = true,
          undercurl = true,
          term_colors = true,
        },
        colors = {
          onedark = {
            bg = "#17191d",
            fg = "#bfc4cd",
            bg_alt = "#1e2228",
            fg_alt = "#b5b8bf",
            blue = "#73ade9",
            cyan = "#6eb4bf",
            green = "#a1c181",
            grey = "#5d636f",
            dark_grey = "#696b77",
            light_grey = "#acb2be",
            medium_grey = "#838994",
            orange = "#bf956a",
            purple = "#b477cf",
            red = "#e78284",
            yellow = "#dfc184",
            dark_cyan = "#56b6c2",
            dark_red = "#d07277",
            bright_yellow = "#dec184",
            highlight = "#2a2f38",
            selection = "#74ade8",
            comment = "#5d636f",
            line_nr = "#5d636f",
            current_line_nr = "#e5e7ea",
            none = "NONE",
          },
        },
      })
      vim.cmd("colorscheme onedark")

      -- All custom highlight overrides applied directly via the nvim API.
      -- Re-applied on ColorScheme reload so :hi clear / theme switches restore.
      local function apply_overrides()
        local hi = vim.api.nvim_set_hl

        -- Editor chrome
        hi(0, "Normal", { bg = "#17191d", fg = "#bfc4cd" })
        hi(0, "NormalNC", { bg = "#17191d", fg = "#bfc4cd" })
        hi(0, "CursorLine", { bg = "#2a2f38" })
        hi(0, "CursorLineNr", { fg = "#e5e7ea", bg = "#2a2f38" })
        hi(0, "LineNr", { fg = "#5d636f" })
        hi(0, "SignColumn", { bg = "#17191d" })
        hi(0, "VertSplit", { fg = "#2f323b", bg = "#17191d" })
        hi(0, "WinSeparator", { fg = "#2f323b", bg = "#17191d" })
        hi(0, "StatusLine", { bg = "#1e2128", fg = "#bfc4cd" })
        hi(0, "StatusLineNC", { bg = "#202329", fg = "#b5b8bf" })
        hi(0, "TabLine", { bg = "#202329", fg = "#b5b8bf" })
        hi(0, "TabLineFill", { bg = "#1a1e23" })
        hi(0, "TabLineSel", { bg = "#17191d", fg = "#bfc4cd" })
        hi(0, "Pmenu", { bg = "#1d2127", fg = "#bfc4cd" })
        hi(0, "PmenuSel", { bg = "#454a56", fg = "#bfc4cd" })
        hi(0, "PmenuSbar", { bg = "#1d2127" })
        hi(0, "PmenuThumb", { bg = "#454a56" })
        hi(0, "Visual", { bg = "#3a4250" })
        hi(0, "Search", { bg = "#2e3646" })
        hi(0, "IncSearch", { bg = "#2e3646" })
        hi(0, "MatchParen", { bg = "#2e3646" })
        hi(0, "NonText", { fg = "#696b77" })
        hi(0, "Whitespace", { fg = "#696b77" })
        hi(0, "Folded", { bg = "#1d2127", fg = "#b5b8bf" })
        hi(0, "CursorColumn", { bg = "#2a2f38" })
        hi(0, "ColorColumn", { bg = "#1d2127" })
        hi(0, "Conceal", { fg = "#838994" })
        hi(0, "Directory", { fg = "#73ade9" })
        hi(0, "EndOfBuffer", { fg = "#17191d" })
        hi(0, "ErrorMsg", { fg = "#d07277" })
        hi(0, "ModeMsg", { fg = "#b5b8bf" })
        hi(0, "MoreMsg", { fg = "#73ade9" })
        hi(0, "Question", { fg = "#73ade9" })
        hi(0, "SpecialKey", { fg = "#696b77" })
        hi(0, "Title", { fg = "#d07277" })
        hi(0, "WarningMsg", { fg = "#dec184" })
        hi(0, "WildMenu", { bg = "#1d2127", fg = "#bfc4cd" })

        -- Base syntax
        hi(0, "Comment", { fg = "#5d636f", italic = true })
        hi(0, "Constant", { fg = "#dfc184" })
        hi(0, "String", { fg = "#a1c181" })
        hi(0, "Character", { fg = "#a1c181" })
        hi(0, "Number", { fg = "#bf956a" })
        hi(0, "Boolean", { fg = "#bf956a" })
        hi(0, "Float", { fg = "#bf956a" })
        hi(0, "Identifier", { fg = "#bfc4cd" })
        hi(0, "Function", { fg = "#73ade9" })
        hi(0, "Statement", { fg = "#b477cf" })
        hi(0, "Conditional", { fg = "#b477cf" })
        hi(0, "Repeat", { fg = "#b477cf" })
        hi(0, "Label", { fg = "#73ade9" })
        hi(0, "Operator", { fg = "#6eb4bf" })
        hi(0, "Keyword", { fg = "#b477cf" })
        hi(0, "Exception", { fg = "#b477cf" })
        hi(0, "PreProc", { fg = "#dce0e5" })
        hi(0, "Include", { fg = "#b477cf" })
        hi(0, "Define", { fg = "#b477cf" })
        hi(0, "Macro", { fg = "#b477cf" })
        hi(0, "Type", { fg = "#6eb4bf" })
        hi(0, "StorageClass", { fg = "#b477cf" })
        hi(0, "Structure", { fg = "#6eb4bf" })
        hi(0, "Typedef", { fg = "#6eb4bf" })
        hi(0, "Special", { fg = "#bf956a" })
        hi(0, "SpecialChar", { fg = "#bf956a" })
        hi(0, "Tag", { fg = "#74ade8" })
        hi(0, "Delimiter", { fg = "#b2b9c6" })
        hi(0, "SpecialComment", { fg = "#878e98" })
        hi(0, "Debug", { fg = "#bf956a" })
        hi(0, "Underlined", { fg = "#73ade9", underline = true })
        hi(0, "Ignore", { fg = "#696b77" })
        hi(0, "Error", { fg = "#d07277", bold = true })
        hi(0, "Todo", { fg = "#dec184", bold = true })

        -- Treesitter
        hi(0, "@keyword", { fg = "#b477cf" })
        hi(0, "@function", { fg = "#73ade9" })
        hi(0, "@function.builtin", { fg = "#73ade9" })
        hi(0, "@function.call", { fg = "#73ade9" })
        hi(0, "@method", { fg = "#73ade9" })
        hi(0, "@constructor", { fg = "#73ade9" })
        hi(0, "@type", { fg = "#6eb4bf" })
        hi(0, "@type.builtin", { fg = "#6eb4bf" })
        hi(0, "@variable", { fg = "#bfc4cd" })
        hi(0, "@variable.builtin", { fg = "#bf956a" })
        hi(0, "@constant", { fg = "#dfc184" })
        hi(0, "@constant.builtin", { fg = "#bf956a" })
        hi(0, "@string", { fg = "#a1c181" })
        hi(0, "@string.special", { fg = "#bf956a" })
        hi(0, "@string.escape", { fg = "#878e98" })
        hi(0, "@number", { fg = "#bf956a" })
        hi(0, "@boolean", { fg = "#bf956a" })
        hi(0, "@operator", { fg = "#6eb4bf" })
        hi(0, "@punctuation", { fg = "#acb2be" })
        hi(0, "@punctuation.bracket", { fg = "#b2b9c6" })
        hi(0, "@punctuation.delimiter", { fg = "#b2b9c6" })
        hi(0, "@comment", { fg = "#5d636f", italic = true })
        hi(0, "@comment.documentation", { fg = "#878e98" })
        hi(0, "@property", { fg = "#e78284" })
        hi(0, "@tag", { fg = "#74ade8" })
        hi(0, "@tag.attribute", { fg = "#74ade8" })
        hi(0, "@tag.delimiter", { fg = "#b2b9c6" })
        hi(0, "@attribute", { fg = "#74ade8" })
        hi(0, "@namespace", { fg = "#c8ccd4" })
        hi(0, "@module", { fg = "#c8ccd4" })
        hi(0, "@label", { fg = "#74ade8" })
        hi(0, "@text.literal", { fg = "#a1c181" })
        hi(0, "@text.reference", { fg = "#73ade9" })
        hi(0, "@text.uri", { fg = "#6eb4bf" })
        hi(0, "@markup.heading", { fg = "#d07277" })
        hi(0, "@markup.list", { fg = "#d07277" })
        hi(0, "@markup.raw", { fg = "#a1c181" })
        hi(0, "@markup.link", { fg = "#73ade9" })
        hi(0, "@diff.plus", { fg = "#a1c181" })
        hi(0, "@diff.minus", { fg = "#d07277" })
        hi(0, "@diff.delta", { fg = "#dec184" })

        -- LSP semantic tokens
        hi(0, "@lsp.type.variable", { fg = "#bfc4cd" })
        hi(0, "@lsp.type.property", { fg = "#e78284" })
        hi(0, "@lsp.type.function", { fg = "#73ade9" })
        hi(0, "@lsp.type.method", { fg = "#73ade9" })
        hi(0, "@lsp.type.namespace", { fg = "#c8ccd4" })
        hi(0, "@lsp.type.class", { fg = "#6eb4bf" })
        hi(0, "@lsp.type.type", { fg = "#6eb4bf" })
        hi(0, "@lsp.type.parameter", { fg = "#bf956a" })
        hi(0, "@lsp.type.enumMember", { fg = "#d07277" })
        hi(0, "@lsp.type.macro", { fg = "#b477cf" })
        hi(0, "@lsp.type.decorator", { fg = "#74ade8" })

        -- Diagnostics
        hi(0, "DiagnosticError", { fg = "#d07277" })
        hi(0, "DiagnosticWarn", { fg = "#dec184" })
        hi(0, "DiagnosticInfo", { fg = "#74ade8" })
        hi(0, "DiagnosticHint", { fg = "#787c85" })
        hi(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#d07277" })
        hi(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#dec184" })
        hi(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#74ade8" })
        hi(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#787c85" })

        -- Git signs
        hi(0, "GitSignsAdd", { fg = "#a1c181" })
        hi(0, "GitSignsChange", { fg = "#dec184" })
        hi(0, "GitSignsDelete", { fg = "#d07277" })
      end

      apply_overrides()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "onedark",
        callback = apply_overrides,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
