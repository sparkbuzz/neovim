local status_ok, gps = pcall(require, 'nvim-gps')
if not status_ok then
  return
end

gps.setup({
	icons = {
		['class-name'] = ' ',
		['function-name'] = ' ',
		['method-name'] = ' ',
		['container-name'] = '⛶ ',
		['tag-name'] = '炙',
	},

	languages = {
		['json'] = {
			icons = {
				['array-name'] = ' ',
				['object-name'] = ' ',
				['null-name'] = '[] ',
				['boolean-name'] = 'ﰰﰴ ',
				['number-name'] = '# ',
				['string-name'] = ' '
			}
		},
		['toml'] = {
			icons = {
				['table-name'] = ' ',
				['array-name'] = ' ',
				['boolean-name'] = 'ﰰﰴ ',
				['date-name'] = ' ',
				['date-time-name'] = ' ',
				['float-name'] = ' ',
				['inline-table-name'] = ' ',
				['integer-name'] = '# ',
				['string-name'] = ' ',
				['time-name'] = ' '
			}
		},
		['yaml'] = {
			icons = {
				['mapping-name'] = ' ',
				['sequence-name'] = ' ',
				['null-name'] = '[] ',
				['boolean-name'] = 'ﰰﰴ ',
				['integer-name'] = '# ',
				['float-name'] = ' ',
				['string-name'] = ' '
			}
		},
	},
	separator = ' > ',
	depth = 0,
	depth_limit_indicator = '..'
})
