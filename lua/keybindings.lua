-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    if type(mode) == 'table' then
        for i = 1, #mode do
            map(mode[i], lhs, rhs, opts)
        end
        return
    end
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- 半页改为九行
map("n", "<C-u>", "9k", { silent = true })
map("n", "<C-d>", "9j", { silent = true })

-- visual模式下连续缩进
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

-- kj回到normal模式
map("i", "kj", "<Esc>", { silent = true })

-- F4保存
map({ 'v', 'n', 'i', 't' }, '<F4>', '<cmd>wa<CR>')

-- nvimTree
map('n', '<A-m>', ':NvimTreeFindFileToggle<CR>', { silent = true })

-- 窗口跳转
map({ 'v', 'n', 'i', 't' }, "<A-h>", "<C-w>h", { silent = true })
map({ 'v', 'n', 'i', 't' }, "<A-j>", "<C-w>j", { silent = true })
map({ 'v', 'n', 'i', 't' }, "<A-k>", "<C-w>k", { silent = true })
map({ 'v', 'n', 'i', 't' }, "<A-l>", "<C-w>l", { silent = true })

-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<C-l>", ":BufferLineCycleNext<CR>", { silent = true })

-- 关闭其他buffer
map("n", "<F3>", "<cmd>BufferLineCloseOthers<CR>", { silent = true })

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })
map("n", "<C-f>", ":Telescope live_grep<CR>", { silent = true })
-- 查找最近打开过的文件
map("n", "<leader>o", "<cmd>Telescope oldfiles initial_mode=insert<CR>")
-- 最近使用的命令
map("n", "<leader>:", "<cmd>Telescope command_history initial_mode=insert<CR>")
-- 绑定的快捷键
map("n", "<leader>?", "<cmd>lua require('telescope.builtin').keymaps()<CR>")


local pluginKeys = {}
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-n>"] = "move_selection_next",
        ["<C-p>"] = "move_selection_previous",
        -- 历史记录
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<esc>"] = "close",
        -- ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

------------------------------ LSP -----------------------------------------
pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<Tab>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<C-j>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<C-k>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

-- 打开工程的诊断
map("n", "gla", "<cmd>Telescope diagnostics<CR>")
-- 查找所有引用
map("n", "gr", "<cmd>Telescope lsp_references<CR>")

-- 打开当前一行的诊断
vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
-- 跳转到下一个诊断
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- 跳转到上一个诊断
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- 打开当前文件的诊断
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        -- 跳转到声明
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- 跳转到定义
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- telescope is better

        -- 悬停事件
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        -- useless
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- 查找类型的定义
        vim.keymap.set('n', 'gsd', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, 'gca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- telescope do better
        vim.keymap.set('n', 'gq', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})


------------------------------ GIT -----------------------------------------
-- 查找 git 仓库中的文件
map("n", "<leader>f", "<cmd>Telescope git_files initial_mode=insert<CR>")
-- 查找 git 仓库的 commit 历史
map("n", "<leader>c", "<cmd>Telescope git_commits<CR>")
-- 查找 git 仓库的所有分支
map("n", "<leader>b", "<cmd>Telescope git_branches<CR>")
-- git仓库当前状态
map("n", "<leader>s", "<cmd>Telescope git_status<CR>")

return pluginKeys
