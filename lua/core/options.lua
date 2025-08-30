-- make line numbers default
vim.opt.nu = true
-- make relative numbers default
vim.opt.relativenumber = true
-- insert n spaces for a tab
vim.opt.tabstop = 4
-- number of spaces that a tab counts for while performing editing operations
vim.opt.softtabstop = 4
-- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 4
-- convert tab to spaces
vim.opt.expandtab = true
-- make indenting smarter
vim.opt.smartindent = true
-- display lines as one long line
vim.opt.wrap = false
-- don't create swap files
vim.opt.swapfile = false
-- don't create backup file
vim.opt.backup = false
-- currently not used but can be usefull with undodir plug
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- save undo history
vim.opt.undofile = true
-- set highligh on search
vim.opt.hlsearch = true
-- keep highlighting
vim.opt.incsearch = true
-- to enable hightligh groups
vim.opt.termguicolors = true
vim.o.numberwidth = 4
-- always have 8 lines below or up the cursor if possible
vim.opt.scrolloff = 10
-- keep signcolumn on by default
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- decrease update time
vim.opt.updatetime = 250
-- decrease mapped sequence wait time
vim.o.timeoutlen = 300
-- show a bar at n characters
vim.opt.colorcolumn = "80"
-- set <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
-- disable --INSERT-- as we already have mode in status line
vim.o.showmode = false
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- enable mouse
vim.o.mouse = "a"
-- enable break indent
vim.o.breakindent = true
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- hightlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- sync clipboard between OS and neovim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
