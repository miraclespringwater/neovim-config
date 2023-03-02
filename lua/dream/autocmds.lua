local autocmd = vim.api.nvim_create_autocmd
-- Note:
-- BufEnter: fired when cursor enters the buffer
-- BufRead: fired after Vim has read the file into memory

autocmd({ "ColorScheme" }, {
	pattern = "*",
	command = "lua vim.g.colorscheme_bg = require('dream.functions').get_bg_color()",
})
-- Restore gq (only want for .md files for now)
autocmd("LspAttach", {
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
	end,
})

-- Overwrite filetype plugins
autocmd({ "Filetype" }, {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "o" }
	end,
})

-- For markdown and text files:
autocmd({ "BufRead", "BufNewFile", "BufWritePost" }, {
	pattern = { "*.md", "*.txt" },
	callback = function()
		vim.opt.textwidth = 80
		vim.opt.linebreak = true
		vim.opt.wrap = true
		vim.opt.list = false
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if cmp_status_ok then
			cmp.setup.buffer({ enabled = false })
		end
	end,
})
