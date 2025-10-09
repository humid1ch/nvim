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
        optional = true,
        opts = function(_, opts)
            opts = opts or {}
            opts.highlight = opts.highlight or {}
            opts.highlight.enable = true
            -- 为 Cangjie 禁用 treesitter,使用 vim 语法
            local disable = opts.highlight.disable or {}
            if type(disable) == "function" then
                local old_disable = disable
                opts.highlight.disable = function(lang, buf)
                    if lang == "cangjie" then
                        return true
                    end
                    return old_disable(lang, buf)
                end
            elseif type(disable) == "table" then
                table.insert(disable, "cangjie")
                opts.highlight.disable = disable
            else
                opts.highlight.disable = { "cangjie" }
            end
            return opts
        end,
    },
}
