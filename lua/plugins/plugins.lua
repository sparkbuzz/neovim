local status_ok, impatient = pcall(require, 'impatient')
if status_ok then
  impatient.enable_profile()
end

local fn = vim.fn
local packer_bootstrap

-- Automatically install Packer
--
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  print 'Installing Packer...'
  vim.cmd [[packadd packer.nvim]]
end

-- Safely load Packer
--
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

packer.init {
  compile_path = fn.stdpath('data') .. '/.packer/packer_compiled.lua',
  display = {
    open_fn = function()
      -- Show Packer window in a popup
      return require('packer.util').float { border = 'rounded' }
    end
  }
}

-- Plugin installation
--
return packer.startup(function(use)
  -- Plugins
  --
  use 'akinsho/toggleterm.nvim'
  use 'folke/which-key.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'rcarriga/nvim-notify'
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'
  -- use({
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  -- })
  use 'windwp/nvim-ts-autotag'

  -- Buffers
  --
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'

-- Commenting
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Debugging
  --
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap'
    }
  }

  -- Git
  --
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Lualine
  --
  use 'nvim-lualine/lualine.nvim'
  use 'SmiteshP/nvim-gps'

  -- Nvim Tree
  --
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope
  --
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'nvim-telescope/telescope-project.nvim'

  -- Testing
  --
  use 'vim-test/vim-test'

  -- Treesitter
  --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/playground'
  use 'simrat39/symbols-outline.nvim'

  -- Theme
  --
  use 'navarasu/onedark.nvim'

  -- Code completion
  --
  use 'hrsh7th/nvim-cmp'

  -- Completion sources for nvim-cmp
  --
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  --
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'weilbith/nvim-code-action-menu'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Snippets
  --
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Set up configuration after cloning packer.nvim
  --
  if packer_bootstrap then
    require('packer').sync()
  end
end)

