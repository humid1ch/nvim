-- ============================================================================
-- config/lsp.lua - LSP 服务器配置
-- ============================================================================

-- 配置 neodev（需要在 lspconfig 之前）
require("neodev").setup({
    -- 可以在这里添加 neodev 配置选项
})

-- 初始化 Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- 获取补全能力
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP 配置
local lspconfig = require('lspconfig')

-- Lua Language Server
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                enable = true,
                disable = { "unused-local", "unused-function", "unused-vararg" },
                globals = { "vim" }
            },
            workspace = {
                checkThirdParty = false
            }
        }
    }
})

-- ============================================================================
-- C/C++ Language Server (clangd)
-- ============================================================================
lspconfig.clangd.setup({
    capabilities = capabilities,
})
