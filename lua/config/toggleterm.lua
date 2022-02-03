local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

local function size_window(terminal)
  if terminal.direction == 'horizontal' then
    return 15
  elseif terminal.direction == 'vertical' then
    return vim.o.columns * 0.4
  end
end

toggleterm.setup({
  size = size_window,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 8,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
