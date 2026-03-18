-- lua/utils/neotree.lua
local nt_utils = {}

---Checks if any window is currently displaying a Neo-tree buffer
function nt_utils.is_neotree_open()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "neo-tree" then
			return true
		end
	end
	return false
end

---Toggles Neo-tree and forces the preview to open if it just appeared
function nt_utils.toggle_with_preview()
	require("lazy").load({ plugins = { "neo-tree.nvim" } })

	vim.cmd("Neotree float toggle")

	vim.schedule(function()
		if nt_utils.is_neotree_open() then
			local keys = vim.api.nvim_replace_termcodes("P", true, false, true)
			vim.api.nvim_feedkeys(keys, "m", false)
		end
	end)
end

return nt_utils
