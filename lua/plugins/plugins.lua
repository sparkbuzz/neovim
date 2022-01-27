local fn = vim.fn 

-- Automatically install Packer
--
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing Packer..."
  vim.cmd [[packadd packer.nvim]]
end

-- Safely load Packer 
--
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Plugin installation
--
return packer.startup(function(use)
  -- Plugins
  use "nvim-lua/plenary.nvim"
  use "wbthomason/packer.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

