local status_ok, dapui = pcall(require, 'dapui')

if not status_ok then
  return
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    elements = {
      {
        id = "scopes",
        size = 0.25,
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 60,
    position = "right",
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom",
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>d/', '<cmd>lua require("dapui").toggle()<cr>', opts)
