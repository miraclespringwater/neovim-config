require("mason-tool-installer").setup({
	-- a list of all tools you want to ensure are installed upon
	-- start; they should be the names Mason uses for each tool
	ensure_installed = {
		"lua-language-server",
		"css-lsp",
		"emmet-ls",
		"eslint-lsp",
		"html-lsp",
		"json-lsp",
		"lua-language-server",
		"prettier",
		"rust-analyzer",
		"tailwindcss-language-server",
		"typescript-language-server",
		"yaml-language-server",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 3000, -- 3 second delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})
