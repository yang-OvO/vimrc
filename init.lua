-- 基本配置
require('basic')
require('plugins')
require('keybindings')
require('autocmds')

-- theme settings
vim.o.background = "dark"
vim.cmd [[ colorscheme gruvbox ]]