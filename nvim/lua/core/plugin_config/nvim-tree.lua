--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

--require("nvim-tree").setup()

--vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')


local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- nvim-tree recommended settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

