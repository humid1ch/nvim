-- ============================================================================
-- config/options.lua - 基础选项配置
-- ============================================================================

local set = vim.opt

-- 设置 leader 键
vim.g.mapleader = "/"
vim.g.maplocalleader = "/"

-- 行号设置
set.number = true             -- 显示行号
set.relativenumber = true     -- 显示相对行号
set.cursorline = true         -- 高亮当前行

-- 缩进和 Tab 设置
set.expandtab = true          -- Tab 转换为空格
set.softtabstop = 4           -- 软制表符长度
set.tabstop = 4               -- 硬制表符长度
set.shiftwidth = 4            -- 自动缩进长度

-- 系统集成
set.clipboard = "unnamedplus" -- 使用系统剪切板

-- 滚动和光标
set.scrolloff = 5             -- 光标上下保持 5 行距离

-- 鼠标支持
set.mouse = "a"               -- 启用鼠标支持

-- 颜色设置
set.termguicolors = true      -- 启用真彩色支持

-- 透明背景
vim.cmd("highlight Normal guibg=none ctermbg=none")

-- 编码设置
set.fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"
set.encoding = "utf-8"
