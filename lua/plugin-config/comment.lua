-- Comment.nvim 快速注释 内置treesitter
return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup()
    end
}