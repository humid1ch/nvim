-- ============================================================================
-- config/lazy.lua - Lazy.nvim 插件管理器配置
-- ============================================================================

-- 安装 lazy.nvim（如果未安装）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 加载插件配置
-- 这会自动加载 lua/plugins/ 目录下的所有 .lua 文件
require("lazy").setup("plugins", {
    -- lazy.nvim 配置选项
    defaults = {
        lazy = false, -- 默认不延迟加载
    },
    install = {
        colorscheme = { "catppuccin" },
    },
    checker = {
        enabled = false, -- 不自动检查更新
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
