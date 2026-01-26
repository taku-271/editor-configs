return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup()
  end,
  keys = {
    { "<C-@>", "<cmd>1ToggleTerm direction=horizontal<cr>", mode = { "n", "t" } },
    { "<C-S-@>", "<cmd>1ToggleTerm direction=float<cr>", mode = { "n", "t" } }
  }
}

