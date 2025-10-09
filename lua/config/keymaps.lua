-- ============================================================================
-- config/keymaps.lua - 按键映射配置
-- ============================================================================

local mapOpt = { noremap = true, silent = true }

-- ============================================================================
-- 通用按键映射
-- ============================================================================

-- 保存文件
vim.keymap.set("n", "<C-S>", ":w<CR>", mapOpt)          -- 普通模式保存
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>", mapOpt)     -- 插入模式保存

-- 插入模式快捷键
vim.keymap.set("i", "jc", "<BS>", mapOpt)               -- 回退键
vim.keymap.set("i", "jk", "<Esc>", mapOpt)              -- 退出插入模式
vim.keymap.set("i", "jg", "<End>", mapOpt)              -- 行尾
vim.keymap.set("i", "ja", "<Home>", mapOpt)             -- 行首

-- 普通模式移动
vim.keymap.set("n", "L", "<End>", mapOpt)               -- 行尾
vim.keymap.set("n", "H", "<Home>", mapOpt)              -- 行首

-- 可视行移动（处理折行）
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- ============================================================================
-- 插件相关按键映射
-- ============================================================================

-- NvimTree 文件管理器
vim.keymap.set("n", "tf", ":NvimTreeFocus<CR>", mapOpt) -- 聚焦
vim.keymap.set("n", "to", ":NvimTreeOpen<CR>", mapOpt)  -- 打开

-- BufferLine 标签页切换
vim.keymap.set("n", "<C-j>", ":BufferLineCyclePrev<CR>", mapOpt) -- 上一个标签
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", mapOpt) -- 下一个标签

-- a.vim 源文件和头文件切换
vim.keymap.set("n", "<C-h>", ":AT<CR>", mapOpt)         -- C/CPP 切换

-- 会话管理
-- vim.api.nvim_set_keymap("n", "<C-a>", [[<cmd>lua require("persistence").load()<CR>]], {})
