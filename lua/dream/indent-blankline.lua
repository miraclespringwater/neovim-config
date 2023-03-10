vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local M = {}
M.load_highlight = function()
	vim.cmd([[highlight IndentBlanklineContextStart guisp=#b8bb26 gui=underline]])
	vim.cmd([[highlight IndentBlanklineContextChar guifg=#b8bb26 gui=nocombine]])
end
M.load_highlight()
require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	disable_with_nolist = true,
})
return M
