local g = vim.g
local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- jk to ESC
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Switch buffers
keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

keymap("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })
