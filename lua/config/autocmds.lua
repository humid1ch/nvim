-- ============================================================================
-- config/autocmds.lua - 自动命令配置
-- ============================================================================

-- ============================================================================
-- 文件类型识别
-- ============================================================================

-- 让 .mdx 文件识别为 markdown
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.mdx",
    command = "set filetype=markdown"
})

-- 将 .hpp 文件识别为 cpp 文件类型
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.hpp",
    callback = function()
        vim.bo.filetype = "cpp"
    end
})

-- ============================================================================
-- 复制高亮
-- ============================================================================

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    callback = function()
        vim.highlight.on_yank({
            timeout = 300,
        })
    end,
})

-- ============================================================================
-- 特定文件类型的快捷键
-- ============================================================================

-- C/C++/Json/Java 等语言的注释快捷键 (Ctrl+/)
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c", "cpp", "cc", "hpp", "h", "java", "json", "js", "go", "cj" },
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-/>", "I// <Esc>", { silent = true })
        vim.api.nvim_set_keymap("x", "<C-/>", "I// <Esc>", { silent = true })
    end
})

-- C/C++ Clang-Format 格式化快捷键 (Ctrl+K)
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c", "cpp", "cc", "hpp", "h" },
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-K>", ":lua vim.lsp.buf.format()<CR>", 
            { noremap = true, silent = true })
    end
})

-- Lua 注释快捷键 (Ctrl+/)
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "lua" },
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-/>", "I-- <Esc>", { silent = true })
        vim.api.nvim_set_keymap("x", "<C-/>", "I-- <Esc>", { silent = true })
    end
})
