return {
    "hrsh7th/nvim-cmp",             -- The completion plugin
    dependencies = {
        "hrsh7th/cmp-buffer",       -- buffer completions
        "hrsh7th/cmp-path",         -- path completions
        "hrsh7th/cmp-cmdline",      -- cmdline completions
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "hrsh7th/cmp-nvim-lsp",
        -- snippets
        "L3MON4D3/LuaSnip",             --snippet engine
        "rafamadriz/friendly-snippets", -- a bunch of snippets to use
        -- "rcarriga/cmp-dap",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        local kind_icons = require("icons").kind

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()

        local check_backspace = function()
            local col = vim.fn.col "." - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end

        local winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
        -- find more here: https://www.nerdfonts.com/cheat-sheet

        cmp.setup {
            -- enabled = function()
            --   return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            --       or require("cmp_dap").is_dap_buffer()
            -- end,
            view = {
                entries = "custom" -- can be "custom", "wildmenu" or "native"
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = require('keybindings').cmp(cmp),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                max_width = 0,
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    -- This concatonates the icons with the name of the item kind
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "crates" }
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            window = {
                completion =
                {
                    scrollbar    = false,
                    winhighlight = winhighlight,
                },
                documentation = { winhighlight = winhighlight },
            }
        }

        -- Set configuration for git
        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = "buffer" },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })

        -- cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        --   sources = {
        --     { name = "dap" },
        --   },
        -- })
    end
}
