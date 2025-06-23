vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.keymap.set("i", "jk", "<Esc>", options)
vim.g.mapleader= " "
-- use this for line numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

