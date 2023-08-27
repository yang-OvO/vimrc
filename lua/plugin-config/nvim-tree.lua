require'nvim-tree'.setup {
    auto_reload_on_write = true,
    hijack_cursor = false,
    -- open_on_setup = false,
    -- open_on_setup_file = true,
    hijack_unnamed_buffer_when_opening = false,
    sort_by = "name",
    view = {
        width = 30,
        -- height = 30,
        side = "left",
        --color = "#3f0af0",
        preserve_window_proportions = false,
    },
    git = {
        enable = false,
    },
}
