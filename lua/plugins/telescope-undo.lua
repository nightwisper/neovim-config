return {
    "debugloop/telescope-undo.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").setup({
            extensions = {
                undo = {
                    -- Use 'diff' to see what changed (like git diff)
                    use_delta = true, 
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            },
        })
        require("telescope").load_extension("undo")
    end,
    keys = {
        { "<leader>su", "<cmd>Telescope undo<cr>", desc = "[S]earch [U]ndo History" },
    },
}
