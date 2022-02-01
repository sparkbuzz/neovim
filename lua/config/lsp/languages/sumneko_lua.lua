return {
	settings = {
		Lua = {
			diagnostics = {
        -- Get LSP server to recognize the `vim` globa
        --
				globals = { 'vim' }
			},
      runtime = {
        -- Neovim uses LuaJIT
        --
        version = 'LuaJIT'
      },
      telemetry = {
        -- Disable telemetry data
        --
        enable = false
      },
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true
				}
			}
		}
	}
}

