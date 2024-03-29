-- bufferline tab栏
return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    lazy = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {
            options = {
                -- close command and hover event
                close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
                close_icon = '',
                show_close_icon = true,
                -- underline the choosen tab
                indicator = {
                    style = 'underline',
                },
                -- 使用 nvim 内置lsp
                diagnostics = "nvim_lsp",
                -- 左侧让出 nvim-tree 的位置
                offsets = {{
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }},
                -- lsp diagnostics
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "" )
                    s = s .. n .. sym
                    end
                    return s
                end
            }
        }
    end
}