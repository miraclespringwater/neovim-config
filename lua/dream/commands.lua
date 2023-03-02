vim.cmd([[ command! Reload execute 'source ~/.config/nvim/init.lua' ]])
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
vim.cmd([[ command! DeleteAllEmpty execute 'g/^$/d ' ]])
vim.cmd([[ command! ToggleTransparent execute "lua require('dream.functions').toggle_transparency()"]])
