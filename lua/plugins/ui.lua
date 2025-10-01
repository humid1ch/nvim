-- ============================================================================
-- plugins/ui.lua - UI 相关插件配置
-- ============================================================================

return {
    -- 主题
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        opts = {
            flavour = "macchiato",
            transparent_background = true,
            float = {
                transparent = true,
                solid = true
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end
    },
    -- 状态栏
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lualine = require("lualine")
            local luaTheme = require("lualine.themes.modus-vivendi")
            -- 设置透明背景
            luaTheme.normal.c.bg = 'transparent_background'
            luaTheme.insert.c.bg = 'transparent_background'
            luaTheme.visual.c.bg = 'transparent_background'
            luaTheme.replace.c.bg = 'transparent_background'
            lualine.setup({
                options = {
                    theme = luaTheme,
                  --  section_separators = { left = '', right = '' },
                  --  component_separators = { left = '', right = '' }
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' }
                }
            })
        end
    },
    -- 面包屑导航
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
    -- 标签栏
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                highlights = {
                    fill = {
                        bg = "#24273a",
                        fg = "#a6da95"
                    },
                    buffer_selected = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    separator_selected = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    separator = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    tab_selected = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    tab_separator = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    tab_separator_selected = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    offset_separator = {
                        fg = "#b5efbd"
                    },
                    close_button_selected = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    modified_selected = {
                        bg = "#303347",
                        fg = "#b5efbd"
                    },
                    error_selected = {
                        bg = "#303347"
                    },
                    warning_selected = {
                        bg = "#303347"
                    },
                    numbers_selected = {
                        bg = "#303347"
                    },
                    diagnostic_selected = {
                        bg = "#303347"
                    },
                    hint_selected = {
                        bg = "#303347"
                    },
                    info_selected = {
                        bg = "#303347"
                    },
                    duplicate_selected = {
                        bg = "#303347"
                    },
                    indicator_selected = {
                        bg = "#303347"
                    },
                    pick_selected = {
                        bg = "#303347"
                    },
                },
                options = {
                    diagnostics = "nvim_lsp",
                    mode = "tabs",
                    number = "ordinal",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "Explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },
                    buffer_close_icon = '󰅖',
                    modified_icon = '●',
                    close_icon = '',
                }
            })
        end,
    },
    -- 滚动条
    {
        'dstein64/nvim-scrollview',
    },
    -- 文件树
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local tree = require("nvim-tree")
            tree.setup({
                sort = {
                    sorter = "case_sensitive",
                },
                git = {
                    enable = true,
                },
                view = {
                    side = "left",
                    width = 35,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                    custom = { "node_modules" },
                },
            })
        end,
    },
}
