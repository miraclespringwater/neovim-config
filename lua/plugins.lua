return require('packer').startup(function()
    --[[
    --  plugins to consider:
    --  bufferline (handles tabs and windows)
    --  gitsigns (git plugin)
    --  Null-LS (formatting with prettier, eslint, etc.)
    --  toggleterm (open terminal programs in neovim)
    --]]

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

    -- fuzzy finder (telescope)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- treesitter (provides better syntax highlighting)
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use('nvim-treesitter/playground')

    -- undotree (visualizes undo history)
    use('mbbill/undotree')

    -- lsp zero (easy lsp and auto completion)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            --{'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- autopairs brackets, parenthesis, etc. (fastwrap is useful)
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- easy comments
    use "numToStr/Comment.nvim"

    -- comment strings for jsx (curly braces, etc.)
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- bufferline (adds visual buffer line at the top)
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
end)
