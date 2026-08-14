return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- The `main` rewrite has no `configs` module and no auto-enabling:
		-- parsers are installed explicitly, features are enabled per buffer.
		require("nvim-treesitter").install({
			"lua",
			"python",
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"regex",
			"sql",
			"dockerfile",
			"toml",
			"json",
			"prisma",
			"gitignore",
			"yaml",
			"make",
			"cmake",
			"markdown",
			"markdown_inline",
			"bash",
			"tsx",
			"css",
			"html",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter-enable", { clear = true }),
			callback = function(args)
				-- Not every filetype has a parser installed: skip silently.
				if not pcall(vim.treesitter.start, args.buf) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
