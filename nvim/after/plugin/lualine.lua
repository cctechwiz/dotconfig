--Buffer line
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    --diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --  local s = " "
    --  for e, n in pairs(diagnostics_dict) do
    --    local sym = e == "error" and " "
    --        or (e == "warning" and " " or "")
    --    s = s .. n .. sym
    --  end
    --  return s
    --end
  }
})

--Status line
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin-mocha',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },

  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
})
