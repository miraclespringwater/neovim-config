local autocmd = vim.api.nvim_create_autocmd

vim.g.goyo_width = 81
local was_transparent

local function goyoenter()
	was_transparent = require("dream.functions").transparent
	require("dream.functions").transparent_off()
	vim.api.nvim_set_hl(0, "NonText", { fg = require("dream.functions").get_bg_color() })
	vim.opt.signcolumn = "no"
	vim.cmd([[IlluminatePauseBuf]])
end

local function goyoleave()
	if was_transparent then
		require("dream.functions").transparent_on()
	end
	require("dream.indent-blankline").load_highlight()
	vim.cmd([[IlluminateResumeBuf]])
end

autocmd("User", { pattern = "GoyoEnter", callback = goyoenter })
autocmd("User", { pattern = "GoyoLeave", callback = goyoleave })
