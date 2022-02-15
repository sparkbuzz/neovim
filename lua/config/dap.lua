local status_ok
local dap

status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/Projects/3rdparty/vscode-node-debug2/out/src/nodeDebug.js' }
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal'
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process
  }
}

vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#31353f' }, false)
vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379', guibg='#31353f' }, false)

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

-- Virtual Text Plugin
--

local virtual_text
status_ok, virtual_text = pcall(require, 'nvim-dap-virtual-text')
if status_ok then
  virtual_text.setup({
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
})
end

-- DAP keymaps
--

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Breakpoints
--
keymap('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts)
keymap('n', '<leader>dB', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts)
keymap('n', '<leader>de', '<cmd>lua require("dap").set_exception_breakpoints({"all"})<cr>', opts)
keymap('n', '<leader>dc', '<cmd>lua require("dap").clear_breakpoints()<cr>', opts)

-- Navigation
--
keymap('n', '<a-j>', '<cmd>lua require("dap").step_over()<cr>', opts)
keymap('n', '<a-J>', '<cmd>lua require("dap").step_into()<cr>', opts)
keymap('n', '<a-k>', '<cmd>lua require("dap").step_out()<cr>', opts)
keymap('n', '<a-r>', '<cmd>lua require("dap").run_to_cursor()<cr>', opts)
keymap('n', '<leader>dk', '<cmd>lua require("dap").up()<cr>', opts)
keymap('n', '<leader>dj', '<cmd>lua require("dap").down()<cr>', opts)

-- Stop & Start
--
keymap('n', '<c-r>', '<cmd>lua require("dap").continue()<cr>', opts)
keymap('n', '<leader>da', '<cmd>lua require("dap-helpers").attach()<cr>', opts)
keymap('n', '<leader>dA', '<cmd>lua require("dap-helpers").attach_remote()<cr>', opts)
keymap('n', '<leader>dt', '<cmd>lua require("dap").terminate()<cr>', opts)

-- Other
--
keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.toggle({}, "vsplit")<cr><C-w>l', opts)
keymap('n', '<leader>di', '<cmd>lua require("dap.ui.widgets").hover()<cr>', opts)
keymap('n', '<leader>d.', '<cmd>lua local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.scopes)<cr>', opts)

-- Telescope
--
keymap('n', '<leader>df', ':Telescope dap frames<cr>', opts)
keymap('n', '<leader>dl', ':Telescope dap list_breakpoints<cr>', opts)
