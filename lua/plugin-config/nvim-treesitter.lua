-- treesitter 语法高亮
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- 安装 language parser
            -- :TSInstallInfo 命令查看支持的语言
            ensure_installed = { "c", "lua", "cpp", "bash", "bibtex", "clojure", "css", "gitignore", "gitcommit", "git_rebase", "gitattributes", "json", "python", "scss", "scheme", "sql", "toml", "typescript", "yaml", "rust", "vue", "javascript", "markdown", "markdown_inline" },
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
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
                enable = true,
                disable = {"yaml"}
            },
        }

        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.wo.foldlevel = 99
    end
}
