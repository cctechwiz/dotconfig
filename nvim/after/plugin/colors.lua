function SetColors(color)
  color = color or 'catppuccin-mocha'

  -- Docs: https://github.com/catppuccin/nvim
  require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })

  require('kanagawa').setup({
    undercurl = true,
    transparent = true,
    dimInactive = false,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
            bg = "none",
          }
        }
      }
    }
  })

  -- Default options
  require('github-theme').setup({
    options = {
      hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
      hide_nc_statusline = true, -- Override the underline style for non-active statuslines
      transparent = true,       -- Disable setting bg (make neovim's background transparent)
      terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false,      -- Non focused panes set to alternative background
    }
  })

  -- vim.g.tokyonight_dark_float = false
  -- vim.g.tokyonight_colors = { bg_float = 'none' }

  -- https://github.com/sainnhe/everforest/blob/master/doc/everforest.txt (:help everforest)
  -- vim.g.everforest_background = 'hard'
  -- vim.g.everforest_transparent_background = 2
  -- vim.g.everforest_better_performance = 1
  -- vim.g.everforest_diagnostic_text_highlight = 1
  -- vim.g.everforest_diagnostic_virtual_text = 'colored'

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTitle', { ctermbg = 'none', bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTask', { ctermbg = 'none', bg = 'none' })
end

SetColors()
