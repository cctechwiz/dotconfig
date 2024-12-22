return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = {
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
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	highlight = {
	  enable = true,

	  -- Disable slow treesitter highlighting for large files
	  disable = function(lang, buf)
	    local max_filesize = 100 * 1024 -- 100 KB
	    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	    if ok and stats and stats.size > max_filesize then
	      return true
	    end
	  end,

	  additional_vim_regex_highlighting = false,
	},
      }
    end,
  }
}
