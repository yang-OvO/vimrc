" 基本配置
lua require('basic')
lua require('plugins')
lua require('keybindings')

" 插件配置
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/toggleterm')
lua require('plugin-config/nvim-treesitter')
lua require('Comment').setup()
lua require('plugin-config/lualine')
lua require('plugin-config/gruvbox')
lua require('plugin-config/telescope')
lua require('plugin-config/projects')
lua require('plugin-config/dashboard')
lua require('plugin-config/indent-blankline')
lua require('nvim-autopairs').setup({check_ts = true})


set background=dark
colorscheme gruvbox


" 我的wendous设置成git bash
if has('win32')
    let &shell = '"C:\Program Files\Git\bin/bash.exe"'
    let &shellcmdflag = '-s' 
endif
