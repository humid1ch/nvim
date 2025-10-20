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
            custom_highlights = function(colors)
                return {
                    -- 代码块
                    MarkviewCodeInfo = { fg = "#939ab7", bg = "#373b54" },
                    MarkviewCodeFg = { fg = "#373b54" },
                    
                    -- 行内代码
                    MarkviewInlineCode = { bg = "#3f435e" },

                    -- Palette 系列(用于标题、引用等)
                    MarkviewPalette0 = { fg = "#9399b6", bg = "#2e3247" },
                    MarkviewPalette0Bg = { bg = "#2e3247" },
--                     MarkviewPalette0Sign = { fg = "#9399b6", bg = "#242639" },
                    MarkviewPalette0Sign = { fg = "#9399b6" },
                    
                    MarkviewPalette1 = { fg = "#ed8695", bg = "#343044" },
                    MarkviewPalette1Bg = { bg = "#343044" },
                    MarkviewPalette1Sign = { fg = "#ed8695" },
                    
                    MarkviewPalette2 = { fg = "#f5a87e", bg = "#343342" },
                    MarkviewPalette2Bg = { bg = "#343342" },
                    MarkviewPalette2Sign = { fg = "#f5a87e" },
                    
                    MarkviewPalette3 = { fg = "#eed39e", bg = "#343645" },
                    MarkviewPalette3Bg = { bg = "#343645" },
                    MarkviewPalette3Sign = { fg = "#eed39e" },
                    
                    MarkviewPalette4 = { fg = "#a6d994", bg = "#2f3644" },
                    MarkviewPalette4Bg = { bg = "#2f3644" },
                    MarkviewPalette4Sign = { fg = "#a6d994" },
                    
                    MarkviewPalette5 = { fg = "#7dc3e3", bg = "#2d344a" },
                    MarkviewPalette5Bg = { bg = "#2d344a" },
                    MarkviewPalette5Sign = { fg = "#7dc3e3" },
                    
                    MarkviewPalette6 = { fg = "#b7bcf7", bg = "#30344b" },
                    MarkviewPalette6Bg = { bg = "#30344b" },
                    MarkviewPalette6Sign = { fg = "#b7bcf7" },
                    
                    MarkviewPalette7 = { fg = "#c69ff5", bg = "#31324b" },
                    MarkviewPalette7Bg = { bg = "#31324b" },
                    MarkviewPalette7Sign = { fg = "#c69ff5" },
                    
                    -- Icon 背景
                    MarkviewIcon0 = { fg = "#9399b6", bg = "#373b54" },
                    MarkviewIcon1 = { fg = "#ed8695", bg = "#373b54" },
                    MarkviewIcon2 = { fg = "#f5a87e", bg = "#373b54" },
                    MarkviewIcon3 = { fg = "#eed39e", bg = "#373b54" },
                    MarkviewIcon4 = { fg = "#a6d994", bg = "#373b54" },
                    MarkviewIcon5 = { fg = "#7dc3e3", bg = "#373b54" },
                    MarkviewIcon6 = { fg = "#b7bcf7", bg = "#373b54" },
                }
            end
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
    {
        "stevearc/aerial.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                -- 布局设置
                layout = {
                    max_width = { 40, 0.2 },
                    width = 30,
                    min_width = 20,
                    default_direction = "prefer_left", -- 在右侧打开
                    resize_to_content = true,
                },
                
                -- 自动打开(可选)
                on_attach = function(bufnr)
                    -- 快捷键导航
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr, desc = "上一个标题"})
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr, desc = "下一个标题"})
                end,
                
                -- Markdown 特殊配置
                filter_kind = false, -- 显示所有级别的标题
                
                -- 图标
                icons = {
                    -- Markdown 标题图标
                    Interface =  "󰉳",
                },

                -- 高亮设置
                highlight_mode = "split_width",
                highlight_closest = true,
                highlight_on_jump = 300,
                
                -- 折叠
                manage_folds = false,

                -- 浮动窗口设置
                float = {
                  border = "rounded",
                  relative = "cursor",
                  max_height = 0.9,
                  min_height = { 8, 0.1 },
                },
              
                -- Markdown 更新延迟
                markdown = {
                  update_delay = 300,
                },
            })
        end,
        keys = {
                { "<A-o>", "<cmd>AerialToggle!<CR>", desc = "大纲切换" },
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require'colorizer'.setup()
        end,
    }, -- 颜色显示
}
