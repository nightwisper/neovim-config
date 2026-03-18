return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		keymap.set("n", "<leader>bf", builtin.buffers, { desc = "[B]uffer [F]ind" })

		-- Find Files: The standard search for any file in your current directory
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })

		-- Git Files: High-speed search that respects your .gitignore (Perfect for React/Go)
		keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it Files" })

		-- Live Grep: Search for a string across all files as you type
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind by [S]earch (Grep)" })

		-- Grep String: Search for the specific word your cursor is currently resting on
		keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })

		-- Resume: Jump back into your last search exactly where you left off
		keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })

		keymap.set("n", "<leader>fm", builtin.commands, { desc = "[F]ind Co[m]mands" })

		-- lsp_references
		keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope References" })

		-- Custom function to search Neovim config
		local function search_config()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end

		-- Keymap to trigger it
		keymap.set("n", "<leader>sc", search_config, { desc = "[S]earch [C]onfig" })
	end,
}
