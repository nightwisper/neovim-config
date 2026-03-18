local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights" })
keymap.set("n", "<leader>so", "<cmd>%so<cr>", { desc = "Leader [S]hout [O]ut" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit [H]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual Sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "[S]plit [X]close" })

-- Buffer Management Keymaps
keymap.set("n", "<leader>bo", "<cmd>enew<cr>", { desc = "[B]uffer [N]ew" })
keymap.set("n", "<leader>bx", "<cmd>bd<cr>", { desc = "[B]uffer [X]close" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "[B]uffer [P]revious" })
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "[B]uffer [N]ext" })

-- Fast jump to specific buffers (1-9)
for i = 1, 9 do
  keymap.set("n", "<leader>b" .. i, function()
    require("bufferline").go_to(i, true)
  end, { desc = "Go to buffer " .. i })
end
