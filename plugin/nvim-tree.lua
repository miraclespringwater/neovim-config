-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    number = true,
    relativenumber = true,
  },
  renderer = {
      highlight_git = true,
      highlight_opened_files = "all",
  },
  actions = {
      expand_all = {
        max_folder_discovery = 10,
        exclude = {".git", "node_modules"}
      },
      open_file = {
          quit_on_open = true,
      }
  }
})
