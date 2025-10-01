-- ============================================================================
-- config/cmp.lua - nvim-cmp 补全配置
-- ============================================================================

-- 检查光标前是否有单词
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- 获取补全引擎和插件
local luasnip = require("luasnip")
local cmp = require('cmp')
local lspkind = require('lspkind')

-- 加载友好的代码片段
require("luasnip.loaders.from_vscode").lazy_load()

-- 自动括号集成
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- nvim-cmp 主配置
cmp.setup({
    -- 代码片段引擎配置
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    -- 补全菜单格式化
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function(entry, vim_item)
                return vim_item
            end
        }),
        fields = { 'kind', 'abbr', 'menu' },
        expandable_indicator = true
    },
    -- 窗口样式
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- 按键映射
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        -- Tab 键：选择下一项或展开代码片段
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- Shift+Tab 键：选择上一项或跳回代码片段
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
    -- 补全源配置
    sources = cmp.config.sources({
        {
            name = 'nvim_lsp',
            -- 过滤掉来自 LSP 的 Text 类型补全
            entry_filter = function(entry, ctx)
                local kind = vim.lsp.protocol.CompletionItemKind[entry:get_kind()]
                if kind == "Text" then
                    return false
                end
                return true
            end
        },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
})

-- Git 提交补全
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})

-- 命令行搜索补全 (/ 和 ?)
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- 命令行命令补全 (:)
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
