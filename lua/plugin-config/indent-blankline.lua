-- indent-blankline.vim
return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "HiPhish/rainbow-delimiters.nvim", },
    main = "ibl",
    opts = {},
    config = function()
        local status, indent_blankline = pcall(require, "ibl")
        if not status then
            vim.notify("没有找到 indent_blankline")
            return
        end

        local highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
        }
        local rainbow_delimiters = require 'rainbow-delimiters'

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            highlight = highlight,
        }

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
                highlight = highlight,
                include = {
                    node_type = { ["*"] = { "*" } },
                },
            },
        })

        local hooks = require "ibl.hooks"
        hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
        )
    end,
}
