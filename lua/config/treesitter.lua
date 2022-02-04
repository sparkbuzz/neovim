local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup({
  ensure_installed = 'maintained',
  ignore_install = {''},
  sync_install = false,

  autopairs = {
    enable = true
  },

  autotag = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },

  highlight = {
    disable = {''},
    enable = true,
    additional_vim_regex_highlighting = true
  },

  indent = {
    disable = {'yaml'},
    enable = true
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
})

