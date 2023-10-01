return {
    "neovim/nvim-lspconfig",
    dependencies = {
	    "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = { "clangd", "lua_ls", "rust_analyzer", "cmake", "pyright", "bashls" },
        }

        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- I don't use rust temporarily.
            -- ["rust_analyzer"] = function ()
            --     require("rust-tools").setup {}
            -- end
        }
    end
}