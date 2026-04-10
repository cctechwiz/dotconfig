return {
  {
    "neovim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})

      -- Install parsers not bundled with Neovim 0.12
      local ensure_installed = {
        "bash",
        "diff",
        "dockerfile",
        "gdscript",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "helm",
        "html",
        "http",
        "hurl",
        "ini",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "just",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "php",
        "python",
        "query",
        "regex",
        "sql",
        "ssh_config",
        "tmux",
        "toml",
        "tsv",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      local installed = require("nvim-treesitter").get_installed()
      local to_install = vim.iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(installed, parser)
        end)
        :totable()

      if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
      end

      -- Enable treesitter highlighting via Neovim's built-in API
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
        callback = function(args)
          -- Disable for large files
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
