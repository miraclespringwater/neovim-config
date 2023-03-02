local M = {}

M["get_bg_color"] = function()
	local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
	if bg == nil then
		return nil
	else
		return string.format("#%06x", bg)
	end
end

M["toggle_transparency"] = function()
	if M.get_bg_color() == nil then
		vim.api.nvim_set_hl(0, "Normal", { bg = vim.g.colorscheme_bg })
	else
		vim.api.nvim_set_hl(0, "Normal", { bg = nil })
	end
end

return M
