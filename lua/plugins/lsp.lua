return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp", -- For autocompletion
        },
        config = function()
            -- 1. Setup Mason
            require("mason").setup()

            local mason_lspconfig = require("mason-lspconfig")

            -- 2. Define the servers you want Mason to auto-install
            local servers = {
                omnisharp = {},     -- C#
                gopls = {},         -- Go
                pyright = {},       -- Python
                ts_ls = {},         -- TS/JS (React/React Native)
                jdtls = {},         -- Java
                rust_analyzer = {}, -- Rust
                clangd = {},        -- C
                lua_ls = {          -- Lua (with Neovim support)
                    settings = {
                        Lua = { diagnostics = { globals = { "vim" } } }
                    }
                },
            }

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            -- 4. Tell nvim-lspconfig to use these settings for every server
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do

                -- Default configuration for all servers
                local config = {
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        local opts = { buffer = bufnr, remap = false }
                        local keymap = vim.keymap

                        -- Standard LSP Keymaps (No Distro/Plugin dependencies)

                        -- LSP Information & Navigation
                        keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
                        keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
                        keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
                        keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "[G]oto T[y]pe Definition" })
                        keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

                        -- Documentation & Help
                        keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
                        keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
                        keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

                        -- Code Actions & Refactoring
                        keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
                        keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
                        keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
                        keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

                        -- Note: Snacks.rename and Snacks.words (Reference jumping) are omitted 
                        -- until you choose to install the Snacks.nvim plugin.
                    end,
                }

                -- Language-specific overrides
                if server_name == "lua_ls" then
                    config.settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } }
                        }
                    }
                end

                -- Initialize the server via lspconfig
                vim.lsp.config(server_name, config)
            end
        end
    }
}
