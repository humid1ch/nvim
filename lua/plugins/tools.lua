-- ============================================================================
-- plugins/tools.lua - 工具类插件配置
-- ============================================================================

return {
    -- LeetCode 插件
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            cn = {
                enabled = true,
                translator = true,
                translate_problems = true,
            },
        },
    },
}
