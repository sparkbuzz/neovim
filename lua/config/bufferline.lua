local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    custom_filter = function(buf, buf_nums)
      return
        not vim.fn.bufname(buf):match('term') and
        vim.bo[buf].filetype ~= 'dap-repl'
    end,

    -- Diagnostics
    --
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count)
      return '(' .. count .. ')'
    end,

    -- Icons
    --
    buffer_close_icon = '',
    close_icon = '',
    indicator_icon = '▎',
    modified_icon = '●',

    left_trunc_marker = '',
    right_trunc_marker = '',

    -- Commands
    --
    close_command = 'Bdelete! %d',
    right_mouse_command = 'Bdelete! %d',
    left_mouse_command = 'buffer %d',
    middle_mouse_command = nil,

    -- Miscellaneous
    --
    always_show_bufferline = true,
    enforce_regular_tabs = true,
    max_name_length = 30,
    max_prefix_length = 30,
    offsets = {
      {
        filetype = 'NvimTree',
        padding = 1,
        text = 'File Explorer',
        text_align = 'left',
      },
    },
    persist_buffer_sort = true,
    separator_style = 'thin',
    show_buffer_close_icons = true,
    show_buffer_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    sort_by = 'id',
  },
})
