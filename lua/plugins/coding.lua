-- ============================================================================
-- plugins/coding.lua - LSP 和代码补全插件配置
-- ============================================================================

return {
    -- LSP 管理器
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                    border = "rounded",
                }
            })
        end
    },
    -- LSP 配置
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'williamboman/mason-lspconfig.nvim' }
    },
    -- 补全引擎
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',  -- 常用代码段
            'onsails/lspkind-nvim',          -- 补全图标
        }
    },
    -- Lua 开发增强
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
    },
    -- 格式化和诊断
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            local clang_config_path = vim.fn.expand("~/.config/nvim/clang_format/.clang_format")
            local extra_args = {}
            if vim.fn.filereadable(clang_config_path) == 1 then
                extra_args = { "-style=file:" .. clang_config_path }
            end

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.clang_format.with({
                        filetypes = { "c", "cpp", "cc", "hpp", "h" },
                        extra_args = extra_args,
                    }),
                    null_ls.builtins.completion.spell,
                },
            })
        end,
    },
}
