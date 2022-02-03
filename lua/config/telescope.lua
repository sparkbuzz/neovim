local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    path_display = { 'smart' },
    winblend = 10,

    layout_config = {
      horizontal = {
        height = 0.5,
        width = 0.5,
      },
    },

    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,

        ['<C-c>'] = actions.close,
      },

      n = {
        ['<esc>'] = actions.close,

        ['j'] = actions.move_selection_next,
        ['k'] = actions.move_selection_previous,

        ['?'] = actions.which_key,
      },
    },
  },

  pickers = {
    find_files = {
      previewer = false,
    },
  },
})
