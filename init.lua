-- ============================================================================
-- init.lua - 主入口文件
-- ============================================================================

-- 兼容性检查
if not vim then
    vim = vim or {}
    vim.opt = vim.opt or {}
end

-- 加载基础配置
require("config.options")      -- 基础选项配置
require("config.keymaps")      -- 按键映射
require("config.autocmds")     -- 自动命令
require("config.lazy")         -- 插件管理器（会自动加载 plugins/ 目录下的插件）
require("config.lsp")          -- LSP 配置
require("config.cmp")          -- 补全配置
require("filetype.cangjie")
