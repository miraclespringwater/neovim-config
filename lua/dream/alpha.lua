local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- https://textfancy.com/text-art/
dashboard.section.header.val = {
	"                                                                                                 ",
	"             █████ ██        █████ ███      █████ ██                        █████   ██    ██     ",
	"        ██████  ███     ██████  █ ██   ██████  ████ █    █████         ██████  █████ █████       ",
	"      ██    █  █ ███   ██   █  █  ██  ██   █  █ ████    █  ███        ██   █  █  █████ █████     ",
	"     █     █  █   ███ █    █  █   ██ █    █  █   ██        ███       █    █  █   █ ██  █ ██      ",
	"      █   █  █     ███    █  █    █      █  █             █  ██          █  █    █     █         ",
	"         ██ ██      ██   ██ ██   █      ██ ██             █  ██         ██ ██    █     █         ",
	"         ██ ██      ██   ██ ██  █       ██ ██            █    ██        ██ ██    █     █         ",
	"         ██ ██      ██   ██ ████        ██ ██████        █    ██        ██ ██    █     █         ",
	"         ██ ██      ██   ██ ██  ███     ██ █████        █      ██       ██ ██    █     █         ",
	"         ██ ██      ██   ██ ██    ██    ██ ██           █████████       ██ ██    █     ██        ",
	"         █  ██      ██   █  ██    ██    █  ██          █        ██      █  ██    █     ██        ",
	"            █       █       █     ██       █           █        ██         █     █      ██       ",
	"       █████       █    ████      ███  ████         █ █████      ██    ████      █      ██       ",
	"      █   █████████    █  ████    ██  █  ███████████ █   ████    ██ █ █  █████           ██      ",
	"     █       ████     █    ██     █  █     ██████   █     ██      ██ █     ██                    ",
	"     █                █              █              █                █                           ",
	"      █                █              █              █                █                          ",
	"       █                ██             ██             ██               ██                        ",
	"        ██                                                                                       ",
}

dashboard.section.header.opts.hl = "Function"

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("SPC p f", "  Find file", ":lua require('telescope.builtin').find_files()<CR>"),
	dashboard.button("SPC p h", "  Recently opened files", ":lua require('telescope.builtin').oldfiles()<CR>"),
	dashboard.button("SPC p r", "  Frecency/MRU", ":lua require('telescope').extensions.frecency.frecency()"),
	dashboard.button(
		"SPC p z",
		"  Find word",
		":lua require('telescope.builtin').live_grep({ file_ignore_patterns = { 'package-lock.json', 'package.json', 'node_modules', '.git' } })<cr>"
	),
	-- dashboard.button("SPC f m", "  Jump to bookmarks"),
	-- dashboard.button("SPC s l", "  Open last session", "<cmd>SessionManager load_last_session<CR>"),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
