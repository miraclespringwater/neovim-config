local luasnip = require("luasnip")
local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})

-- Since I have no clue how to manually trigger emmet_ls completion
-- I have removed the javascriptreact and typescriptreact filetypes
-- And am opting to use emmet-vim instead, but emmet_ls completion
-- in the below files is still useful.
lsp.configure("emmet_ls", {
	filetypes = { "html", "css", "sass", "scss", "less" },
})

-- require("mason-lspconfig").setup({
-- 	ensure_installed = { "clangd" },
-- 	handlers = {
-- 		lsp.default_setup,
-- 		clangd = function()
-- 			require("lspconfig").clangd.setup({
-- 				on_attach = function(client, bufnr)
-- 					client.server_capabilities.signatureHelpProvider = false
-- 					lsp.on_attach(client, bufnr)
-- 				end,
-- 			})
-- 		end,
-- 	},
-- })

local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
-- Remove mapping so emmet can have this mapping
cmp_mappings["<C-e>"] = nil

lsp.setup_nvim_cmp({
	sources = {
		{ name = "path", max_item_count = 10 },
		{ name = "nvim_lsp", keyword_length = 2, max_item_count = 10 },
		{ name = "buffer", keyword_length = 3, max_item_count = 10 },
		{ name = "luasnip", keyword_length = 2, max_item_count = 10 },
	},
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lsp.on_attach(function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>frn", function()
		local source_file, target_file

		-- vim.ui.input({
		-- 	prompt = "Source : ",
		-- 	completion = "file",
		-- 	default = vim.api.nvim_buf_get_name(0),
		-- }, function(input)
		-- 	source_file = input
		-- end)
		-- vim.ui.input({
		-- 	prompt = "Target : ",
		-- 	completion = "file",
		-- 	default = source_file,
		-- }, function(input)
		-- 	target_file = input
		-- end)
		source_file = vim.api.nvim_buf_get_name(0)
		vim.ui.input({
			prompt = "Rename To: ",
			completion = "file",
			default = source_file,
		}, function(input)
			target_file = input
		end)

		local params = {
			command = "_typescript.applyRenameFile",
			arguments = {
				{
					sourceUri = source_file,
					targetUri = target_file,
				},
			},
			title = "",
		}

		vim.lsp.util.rename(source_file, target_file)
		vim.lsp.buf.execute_command(params)
		vim.cmd("e " .. target_file)
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	-- Note: Get client name for a specific file type by using :LspInfo
	-- inside of a buffer with said file type
	if client.name == "tsserver" or client.name == "html" then
		-- This will disable the LSP servers builtin formatting server_capabilities
		-- And use the one provided by Null-LS instead (such as prettier)
		client.server_capabilities.document_formatting = false
	end

	-- Autoformat on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
end)

lsp.setup()

-- Leave snippet on mode change (PRAISE THE HEAVENS!!!!)
-- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
function leave_snippet()
	if
		((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
		and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
		and not require("luasnip").session.jump_active
	then
		require("luasnip").unlink_current()
	end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

vim.diagnostic.config({
	virtual_text = false,
})

-- null-s ls configuration

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

-- Note: Use Mason to install prettier if not installed
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettierd,
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.yapf,
		formatting.stylua,
		-- diagnostics.flake8,
	},
})
