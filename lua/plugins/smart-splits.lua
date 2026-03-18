return {
    'mrjones2014/smart-splits.nvim',
        lazy = false, -- Recommended for seamless multiplexer integration
            opts = {
                -- Ignored filetypes (only while resizing)
                    ignored_filetypes = { 'NvimTree', 'neo-tree', 'trouble' },
                -- Desired behavior when at the edge of a Neovim split
                    at_edge = 'wrap', 
            },
        keys = {
            -- Moving between splits/panes
            { '<C-h>', function() require('smart-splits').move_cursor_left() end, desc = 'Move left' },
            { '<C-j>', function() require('smart-splits').move_cursor_down() end, desc = 'Move down' },
            { '<C-k>', function() require('smart-splits').move_cursor_up() end, desc = 'Move up' },
            { '<C-l>', function() require('smart-splits').move_cursor_right() end, desc = 'Move right' },
            -- Resizing splits (Optional: Alt + hjkl)
            { '<A-h>', function() require('smart-splits').resize_left() end, desc = 'Resize left' },
            { '<A-j>', function() require('smart-splits').resize_down() end, desc = 'Resize down' },
            { '<A-k>', function() require('smart-splits').resize_up() end, desc = 'Resize up' },
            { '<A-l>', function() require('smart-splits').resize_right() end, desc = 'Resize right' },
        },
}
