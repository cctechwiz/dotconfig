-- From: https://github.com/cwrenhold/nvim-config-2024/blob/main/lua/plugins/lspconfig.lua
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',

  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
      opts = {
        ui = {
          border = 'rounded',
          height = 0.7,
          width = 0.7,
        },
      },
    },

    { 'williamboman/mason-lspconfig.nvim' },

    { 'saghen/blink.cmp' },

    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      local telescope = require('telescope.builtin')

      -- TODO: Move to a keymaps config file
      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
      nmap('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      --nmap('<leader>ff', vim.lsp.buf.format, '[F]ormat [F]ile')
    end

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    --
    --  If you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- html = { filetypes = { 'html', 'twig', 'hbs'} },

      ts_ls = {},

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      automatic_installation = true,
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }

    require('lspconfig.ui.windows').default_options.border = 'rounded'

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {
        border = 'rounded',
        focusable = true,
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.7),
      }
    )
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      {
        border = 'rounded',
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.7),
      }
    )

    -- LSP Autocommands --
    --   :help vim.lsp
    -- vim.api.nvim_create_autocmd('LspAttach', {
    --   callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     if not client then return end
    --
    --     if client.supports_method('textDocument/formatting') then
    --       -- Format the current buffer on save
    --       vim.api.nvim_create_autocmd('BufWritePre', {
    --         buffer = args.buf,
    --         callback = function()
    --           -- LSP server uses .editorconfig to set indent size, etc when formatting
    --           vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
    --         end,
    --       })
    --     end
    --   end,
    -- })
  end
}
