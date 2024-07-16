local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-surround'
    use 'preservim/nerdtree'
    use 'vim-airline/vim-airline'
    use 'neoclide/coc.nvim'
    use 'tc50cal/vim-terminal'
    use 'nvim-lua/plenary.nvim'
    use 'rafi/awesome-vim-colorschemes'
    
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      event = "BufWinEnter",
      config = "require('treesitter-config')"
    }
    use {
      'tamton-aquib/staline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      event = "BufRead",
      config = "require('staline-config')"
    }
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter",
      config = "require('bufferline-config')"
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = "NvimTreeToggle",
      config = "require('nvim-tree-config')"
    }
    use { 'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" }
    use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
    use { 'm4xshen/autoclose.nvim'}
    require('autoclose').setup()
    use { 'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')" }
    
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { 'nvim-lua/plenary.nvim' }
      },
      config = "require('telescope-config')"
    }

    use { 'neovim/nvim-lspconfig', config = "require('lsp')" }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'onsails/lspkind-nvim' }
    use { 'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')", event = "BufRead" }
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup { current_line_blame = true }
      end
    }
    use { 'glepnir/dashboard-nvim', event = "BufRead", config = "require('dashboard-config')" }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = "require('blankline-config')",
      event = "BufRead"
    }
    use { "akinsho/toggleterm.nvim", config = "require('toggleterm-config')" }
    use { "terrortylor/nvim-comment", config = "require('comment-config')" }
    use { 'tami5/lspsaga.nvim', config = "require('lspsaga-config')" }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')" }
    use { "folke/zen-mode.nvim", config = 'require("zen-mode-config")' }
    use { "folke/twilight.nvim", config = "require('twilight-config')" }
    use { 'andweeb/presence.nvim', config = "require('presence-config')" }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
