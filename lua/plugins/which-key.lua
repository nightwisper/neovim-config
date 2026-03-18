return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300 -- Popup appears after 300ms
        end,
        opts = {
            -- We can "label" our leader groups here
            defaults = {
                ["<leader>f"] = { name = "[F]ind / [F]iles" },
                ["<leader>s"] = { name = "[S]earch / [S]election" },
                ["<leader>l"] = { name = "[L]SP" },
            },
        },
    },
}
