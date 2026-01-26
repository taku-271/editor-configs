local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "jk", "<Esc>", opts)

map("n", "x", '"_x', opts)

map("v", "/", "<Esc>/\\%V", opts)

map("n", "<leader>s", ":split<Return>", opts)
map("n", "<leader>v", ":vsplit<Return>", opts)

map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

