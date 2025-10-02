return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			contrast = "hard",
			overrides = {
				DiffText = { bg = "#3b8132" },
				DiffAdd = { bg = "#405d7e" },
			},
		})
		vim.o.background = "dark"
		vim.cmd("colorscheme gruvbox")
	end,
}
