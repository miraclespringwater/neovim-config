local autocmd = vim.api.nvim_create_autocmd
-- Note:
-- BufEnter: fired when cursor enters the buffer
-- BufRead: fired after Vim has read the file into memory

autocmd({ "ColorScheme" }, {
	pattern = "*",
	callback = function()
		vim.g.colorscheme_bg = require("dream.functions").get_bg_color()
	end,
})
-- Restore gq (only want for .md files for now)
autocmd("LspAttach", {
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
	end,
})

-- Overwrite filetype plugins
-- autocmd({ "Filetype" }, {
-- 	pattern = { "markdown", "vimwiki" },
-- 	callback = function() end,
-- })

-- For markdown and text files:
autocmd({ "BufRead", "BufNewFile", "BufWritePost" }, {
	pattern = { "*.md", "*.txt" },
	callback = function()
		vim.opt.textwidth = 80
		vim.opt.linebreak = false
		vim.opt.wrap = false
		vim.opt.list = false
		vim.opt.sidescrolloff = 0
		vim.opt.formatoptions:append("tcr")
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if cmp_status_ok then
			cmp.setup.buffer({ enabled = false })
		end
	end,
})

autocmd({ "BufWritePost" }, {
	pattern = { ".prettierrc" },
	-- i cannot for the life of me figure out a good way of doing this...
	callback = function()
		-- local f = assert(io.popen("echo $(killall -v prettierd)"))
		-- local result = f:read("*a")
		-- print(result)
		-- f:close()
		vim.cmd([[execute "!echo $(killall -wv prettierd; killall prettierd)" ]])
	end,
})
