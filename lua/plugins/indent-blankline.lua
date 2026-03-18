return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            -- 1. Use a subtle character for the line
            indent = {
                char = "┆", -- You can also use "│" or "┆"
            },
            -- 2. Scoped highlighting (shows which block you're currently in)
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
                highlight = { "Function", "Label" }, -- Uses your theme colors
            },
            -- 3. Don't show lines on the dashboard or popups
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                },
            },
        },
    },
}
