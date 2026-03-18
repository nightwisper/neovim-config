return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            -- 1. Languages to install automatically
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "python",
                "go",
                "rust",
                "java",
                "c_sharp"
            },

            -- 2. Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- 3. Automatically install missing parsers when you open a new filetype
            auto_install = true,

            -- 4. The main event: Highlighting
            highlight = {
                enable = true,
                -- Set this to true if you want standard vim regex highlighting 
                -- to run alongside treesitter (usually not needed).
                additional_vim_regex_highlighting = false,
            },

            -- 5. Better indentation (especially for Python and Go)
            indent = { enable = true },

            -- 6. Incremental selection (Pro-tip for refactoring)
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss", -- [S]mart [S]election Start
                    node_incremental = "<leader>si", -- [S]mart [I]ncremental
                    scope_incremental = "<leader>sc", -- [S]mart [C]ontent
                    node_decremental = "<leader>sd", -- [S]mart [D]ecremental
                },
            },
        })
    end
}
