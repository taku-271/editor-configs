local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "jj", "<Esc>", opts)

map("n", "x", '"_x', opts)

