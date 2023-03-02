local autocmd = vim.api.nvim_create_autocmd

local was_transparent

local function goyoenter()
	was_transparent = require("dream.functions").transparent
	require("dream.functions").transparent_off()
	vim.api.nvim_set_hl(0, "NonText", { fg = require("dream.functions").get_bg_color() })
end

local function goyoleave()
	if was_transparent then
		require("dream.functions").transparent_on()
	end
end

autocmd("User", { pattern = "GoyoEnter", callback = goyoenter })
autocmd("User", { pattern = "GoyoLeave", callback = goyoleave })
