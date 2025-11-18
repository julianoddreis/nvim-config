return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		options = {
			always_show_bufferline = false,
			max_name_length = 25,
			tab_size = 30,
		},
	},
}
