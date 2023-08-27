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
map("n", "<C-u>", "9k", {silent=true})
map("n", "<C-d>", "9j", {silent=true})

-- visual模式下连续缩进
map('v', '<', '<gv', {silent=true})
map('v', '>', '>gv', {silent=true})

-- kj回到normal模式
map("i", "kj", "<Esc>", {silent=true})

-- ctrl+s保存
map({'v', 'n', 'i', 't'}, '<F4>', '<cmd>wa<CR>')

-- nvimTree
map('n', '<A-m>', ':NvimTreeFindFileToggle<CR>', {silent=true})

-- 窗口跳转
map({'v', 'n', 'i', 't'}, "<A-h>", "<C-w>h", {silent=true})
map({'v', 'n', 'i', 't'}, "<A-j>", "<C-w>j", {silent=true})
map({'v', 'n', 'i', 't'}, "<A-k>", "<C-w>k", {silent=true})
map({'v', 'n', 'i', 't'}, "<A-l>", "<C-w>l", {silent=true})

-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", {silent=true})
map("n", "<C-l>", ":BufferLineCycleNext<CR>", {silent=true})

-- 关闭其他buffer
map("n", "<F3>", "<cmd>BufferLineCloseOthers<CR>", { silent = true })
