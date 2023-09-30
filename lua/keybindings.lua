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



return pluginKeys
