local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then return end

local gps_status_ok, gps = pcall(require, 'nvim-gps')
if not gps_status_ok then
  return
end

lualine.setup({
  options = {
    component_separators = { 
      left = '',
      right = '' 
    },
    disabled_filetypes = {
      'alpha', 'NvimTree'
    },
    section_separators = {
      left = '',
      right = ''
    },
  },
  sections = {
    lualine_c = {
      {
        gps.get_location,
        cond = gps.is_available,
      }
    }
  },
  extensions = {
    'nvim-tree',
  },
})

