-- Load config files from ./lua/config/
--
local files = io.popen('find ./lua/config -type f')
for file in files:lines() do
  local req_file = file:gmatch("(config%/.+)%.lua$"){0}:gsub("/", ".")
  -- print ("Loading config: " .. req_file) 
  require (req_file)
end

