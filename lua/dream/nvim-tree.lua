-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		number = true,
		relativenumber = true,
		preserve_window_proportions = true,
		--		width = 40,
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "all",
	},
	actions = {
		expand_all = {
			max_folder_discovery = 10,
			exclude = { ".git", "node_modules" },
		},
		open_file = {
			quit_on_open = true,
		},
	},
	filters = {
		custom = { "node_modules" },
	},
	git = {
		ignore = false,
	},
})
