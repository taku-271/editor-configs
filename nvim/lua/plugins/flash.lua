return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    label = {
      before = true,
      after = false,
    },
    jump = {
      autojump = true
    },
    modes = {
      search = {
        enabled = true
      },
    },
  },
  keys = {
    { "<leader><CR>", mode = {"n", "x", "o"}, function() require("flash").jump() end},
  }
}
