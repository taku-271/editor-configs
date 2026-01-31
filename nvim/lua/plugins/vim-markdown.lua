return {
  "preservim/vim-markdown",
  dependencies = { "godlygeek/tabular" },
  ft = { "markdown" },
  config = function()
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_conceal = 0
    vim.g.vim_markdown_conceal_code_bloks = 0
    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_strikethrough = 1
  end,
}

