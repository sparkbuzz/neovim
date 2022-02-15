local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

local function attach()
  print('Attaching...')
  dap.run({
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = { '<node-internals>/**/*.js' }
  })
end

return {
  attach = attach
}
