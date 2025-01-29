return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = "<C-t>",
			size = 55,
			start_in_insert = true,
			direction = "vertical",
			hide_numbers = true,
		})
	end,
}
