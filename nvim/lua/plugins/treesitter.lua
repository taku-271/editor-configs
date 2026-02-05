return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "python", "go", "markdown", "markdown_inline" },
    })
  end,
}
