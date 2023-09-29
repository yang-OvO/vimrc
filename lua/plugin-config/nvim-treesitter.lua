-- treesitter 语法高亮
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- 安装 language parser
            -- :TSInstallInfo 命令查看支持的语言
            ensure_installed = {"c", "cpp", "python", "cmake", "lua", "rust", "vim", "cuda", "bash", "vue", "markdown", "javascript", "typescript", "html", "css", "json", "yaml"},  -- 启用代码高亮功能
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            -- 启用增量选择
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '+',
                    node_incremental = '+',
                    node_decremental = '-',
                    -- scope_incremental = '+',
                }
            },
        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
            indent = {
                enable = true
            },
            rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                colors = {
                "#95ca60",
                "#ee6985",
                "#D6A760",
                "#7794f4",
                "#b38bf5",
                "#7cc7fe",
                }, -- table of hex strings
            -- termcolors = { } -- table of colour name strings
            },
        }

        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.wo.foldlevel = 99
    end
}