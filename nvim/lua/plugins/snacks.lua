return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
    },
    notifier = {
      enabled = true,
      timeout = 2000,
    },
    indent = {
      enabled = false
    },
    scope = {
      enabled = false,
    },
    scroll = {
      enabled = true,
    },
    words = {
      enabled = true,
    },
    input = {
      enabled = true,
    },
    select = {
      enabled = true,
    },
    bigfile = {
      enabled = true,
    },
    terminal = {
      enabled = false,
    },
    picker = {
      enabled = true,
      ui_select = true,
      formatters = {
        file = {
          filename_first = true,
          truncate = 400,
        },
      },
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, },
    { "<leader>fg", function() Snacks.picker.grep() end, },
    { "<leader>fw", function() Snacks.picker.grep_word() end, },
  }
}
