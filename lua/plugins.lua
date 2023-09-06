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

    use {
        'numToStr/Comment.nvim',
        config = function()
        require('Comment').setup()
    end}

    -- lualine status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use("arkav/lualine-lsp-progress")

    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    -- projects
    use("ahmedkhalf/project.nvim")

    -- dashboard-nvim
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- rainbow parentheses
    use("p00f/nvim-ts-rainbow")

    -- blankine
    use("lukas-reineke/indent-blankline.nvim")

    -- autopairs
    use("windwp/nvim-autopairs")

    use ({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

end)
