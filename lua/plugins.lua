return require('packer').startup(function()
    -- packer
    use 'wbthomason/packer.nvim'

    -- theme and color
    use {
        'ellisonleao/gruvbox.nvim',
        requires = {'rktjmp/lush.nvim'}
    }
    use 'glepnir/zephyr-nvim'
    use 'shaunsingh/nord.nvim'

    -- nvim-tree 目录树
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- bufferline tab栏
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- toggleterm 终端
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- treesitter 语法高亮
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
