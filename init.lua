vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.so = 999

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Decrease update time
vim.opt.updatetime = 250

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_set_keymap("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]b", ":bnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("config.lazy")
