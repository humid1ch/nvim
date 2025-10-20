return {
    -- nvim-autopairs 的 Cangjie 支持
    {
        "windwp/nvim-autopairs",
        optional = true,
        event = "InsertEnter",
        opts = function(_, opts)
            opts = opts or {}
            opts.check_ts = true
            opts.ts_config = opts.ts_config or {}
            opts.ts_config.cangjie = { "string", "comment" }
            return opts
        end,
        config = function(_, opts)
            local autopairs = require("nvim-autopairs")
            autopairs.setup(opts)
            local Rule = require("nvim-autopairs.rule")
            -- Cangjie 特定的自动配对规则
            autopairs.add_rules({
                -- 原始字符串
                Rule("r'", "'", "cangjie"),
                Rule('r"', '"', "cangjie"),
                -- 字节字符串
                Rule("b'", "'", "cangjie"),
                Rule('b"', '"', "cangjie"),
                -- JSON 字符串
                Rule('J"', '"', "cangjie"),
                -- 多行字符串
                Rule('"""', '"""', "cangjie")
                    :with_pair(function(opts)
                        return not opts.line:match('"""$')
                    end),
            })
        end,
    },
    -- nvim-treesitter 配置
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies={
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "cpp", "lua" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = { enable = true }
        },
        config = function(_, opts)
            -- 注册自定义 parser
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.cangjie = {
                install_info = {
                    url = "https://gitcode.com/Cangjie-SIG/tree-sitter-cangjie", -- 确保能访问
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false, -- 避免安装失败
                },
                filetype = "cangjie",
            }

            require("nvim-treesitter.configs").setup(opts)

            -- 注册 filetype 映射
            -- 🔹 注册语言别名
            vim.treesitter.language.register('cangjie', 'cangjie')
            vim.treesitter.language.register('cangjie', 'cj')
        end,
    },
}
