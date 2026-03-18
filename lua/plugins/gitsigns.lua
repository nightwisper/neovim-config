return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- 1. Visual signs in the gutter
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "┆" },
            },

            -- 2. The "Who did this?" feature (Virtual Text)
            current_line_blame = true, 
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- End of line
                delay = 500,
            },

            -- 3. Useful Keymaps
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation through changes (hunks)
                map("n", "]h", function()
                    if vim.wo.diff then return "]h" end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next [H]unk" })

                map("n", "[h", function()
                    if vim.wo.diff then return "[h" end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true, desc = "Prev [H]unk" })

                -- Actions
                map("n", "<leader>ghp", gs.preview_hunk, { desc = "[G]it [H]unk [P]review" })
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { desc = "[G]it [H]unk [B]lame" })
                map("n", "<leader>ghd", gs.diffthis, { desc = "[G]it [H]unk [D]iff" })

                -- Resetting/Staging (Use with caution!)
                map("n", "<leader>ghs", gs.stage_hunk, { desc = "[G]it [H]unk [S]tage" })
                map("n", "<leader>ghr", gs.reset_hunk, { desc = "[G]it [H]unk [R]eset" })
            end,
        },
    },
}
