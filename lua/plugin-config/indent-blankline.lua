-- indent-blankline.vim
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local status, indent_blankline = pcall(require, "ibl")
        if not status then
            vim.notify("没有找到 indent_blankline")
            return
        end

        indent_blankline.setup({
            -- 竖线样式
            indent = { char = "▏", tab_char = { "┇" } },
            -- filetype_exclude echo &filetype
            exclude = {
                filetypes = {
                    "null-ls-info",
                    "packer",
                    "dashboard",
                    "help",
                    "log",
                    "markdown",
                    "TelescopePrompt",
                    "lsp-installer",
                    "lspinfo",
                    "checkhealth",
                    "man",
                    "gitcommit",
                    "TelescopeResults",
                    "toggleterm",
                },
                buftypes = {
                    "terminal",
                    "nofile",
                    "quickfix",
                    "prompt",
                },
            },
            scope = {
                enabled = true,
                char = "┋",
                show_start = true,
            },
        })
    end,
}
