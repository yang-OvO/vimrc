lua require('basic')
lua require('plugins')
lua require('keybindings')

" 插件配置
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/toggleterm')
lua require('plugin-config/nvim-treesitter')

set background=dark
colorscheme gruvbox


" 我的wendous设置成git bash
if has('win32')
    let &shell = '"C:\Program Files\Git\bin/bash.exe"'
    let &shellcmdflag = '-s' 
endif
