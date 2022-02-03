local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = 'S',
    unmerged = '',
    renamed = '➜',
    deleted = '',
    untracked = 'U',
    ignored = '◌'
  },
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = ''
  }
}

nvim_tree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = ''
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = 'yes'
  },
  trash = {
    cmd = 'trash',
    require_confirm = true
  }
}

local M = {}

require('nvim-tree.events').on_nvim_tree_ready(function()
  vim.g.nvim_tree_ready = 1
end)

-- This function updates the nvim-tree root path once the working dir changes.
--
function M.update_cwd()
  if vim.g.nvim_tree_ready == 1 then
    local view = require('nvim-tree.view')
    local lib = require('nvim-tree.lib')
    if view.win_open() then
      lib.change_dir(vim.fn.getcwd())
    end
  end
end

-- Run NvimtreeConfig.update_cwd() when DirChanged occurs
--
vim.api.nvim_exec(
  [[
  augroup NvimTreeConfig
    autocmd!
    autocmd DirChanged * lua NvimTreeConfig.update_cwd()
  augroup END
  ]],
  false
)

_G.NvimTreeConfig = M
