--  Basic Options
-- cd %:h changde directory to current file (cd %) change without the file externsion (:h)
-- TODO:
--[[ local setlocal = vim.opt_local
setlocal.expandtab = true
setlocal.textwidth = 50 ]]
vim.cmd("language en_US.utf8")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.opt.hlsearch = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- Decrease update time
vim.opt.updatetime = 200
vim.opt.timeoutlen = 150

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 13

-- no conflict with clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("v", "<leader>Y", '"+Y')

-- overwrite save
vim.keymap.set("n", "<leader>=", "<cmd>SudaWrite<CR>")

-- Allow search term to stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allow cursor to stay in the middle
-- during page up or down
vim.keymap.set("n", "C-d", "<C-d>zz")
vim.keymap.set("n", "C-u", "<C-u>zz")

-- Basic mappings

--[[ vim.keymap.set("n", ";", "<cmd>FineCmdline<CR>") -- easy command mode
vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>") -- easy command mode
vim.keymap.set("n", "<leader>f", "<cmd>FineCmdline<CR>e ./") -- Find files ]]
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>.", ":e ~/")

vim.keymap.set("i", "jk", "<Esc>") -- easy escape
vim.keymap.set("n", "<leader>a", "<cmd>w<CR>") -- easy save

vim.keymap.set("n", "<leader>1", "<cmd>only<CR>") -- Expand current window
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Remove highlights
vim.keymap.set("n", "<leader>x", "<cmd>close<CR>") -- Netrw

-- Easy Tabs
vim.keymap.set("n", "<leader>t", "<cmd>tabe<CR>") -- Newtab
vim.keymap.set("n", "m", "<cmd>tabn<CR>") -- traverse through tabs Next
vim.keymap.set("n", "<S-m>", "<cmd>tabp<CR>") -- traverse through tabs Prev
vim.keymap.set("n", "<leader>c", "<cmd>tabonly<CR>") -- traverse through tabs

vim.keymap.set("n", "<S-y>", "<S-v>y") -- Copy line with just shift-y

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- fonts
vim.keymap.set("n", "<C-=>", "<C-S>=", { desc = "scale" })

--[[ if vim.g.neovide == true then
  vim.opt.linespace = 4
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_hide_mouse_when_typing = false
	vim.api.nvim_set_keymap(
		"n",
		"<C-=>",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-->",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end ]]

-- Easy window movement
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "off number when in terminal mode",
	group = vim.api.nvim_create_augroup("terminal", { clear = true }),
	callback = function()
		vim.opt.nu = false
		vim.opt.relativenumber = false
	end,
})

--[[ vim.api.nvim_create_autocmd("VimEnter", {
	desc = "source session from /home/lazio/Session.vim",
	group = vim.api.nvim_create_augroup("neovide", { clear = true }),
	callback = function()
		vim.cmd("source /home/lazio/Session.vim")
	end,
}) ]]

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "ollykel/v-vim" },
	-- { "zakuro9715/vim-vtools" },

	{ import = "plugins" },
})
