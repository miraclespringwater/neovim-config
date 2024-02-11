local M = {}

M.get_bg_color = function()
	local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
	if bg == nil then
		return nil
	else
		return string.format("#%06x", bg)
	end
end

M.transparent_on = function()
	vim.api.nvim_set_hl(0, "Normal", { bg = nil })
	M.transparent = true
end

M.transparent_off = function()
	vim.api.nvim_set_hl(0, "Normal", { bg = vim.g.colorscheme_bg })
	M.transparent = false
end

M.transparent_toggle = function()
	if M.transparent then
		M.transparent_off()
	else
		M.transparent_on()
	end
end

M.run_command_in_terminal = function(command)
	if M.terminal_buffer and vim.fn.bufexists(M.terminal_buffer) == 1 then
		-- If the terminal buffer exists, kill the current job
		vim.fn.chansend(vim.fn.termopen("exit"), "q\r")
	else
		-- If the terminal buffer doesn't exist, open a new one
		M.terminal_buffer = vim.fn.termopen(command)
	end
end

return M
