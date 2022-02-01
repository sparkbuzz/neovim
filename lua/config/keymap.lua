local opts = { noremap = true, silent = true}
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Set space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = n
--   insert_mode = i
--   visual_mode = v
--   visual_block_mode = x
--   term_mode = t
--   command_mode = c

-- Better window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep same content after paste
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
--
keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', term_opts)
keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', term_opts)
keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', term_opts)
keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', term_opts)

