return {
    "williamboman/mason.nvim",
    lazy = false,
    -- prior to mason-lspconfig and nvim-lspconfig
    priority = 48,
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end
}
