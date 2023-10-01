return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "p00f/clangd_extensions.nvim", -- clangd extension, some good stuff
        "simrat39/rust-tools.nvim",    -- rust, rust, it's rust!
    },
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = { "clangd", "lua_ls", "rust_analyzer", "cmake", "pyright", "bashls" },
        }

        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name)  -- default handler (optional)
                require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- I don't use rust temporarily.
            ['clangd'] = function ()
                require('plugin-config.lsp.cppconfigs')
            end,
            ["rust_analyzer"] = function ()
                require('plugin-config.lsp.rustconfigs')
            end
        }
    end
}
