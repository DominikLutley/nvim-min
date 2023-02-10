local wk = require("which-key")

-- vim.keymap.set('n', '<leader>f', "<cmd>Telescope find_files<cr>", {})
-- vim.keymap.set('n', '<leader>/', "<cmd>Telescope live_grep<cr>", {})
-- vim.keymap.set('n', '<leader>b', "<cmd>Telescope buffers<cr>", {})
-- vim.keymap.set('n', '<leader>h', "<cmd>Telescope help_tags<cr>", {})

wk.register({
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "File Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
}, { prefix = "<leader>" })
