-- theme and color
return { 
  "ellisonleao/gruvbox.nvim", 
  lazy = false,
  priority = 1000,
  dependencies = {
    'rktjmp/lush.nvim'
  },
  config = function()
    require("gruvbox").setup({
        italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
    }) 
  end
}