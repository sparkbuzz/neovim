local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>tn', ':TestNearest<cr>', opts)
keymap('n', '<leader>tf', ':TestFile<cr>', opts)
keymap('n', '<leader>ts', ':TestSuite<cr>', opts)
keymap('n', '<leader>tl', ':TestLast<cr>', opts)
keymap('n', '<leader>tv', ':TestVisit<cr>', opts)
