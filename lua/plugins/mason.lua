return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {}, -- This can stay empty because tool-installer handles it
    ui = {
      border = "rounded",
    },
  },
}
