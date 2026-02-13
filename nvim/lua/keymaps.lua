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

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

map("n", "rn", "<cmd> lua vim.lsp.buf.rename()<CR>", opts)

map("n", "R", "<Plug>(operator-replace)", opts)
map("v", "R", "<Plug>(operator-replace)", opts)

map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
