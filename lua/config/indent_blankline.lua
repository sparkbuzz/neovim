local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars:append('eol:↴')
vim.opt.listchars:append('trail:.')

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#393f4a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#98c379 gui=nocombine]])

indent_blankline.setup({
  char_highlight_list = {
    'IndentBlanklineIndent1',
  },
  show_current_context = true,
  show_end_of_line = true,
})
