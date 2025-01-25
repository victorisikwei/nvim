vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wildmenu = false
vim.opt.tabstop = 4
vim.opt.equalalways = false
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.whichwrap = "bs<>[]hl" -- change the current working directory whenever you open a file
vim.opt.linespace = 10
vim.opt.smartindent = true
vim.opt.updatetime = 80
vim.opt.timeoutlen = 80
vim.opt.autochdir = true
vim.opt.virtualedit="all"
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars:append({ eob = " " }) -- remove [~] character from nvim
-----Custom SatusLine
function MyStatusLine()
    return "[Line:%l of %L][Col:%c]  %= [%F%m%r%h%w]  [Filetype:%Y] %= [pos:%p%%]"
end
vim.opt.statusline = "%!v:lua.MyStatusLine()"
-------NEOVIDE STUFFS--------
if vim.g.neovide then
    vim.o.guifont = "FantasqueSansM Nerd Font:h6:b" -- text below applies for VimScript
end
----------KEYMAPS---------
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "D", "Vd")
vim.keymap.set("i", "jk", "<Esc>") -- easy escape
vim.keymap.set("n", "<leader>d", ":bd<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>silent only!<CR>") -- NOTE: check <cmd> vs ":"
vim.keymap.set("n", "<C-f>", ":e ~/.config/nvim/init.lua<CR>")
-- Toggle Filemanager
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
-- Easy window movement
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
-- Scaling
vim.keymap.set("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
vim.keymap.set("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
vim.keymap.set("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })

--- Compile
vim.keymap.set('n', '<leader>c', ':15sv<CR>:enew<CR>:terminal ')
-- End 2 End
vim.keymap.set("n", "<S-e>", "$")
vim.keymap.set("n", "<S-b>", "^")
vim.keymap.set("v", "<S-e>", "$")
vim.keymap.set("v", "<S-b>", "^")
-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +1<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>")
-- Different keys for system registery yank and paste
vim.keymap.set("n", "<leader>p", "+gP")
vim.keymap.set("n", "<leader>y", "+y")
vim.keymap.set("n", "Y", "Vy")
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
---- Colors and som Vim script stuffs ------
vim.cmd([[
colorscheme zio
"autocmd VimEnter * colorscheme "./zio.vim"
set fillchars+=vert:.
set fillchars+=horiz:.
highlight StatusLine ctermbg=0 guibg=#040623 guifg=#5C5761
highlight StatusLineNC ctermbg=0 guibg=NvimDarkGrey2 guifg=NvimDarkGrey2
highlight VertSplit ctermbg=NONE guibg=NONE
highlight WinSeparator ctermbg=NONE guifg=#55587A
highlight wildMenu ctermbg=0 ctermfg=0 guibg=NvimDarkGrey2 guifg=NvimDarkGrey2
set laststatus=3
]])

------STARTUP LAZY PLUGIN MANAGER-------------
require("config.lazy")

