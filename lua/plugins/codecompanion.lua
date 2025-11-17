return {
	"olimorris/codecompanion.nvim",
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
	},
	opts = {
		default_adapter = "claude_code",
		display = {
			diff = {
				enabled = false, -- Disable diff file generation
			},
			chat = {
				window = {
					layout = "vertical", -- vertical, horizontal, float
					opts = {
						number = false,
						relativenumber = false,
						cursorline = false,
					},
				},
				intro_message = "Welcome to CodeCompanion! How can I help you today?",
				separator = "─", -- Separator between messages
				show_settings = true,
				show_token_count = true,
			},
		},
		strategies = {
			chat = {
				adapter = "claude_code",
				roles = {
					llm = "claudinho",
					user = "juliano",
				},
				slash_commands = {
					["buffer"] = {
						description = "Insert open buffers",
						opts = {
							contains_code = true,
							provider = "default",
						},
					},
					["file"] = {
						description = "Insert a file",
						opts = {
							contains_code = true,
							max_lines = 1000,
						},
					},
				},
			},
			inline = {
				adapter = "claude_code",
			},
		},
		adapters = {
			acp = {
				claude_code = function()
					return require("codecompanion.adapters").extend("claude_code", {
						env = {
							CLAUDE_CODE_OAUTH_TOKEN = os.getenv("CLAUDE_CODE_OAUTH_TOKEN"),
						},
					})
				end,
			},
		},
		extensions = {
			spinner = {},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"franco-ruggeri/codecompanion-spinner.nvim",
	},
}
