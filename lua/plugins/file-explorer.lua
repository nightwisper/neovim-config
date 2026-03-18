local nt_utils = require("lua.utils.neo-tree")

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			window = {
				position = "float",
				popup = {
					position = { col = "10%", row = "50%" },
					size = { width = "30%", height = "80%" },
				},
				mappings = {
					["<space>"] = "none",
					-- Use a simple toggle key we know is valid
					["P"] = {
						"toggle_preview",
						config = {

							use_float = true,
							position = "float",
							popup = {
								position = { col = "36%", row = "50%" },
								size = { width = "55%", height = "80%" },
							},
						},
					},
					["l"] = "open",
					["h"] = "close_node",
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				nt_utils.toggle_with_preview()
			end,
			desc = "File [E]xplorer",
		},
	},
}
