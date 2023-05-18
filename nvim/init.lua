
local o = vim.opt
local a = vim.api
local g = vim.g

require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

o.termguicolors = true
o.guifont = "GohuFont Nerd Font"

o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

a.nvim_command('NvimTreeToggle')

g.AutoPairsFlyMode=1

