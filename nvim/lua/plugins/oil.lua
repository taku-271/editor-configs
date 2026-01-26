return {
  "stevearc/oil.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("oil").setup()
  end,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} }
  },
  keys = {
    {
      "<leader>e", function () require("oil").open() end,
    },
  },
}
