return require("packer").startup(function()
	--[[
    --  plugins to consider:
    --  gitsigns (git plugin)
    --  toggleterm (open terminal programs in neovim)
    --]]

	use("mattn/emmet-vim")

	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- colorscheme
	use("gruvbox-community/gruvbox")

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
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
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
	use("mbbill/undotree")

	-- lsp zero (easy lsp and auto completion)
	use({
		"VonHeikemen/lsp-zero.nvim",
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
		},
	})

	-- mason automatic installer
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	-- null-ls for formatting, linting & more
	use("jose-elias-alvarez/null-ls.nvim")

	-- autopairs brackets, parenthesis, etc. using treesitter (fastwrap is useful)
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- auto close html tags, uses treesitter
	use("windwp/nvim-ts-autotag")

	-- easy comments
	use("numToStr/Comment.nvim")

	-- comment strings for jsx (curly braces, etc.) using treesitter
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- bufferline (adds visual buffer line at the top)
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = true,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = false,
					show_http_info = false,
					show_headers = false,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	})
end)
