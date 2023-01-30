return require('packer').startup(function()

	-- Packer can manage itself
        use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'gruvbox-community/gruvbox'

	-- vimwiki
	use 'vimwiki/vimwiki'

  -- nvim tree written in lua
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- tidalcycles
  use 'tidalcycles/vim-tidal'

  -- vim-jsx-improve (syntax highlighting)
  use 'neoclide/vim-jsx-improve'

  -- emmet for vim
  use 'mattn/emmet-vim'

  -- lorem ipsum generator
  use 'derektata/lorem.nvim'
end)
