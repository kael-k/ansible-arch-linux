require('nvim-treesitter.configs').setup {
  ensure_installed = { "python", "lua", "json", "bash", "yaml", "markdown", "html", "css", "rust", "c", "cpp", "javascript"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

