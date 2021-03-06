local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then return end

local gps_status_ok, gps = pcall(require, 'nvim-gps')
if not gps_status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      'alpha',
      'dap-repl',
      'dapui_breakpoints',
      'dapui_scopes',
      'dapui_stacks',
      'dapui_watches',
      'NvimTree'
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      gps.get_location,
      cond = gps.is_available
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree'}
})

