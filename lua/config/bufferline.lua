local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then return end

bufferline.setup({
  options = {
    -- Icons
    --
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    close_command = 'Bdelete! %d',
    numbers = 'none',
    number_style = 'superscript',
    right_mouse_command = 'Bdelete! %d',
    left_mouse_command = 'buffer %d',
    middle_mouse_command = nil,

    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count)
      return '(' .. count .. ')'
    end,
    offsets = {{
      filetype = 'NvimTree',
      padding = 1,
      text = 'File Explorer',
      text_align = 'left'
    }},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = 'thin',
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'id'
  }
})

