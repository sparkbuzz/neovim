-- Requires all files from the given folder within ./lua/{path} 
--
function requirePath(path) 
  local count = 0
  local files = io.popen('find ./lua/' .. path .. ' -type f')

  for file in files:lines() do
    local req_file = file:gmatch("(" .. path .. "%/.+)%.lua$"){0}:gsub("/", ".")
    require (req_file)
    vim.notify('Loaded ' .. req_file)
    count = count + 1
  end
end

-- Load config files & plugins
--
requirePath('plugins')
requirePath('config')

