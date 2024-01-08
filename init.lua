local set = vim.o

set.number = true               -- 行号
set.relativenumber = true       -- 相对行号
set.cursorline = true           -- 光标线
set.expandtab = true            -- Tab插入空格
set.softtabstop = 4             -- 软制表符长度
set.tabstop = 4                 -- 硬制表符长度
set.shiftwidth = 4              -- 缩进长度 
set.clipboard = "unnamedplus"   -- 设置系统剪切板
vim.opt.termguicolors = true

-- 设置UTF-8编码
set.fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"
set.termencoding = "utf-8"
set.encoding = "utf-8"

-- copy 高亮
vim.api.nvim_create_autocmd({"TextYankPost"}, {
        pattern = {"*"},
        callback = function()
            vim.highlight.on_yank({
                timeout = 300,
            })
        end,
})

local mapOpt = { noremap = true, silent = true }
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
-- g-j 和 g-k 实现可视行的上下移动而不是实际行

-- 重新加载上次的会话
vim.api.nvim_set_keymap("n", "<C-a>", [[<cmd>lua require("persistence").load()<cr>]], {})

-- C/C++/Json/Java等 Ctrl+/ 快速添加 "// " 注释, 配合V-Block 可实现批量注释
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"c", "cpp", "cc", "hpp", "h", "java", "json", "js", "go"},
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-/>", "I// <Esc>", {silent = true})
        vim.api.nvim_set_keymap("x", "<C-/>", "I// <Esc>", {silent = true})
    end
})

-- lua Ctrl+/ 快速添加 "-- " 注释, 配合V-Block 可实现批量注释
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"lua"},
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-/>", "I-- <Esc>", {silent = true})
        vim.api.nvim_set_keymap("x", "<C-/>", "I-- <Esc>", {silent = true})
    end
})

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = true
    },  -- 主题
    {
        cmd = "Telescope", -- 输入命令 nvim 才加载Telescope
        keys = {
            -- {"keymap", "command", desc = ""},
            {"<C-i>", ":Telescope find_files<CR>",  desc = "find_files"},   -- 文件名搜索文件
            {"<C-f>", ":Telescope live_grep<CR>",   desc = "live_grep"},    -- 内容搜索
            {"<C-r>", ":Telescope resume<CR>",      desc = "resume"},       -- 打开上次搜索
            {"<C-o>", ":Telescope oldfiles<CR>",    desc = "oldfiles"},     -- 历史打开文件
        },
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },  -- 搜索
    {
        "williamboman/mason.nvim",
        event = "VeryLazy", -- 打开nvim 显示UI之后再进行加载
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
    },  -- lsp 安装管理
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'williamboman/mason-lspconfig.nvim' }
    },  -- lsp 配置
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
            -- 常用代码段
            'rafamadriz/friendly-snippets',
            -- 选项图标
            'onsails/lspkind-nvim',
        }
    },  -- lsp 补全
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
    },
    {
        'windwp/nvim-autopairs',
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },  -- 自动括号
    {
        event = "VeryLazy",
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- "/home/July/.clang_format"
                    null_ls.builtins.formatting.clang_format.with({
                        filetypes = { "c", "cpp", "cc" },
                        extra_args = { "-style={ BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Always, AccessModifierOffset: -4, ColumnLimit: 0, BreakBeforeBraces: Custom, BraceWrapping: { AfterClass: false, AfterControlStatement: false, AfterEnum: false, AfterFunction: false, AfterNamespace: false, AfterObjCDeclaration: false, AfterStruct: false, AfterUnion: false, BeforeCatch: true, BeforeElse: true, IndentBraces: false}, ConstructorInitializerAllOnOneLineOrOnePerLine: false, ConstructorInitializerIndentWidth: 4, IndentCaseLabels: false, MaxEmptyLinesToKeep: 1, PointerAlignment: Left, ReflowComments: false, SortIncludes: false, NamespaceIndentation: All, ContinuationIndentWidth: 4, AllowAllArgumentsOnNextLine: false, AllowAllParametersOfDeclarationOnNextLine: false, AllowShortBlocksOnASingleLine: false, AllowShortCaseLabelsOnASingleLine: false, AllowShortFunctionsOnASingleLine: Empty, AllowShortIfStatementsOnASingleLine: false, AllowShortLoopsOnASingleLine: false, AlwaysBreakTemplateDeclarations: true, BreakConstructorInitializersBeforeComma: true, BinPackArguments: true, BinPackParameters: true}" },
                    }),
                    null_ls.builtins.completion.spell,
                },
            })
        end,
    },  -- lsp服务器
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function ()
            local persistence = require("persistence")
            persistence.setup({})
        end,
    },  -- 会话保持
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
    },  -- 文件类型识别
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            local lualine = require("lualine")
            local luaTheme = require("lualine.themes.modus-vivendi")
            luaTheme.normal.c.bg = 'transparent_background'
            luaTheme.insert.c.bg = 'transparent_background'
            luaTheme.visual.c.bg = 'transparent_background'
            luaTheme.replace.c.bg = 'transparent_background'
            lualine.setup({
                options = {
                    theme = luaTheme,
                    -- component_separators = { left = '|', right = '|'},
                    -- section_separators = { left = '', right = ''},
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' }
                }
            })
        end
    },  -- 状态栏
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function ()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                }
            })
        end,
    },  -- 标签栏
    {
        'dstein64/nvim-scrollview',
    },  -- 滚动条
})

-- 主题配置
require("catppuccin").setup({
    flavour = "macchiato",          -- 配置使用 catppuccin-macchiato 配色
    transparent_background = true,  -- 配置 透明背景
})

vim.cmd.colorscheme("catppuccin")

-- neodev
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

-- lspconfig
require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    capabilities = capabilities,
}
lspconfig.clangd.setup {
    capabilities = capabilities,
}

-- nvim cmp
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- 补全引擎
local luasnip = require("luasnip")
local cmp = require'cmp'
-- 补全图标
local lspkind = require('lspkind')
-- 自动括号等
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as 
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            before = function (entry, vim_item)
                return vim_item
            end
        })
    },
    window = {
        -- 窗口边框
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    },
    {
        { name = 'buffer' },
    }),

})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    },
    {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    })
})
