-- ============================================================================
-- plugins/editor.lua - 编辑器增强插件配置
-- ============================================================================

return {
    -- 文件搜索 (Telescope)
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<C-i>", ":Telescope find_files<CR>", desc = "查找文件" },
            { "<C-f>", ":Telescope live_grep<CR>",  desc = "全局搜索" },
            { "<C-r>", ":Telescope resume<CR>",     desc = "恢复上次搜索" },
            { "<C-o>", ":Telescope oldfiles<CR>",   desc = "最近文件" },
        },
    },
    -- 自动括号
    {
        'windwp/nvim-autopairs',
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    -- 会话管理
--    {
--        "folke/persistence.nvim",
--        event = "BufReadPre",
--        config = function()
--            local persistence = require("persistence")
--            persistence.setup({})
--        end,
--    },
    -- 文件类型识别
    {
        "nathom/filetype.nvim",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("filetype").setup({
                overrides = {
                    extensions = {
                        h = "cpp",
                    },
                }
            })
        end
    },
    -- C/C++ 头文件和源文件切换
    {
        'vim-scripts/a.vim',
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local presets = require("markview.presets");

            require("markview").setup({
                preview = {
                    icon_provider = 'devicons',
                    modes = {'n', 'v', 'c'},  -- 启用预览的模式
                    hybrid_modes = {'n', 'v'}, -- 启用混合模式的模式
                    enable_hybrid_mode = true, -- 默认关闭混合模式
                    linewise_hybrid_mode = true -- 默认开启行级模式
                },
                markdown = {
                    headings = presets.headings.simple,
                },
            });
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function ()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)
            
            require("ibl").setup { indent = { highlight = highlight } }
        end
    },
}
