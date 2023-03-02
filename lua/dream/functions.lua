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

return M
