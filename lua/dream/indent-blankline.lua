vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.cmd([[highlight IndentBlanklineContextStart guisp=#b8bb26 gui=underline]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#b8bb26 gui=nocombine]])

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	disable_with_nolist = true,
})
