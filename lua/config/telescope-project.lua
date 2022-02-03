local status_ok, _ = pcall(require, 'telescope')
if not status_ok then
  return
end

vim.api.nvim_set_keymap(
  'n',
  '<leader>fp', ':lua require("telescope").extensions.project.project({})<cr>',
  {
    noremap = true,
    silent = true,
  }
)
