local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then return end

autopairs.setup({
  check_ts = true,
  fast_wrap = {
    chars = { '{', '[', '(', "'", '"' },
    check_comma = true,
    end_key = '$',
   highlight_grey = 'Comment',
    highlight = 'Search',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    map = '<M-e>',
    offset = 0,
   pattern = string.gsub([[ [%'%'%)%>%]%)%}%,] ]], '%s+', '')
  },
  ts_config = {
    java = false,
    javascript = { 'template_string' },
    lua = { 'string' }
  }
})

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then return end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })

