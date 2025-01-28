return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = { width = 40 },
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				local nvim_tree = require("nvim-tree.api")
				local nvim_tree_view = require("nvim-tree.view")

				-- Verifica se a nvim-tree está aberta
				if nvim_tree_view.is_visible() then
					-- Navega até o arquivo atual no buffer
					nvim_tree.tree.find_file()
				end
			end,
		})
	end,
}
