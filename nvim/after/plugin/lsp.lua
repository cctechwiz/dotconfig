local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver', -- [[ Typescript/Javascript ]]
  'gopls', -- [[ Golang ]]
  'lua_ls', -- [[ Lua ]]
  'jedi_language_server', -- [[ Python ]]
  'intelephense', -- [[ PHP ]]
  --'gdscript', -- [[ Godot/GDScript ]]
})

--neodev replaces the following config block but only in neovim lua configs
--require('neodev').setup()
-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  --on_attach = function(client, bufnr)
    --    print('hello lua-language-server')
    --end,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
         version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      }
    }
})

local get_intelephense_license = function ()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

lsp.configure("intelephense", {
    on_attach = lsp.on_attach,
    init_options = {
        licenceKey = get_intelephense_license()
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  --https://github.com/sourcegraph/sg.nvim/blob/master/lua/sg/extensions/cmp.lua
  ['<C-a>'] = cmp.mapping.complete {
    config = {
      sources = {
        {name = "cody" },
      },
    },
  },
})

--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vs", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[[", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]]", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

require('fidget').setup()

require("sg").setup()
