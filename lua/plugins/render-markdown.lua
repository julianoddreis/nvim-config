return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "codecompanion" },
	opts = {
		render_modes = true, -- Render in ALL modes
		sign = {
			enabled = false, -- Turn off in the status column
		},
		latex = {
			enabled = false, -- Disable LaTeX rendering
		},
		completions = { blink = { enabled = true } },
	},
}
