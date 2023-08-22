-- utf-8
vim.g.encoding = 'UTF-8'
vim.o.fileencoding= 'UTF-8'

-- jk光标移动时上下保留八行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- 高亮所在行
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- 新行对齐当前行，空格替代tab
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 四个空格相当于一个tab
vim.o.tabstop = 4
vim.bo.tabstop = 4

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true

-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 鼠标支持
vim.o.mouse = "a"

-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- 补全增强
vim.o.wildmenu = true

-- 不可见字符的显示
vim.o.list = true
vim.o.listchars = "tab:▸ ,trail:⋅,extends:❯,precedes:❮"
