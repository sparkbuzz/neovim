local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
  [[ ██████   █████                   █████   █████  ███                 ]],
  [[░░██████ ░░███                   ░░███   ░░███  ░░░                  ]],
  [[ ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████  ]],
  [[ ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███ ]],
  [[ ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███ ]],
  [[ ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███ ]],
  [[ █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████]],
  [[░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
}

alpha.setup(dashboard.opts)

local v = vim.version()
local plugins_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))

dashboard.section.footer.val = {
  'Neovim version ' .. v.major .. '.' .. v.minor .. '.' .. v.patch,
  'Loaded ' .. plugins_count .. ' plugins',
}
