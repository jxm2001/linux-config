-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'mhinz/vim-startify'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'yggdroot/indentline'
  use 'lifepillar/vim-solarized8'
  use 'rebelot/kanagawa.nvim'
  use 'scrooloose/nerdtree'
  use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'
  use 'brooth/far.vim'
  use 'tpope/vim-commentary'
  use 'liuchengxu/vim-which-key'
  use 'ryanoasis/vim-devicons'
  use 'ludovicchabant/vim-gutentags'
  use 'ojroques/vim-oscyank'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
  use { 'p00f/nvim-ts-rainbow' }

end
)
