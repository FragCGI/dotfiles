local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'jiangmiao/auto-pairs'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'glepnir/dashboard-nvim'
  use 'rafamadriz/friendly-snippets'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'itmecho/neoterm.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'famiu/nvim-reload'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use {'AlphaTechnolog/pywal.nvim', as = 'pywal'}
  use 'majutsushi/tagbar'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}} 

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
