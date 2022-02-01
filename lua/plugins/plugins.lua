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

-- Show Packer window in a popup
--
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end
  }
}

-- Plugin installation
--
return packer.startup(function(use)
  -- Plugins
  --
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'

  -- Commenting
  --
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  --
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Nvim Tree
  --
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope
  --
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }

  -- Treesitter
  --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/playground'

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

