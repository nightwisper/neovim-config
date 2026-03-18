return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local autopairs = require("nvim-autopairs")

            autopairs.setup({
                check_ts = true, -- Use Treesitter to check for pairs (don't add inside strings)
                ts_config = {
                    lua = { "string" }, -- Don't add pairs in lua string nodes
                    javascript = { "template_string" },
                },
            })

            -- If you're using nvim-cmp, this makes them work together:
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
}
