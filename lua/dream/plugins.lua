return require("packer").startup(function()
	--[[
    --  plugins to consider:
    --  toggleterm (open terminal programs in neovim)
    --
    ]]

	use("mattn/emmet-vim")

	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- colorscheme
	use("gruvbox-community/gruvbox")
	--  I like this one but colors just seem off to me.
	--  Would have to try some overrides.
	--use("ellisonleao/gruvbox.nvim")
	use("eddyekofo94/gruvbox-flat.nvim")

	-- vimwiki
	use("vimwiki/vimwiki")

	-- nvim tree written in lua
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- tidalcycles
	use("tidalcycles/vim-tidal")

	-- fuzzy finder (telescope)
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- telescope-frecency: telescope extension for viewing most recent files
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	})

	-- treesitter (provides better syntax highlighting)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("nvim-treesitter/playground")

	-- undotree (visualizes undo history)
	use({ "mbbill/undotree", lazy = true })

	-- lsp zero (easy lsp and auto completion)
	use({
		"VonHeikemen/lsp-zero.nvim",
		lazy = true,
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			--{ "rafamadriz/friendly-snippets" }, -- Optional
			{ "miraclespringwater/friendly-snippets", branch = "msw-custom" }, -- Optional
		},
	})

	-- mason automatic installer
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = true })
	-- null-ls for formatting, linting & more
	use({ "jose-elias-alvarez/null-ls.nvim", lazy = true })

	-- autopairs brackets, parenthesis, etc. using treesitter (fastwrap is useful)
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		lazy = true,
	})

	-- auto close html tags, uses treesitter
	use({ "windwp/nvim-ts-autotag", lazy = true })

	-- easy comments
	use({ "numToStr/Comment.nvim", lazy = true })

	-- comment strings for jsx (curly braces, etc.) using treesitter
	use({ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true })

	-- bufferline (adds visual buffer line at the top)
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons", lazy = true })

	-- buffer-term: simple toggalable terminal buffer
	use({ "caenrique/buffer-term.nvim", lazy = true })

	-- gitsigns: display changes in git projects in sign column
	use({ "lewis6991/gitsigns.nvim", lazy = true })

	-- vim-illuminate: highlights word under cursor
	use({ "RRethy/vim-illuminate", lazy = true })

	-- indent-blankline: adds indentation guides to all lines
	use({ "lukas-reineke/indent-blankline.nvim", lazy = true })

	-- bigfile: disables certain options when opening a big file
	use({ "LunarVim/bigfile.nvim", lazy = true })

	-- goyo: distraction free writing
	use({ "junegunn/goyo.vim", lazy = true })

	-- nvim-colorizer: color highlighter
	use({ "norcalli/nvim-colorizer.lua", lazy = true })

	-- alpha: startify-like starter page
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use("lewis6991/impatient.nvim")
end)
