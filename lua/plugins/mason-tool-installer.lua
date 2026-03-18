return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                -- 1. List every tool you want auto-installed
                ensure_installed = {
                    -- Formatters (The ones we just set up in Conform)
                    "stylua",
                    "black",
                    "isort",
                    "prettierd",
                    "gofumpt",
                    "goimports",
                    "google-java-format",
                    "csharpier",
                    "clang-format",

                    -- Linters (Extra static analysis)
                    "eslint_d",
                    "golangci-lint",
                    "pylint",
                },

                -- 2. Configuration
                auto_update = true,
                run_on_start = true,
                start_delay = 3000, -- Delay for 3s to let the UI load first
            })
        end,
    },
}
