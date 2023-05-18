vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = false
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")


---------------------
-- General Keymaps
---------------------

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

--------------------
-- Plugin Keymaps
--------------------

-- vim-maximizer
-- vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>") -- toggle file explorer
vim.keymap.set("n", '<c-t>', ':NvimTreeFindFileToggle<Ct>')

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- tagbar
vim.keymap.set("n", '<c-b>', ':TagbarToggle<CR>')

-- neoterm
vim.keymap.set("n", "<leader>tt", "<cmd>NeotermToggle<CR>")
vim.keymap.set("n", "<leader>tr", ":NeotermRun<space>")
vim.keymap.set("n", "<leader>tR", "<cmd>NeotermRerun<CR>")--nnoremap <leader>tR <cmd>NeotermRerun<CR>
vim.keymap.set("n", "<leader>tx", "<cmd>NeotermExit<CR>")--nnoremap <leader>tx <cmd>NeotermExit<CR>
vim.keymap.set("t", "<leader>tn", "<C-\\><C-n>")--tnoremap <leader>tn <C-\\><C-n>
vim.keymap.set("t", "<leader>tt", "<cmd>NeotermToggle<CR>")--tnoremap <leader>tt <cmd>NeotermToggle<CR>
vim.keymap.set("t", "<leader>tx", "<cmd>NeotermExit<CR>")--tnoremap <leader>tx <cmd>NeotermExit<CR>
