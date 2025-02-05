return {

	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			odiscovery = {
				enabled = false,
			},
			adapters = {
				require("neotest-jest")({
					jestCommand = "yarn test",
					jestConfigFile = function(file)
						local cwd = vim.fn.getcwd()
						return cwd .. "/jest.config.js"
					end,
					jest_test_discovery = false,
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})

		vim.keymap.set("n", "<leader>tr", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end)

		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open()
		end)

		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end)
	end,
}
