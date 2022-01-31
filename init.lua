-- Requires all files from the given folder within ./lua/{path}
--
local function requirePath(path)
  local config_path = vim.fn.stdpath('config')
  local files = io.popen('find ' .. config_path .. '/lua/' .. path .. ' -type f -maxdepth 1')

  for file in files:lines() do
    local req_file = file:gmatch('%/lua%/(.+).lua$'){0}:gsub('/', '.')
    local status_ok, _ = pcall(require, req_file)

    if not status_ok then
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
    end
  end
end

-- Load config files & plugins
--
requirePath('plugins')
requirePath('config')

