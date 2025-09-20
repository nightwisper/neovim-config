return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function() 
    require("cyberdream").setup({
      -- Set light or dark variant
      variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

      -- Enable transparent background
      transparent = true,

      -- Enable italics comments
      italic_comments = true,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = true,

      -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
      borderless_pickers = true,

      -- Set terminal colors used in `:terminal`
      terminal_colors = true,
    })

    vim.cmd("colorscheme cyberdream")
  end,
}

