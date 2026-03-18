return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers", -- show buffers, not tabs
                separator_style = "slant", -- or "thick" / "thin"
                always_show_bufferline = true,
                show_buffer_close_icons = true,
                show_close_icon = false,
            }
        })
    end
}
