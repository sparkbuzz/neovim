local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then return end

local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

-- Loads snippets from plugin rafamadriz/friendly-snippets
--
require('luasnip.loaders.from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

-- Configure kind icons for completion popup
--
local kind_icons = {
  Class = '',
  Color = '',
  Constant = '',
  Constructor = '',
  Enum = '',
  EnumMember = '',
  Event = '',
  Field = '',
  File = '',
  Folder = '',
  Function = '',
  Interface = '',
  Keyword = '',
  Method = 'm',
  Module = '',
  Operator = '',
  Property = '',
  Reference = '',
  Snippet = '',
  Struct = '',
  Text = '',
  TypeParameter = '',
  Unit = '',
  Value = '',
  Variable = ''
}

cmp.setup({
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  documentation = {
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  },

  experimental = {
    ghost_text = true,
    native_menu = false,
  },

  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      vim_item.menu = ({
        buffer = '[Buffer]',
        luasnip = '[Snippet]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[LSP:Lua]',
        path = '[Path]'
      })[entry.source.name]
      return vim_item
    end,
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  sources = {
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' }
  }
})

