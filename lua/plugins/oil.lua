return {
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                -- 1. Floating Window Style
                float = {
                    padding = 2,
                    max_width = 160,
                    max_height = 0,
                    border = "rounded",
                    win_options = { winblend = 0 },
                },
                -- 2. Preview Configuration
                preview = {
                    border = "rounded",
                    -- Update the preview window as the cursor moves
                    update_on_cursor_moved = true,
                    preview_method = "load", -- Faster for larger projects
                },
                -- 3. Keymaps inside the Oil buffer
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["q"] = "actions.close",
                    ["g."] = "actions.toggle_hidden",
                },
                view_options = {
                    show_hidden = true,
                },
            })

            vim.keymap.set(
                "n",
                "<leader>e",
                function() 
                    require("oil").toggle_float(nil, {
                        preview = { vertical = true, width = 120 } -- This forces the preview to open by default
                    })
                end,
                { desc = "Oil File [E]xplorer" })
        end,
    },
}
