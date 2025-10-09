-- Cangjie filetype plugin
-- Place this file at: ftplugin/cangjie.lua

-- Only load this file once per buffer
if vim.b.did_ftplugin then
    return
end
vim.b.did_ftplugin = 1

-- Save settings for undo
local undo_ftplugin = vim.b.undo_ftplugin or ""

-- Comment configuration
vim.bo.commentstring = "// %s"
vim.bo.comments = "s1:/*,mb:*,ex:*/,://,b:#"

-- Indentation settings
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Folding configuration
vim.wo.foldmethod = "indent"
vim.wo.foldlevel = 99
vim.wo.foldnestmax = 10

-- Format options
-- t: Auto-wrap text using textwidth
-- c: Auto-wrap comments using textwidth
-- q: Allow formatting of comments with "gq"
-- j: Remove comment leader when joining lines
-- n: Recognize numbered lists
-- r: Auto-insert comment leader after <Enter> in insert mode
vim.bo.formatoptions = "tcqjnr"

-- Matching pairs for % command
vim.b.match_words = "(:),{:},[:],\"\"\":\"\"\"" 

-- Define suffixes that get lower priority when doing tab completion
vim.bo.suffixesadd = ".cj"

-- Pattern for comments (for formatting)
vim.bo.comments = "s1:/*,mb:*,ex:*/,://"

-- Undo ftplugin settings when switching to another filetype
vim.b.undo_ftplugin = table.concat({
    "setlocal commentstring<",
    "setlocal comments<",
    "setlocal expandtab<",
    "setlocal shiftwidth<",
    "setlocal tabstop<",
    "setlocal softtabstop<",
    "setlocal autoindent<",
    "setlocal smartindent<",
    "setlocal formatoptions<",
    "setlocal suffixesadd<",
}, " | ")

-- Optional: Define text objects for functions, classes, etc.
-- This would require additional plugins or treesitter

-- Optional: Set up buffer-local keymaps
local opts = { buffer = true, silent = true, noremap = true }

-- Example: Quick compile/run keymaps (adjust commands as needed)
-- vim.keymap.set("n", "<leader>cc", ":!cangjie build<CR>", opts)
-- vim.keymap.set("n", "<leader>cr", ":!cangjie run<CR>", opts)
