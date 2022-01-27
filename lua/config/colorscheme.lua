-- Configure and load color scheme 
--
local colorScheme = 'onedark'
local fallbackScheme = 'slate'
local status_ok, onedark = pcall(require, colorScheme)

if not status_ok then
  vim.cmd('colorscheme ' .. fallbackScheme)
  vim.notify('Colorscheme `' .. colorScheme .. '` not found, defaulting to `' .. fallbackScheme .. '`.')
else
  onedark.setup { style = 'dark' }
  onedark.load()
end


