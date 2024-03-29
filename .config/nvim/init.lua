-- var
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo
cmd("set nocompatible")
cmd("set termguicolors")
-- plugins
-- enable impatient
local present, impatient = pcall(require, "impatient")

if present then
    impatient.enable_profile()
end
require("plugins.init").load()

-- edit setting

cmd("set tabstop=4")
cmd("set shiftwidth=4")
cmd("set softtabstop=4")
cmd("set expandtab")
o.mouse = "a"
o.splitbelow = true
-- o.showtabline = 2
o.showmode = false
wo.number = true
wo.cursorline = true
bo.smartindent = true
g.warp = true
g.linebreak = true
-- o.lazyredraw = true
o.swapfile = false
o.backup = false
o.writebackup = false
g.did_load_filetypes = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
require("mappings").key()

-- colorscheme/theme

cmd([[ autocmd BufEnter,BufWinEnter,FileType,WinEnter * lua require("utils").hide_statusline() ]])
