return {
  "romgrk/barbar.nvim",
  lazy = false,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function () vim.g.barbar_auto_setup = false end,
  opts = {},
  keys = {
    {"<C-j>", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
    {"<C-k>", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
    {"<leader>w", "<Cmd>BufferClose<CR>", desc = "Close Buffer"},
  },
}

