vim.opt.expandtab = false
-- vim.opt.guicursor = "n-v-c:block,i:block"
vim.opt.shiftwidth = 0
vim.opt.wildmenu = false
vim.opt.tabstop = 4
-- vim.opt.scrolloff = 8
vim.opt.equalalways = false
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.winblend = 30
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.whichwrap = "bs<>[]hl"
vim.opt.linespace = 4
vim.opt.smartindent = true
vim.opt.updatetime = 80
vim.opt.timeoutlen = 80
vim.opt.autochdir = true -- change the current working directory whenever you open a file
vim.opt.list = true
vim.opt.listchars = { tab = ".." }
vim.opt.virtualedit = "all"
vim.g.mapleader = " "
-- vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars:append({ eob = " " }) -- remove [~] character from nvim

--[--------------------------------]
-----Custom SatusLine
-- function MyStatusLine()
--     -- return "[Line:%l of %L][Col:%c]  %= [%F%m%r%h%w]  [Filetype:%Y] %= [pos:%p%%]"
--     return "               %=[pos:%p%%] %=[%F%m%r%h%w] [Filetype:%Y]"
-- end
-- vim.opt.statusline = "%!v:lua.MyStatusLine()"
--[-----------------------------------------------]

-------NEOVIDE STUFFS--------
if vim.g.neovide then
	vim.o.guifont = "Sligoil Micro:h6" -- text below applies for VimScript
	-- vim.o.guifont = "FantasqueSansM Nerd Font:h5.4b" -- text below applies for VimScript
	-- vim.g.neovide_hide_mouse_when_typing = true
	-- vim.g.neovide_cursor_animation_length = 0.13
	vim.g.neovide_cursor_trail_size = 0.3
	-- vim.g.neovide_cursor_animation_length = 0.05
	-- vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
---------KEYMAPS---------

--- move stuff
vim.keymap.set("n", "Q", "<nop>") --- TODO: Check what this do latter
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("c", "<C-v>", "<C-r>+") -- command mode paste

vim.keymap.set("v", "<", "<gv^")
vim.keymap.set("v", ">", ">gv^")

-- vim.keymap.set("i", "<BS>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "a", "<NOP>", { noremap = true })

vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<C-q>", "<cmd>%bd|e#<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", ";", ":")
-- vim.keymap.set("n", "D", "Vd")
-- vim.keymap.set("i", "jk", "<Esc>") -- easy escape
vim.keymap.set("i", "jj", "<Esc>") -- easy escape
vim.keymap.set("i", "kk", "<Esc>") -- easy escape
vim.keymap.set("i", "kj", "<Esc>") -- easy escape
vim.keymap.set("n", "<leader>q", ":bd!<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>silent only!<CR>") -- NOTE: check <cmd> vs ":"
-- vim.keymap.set("n", "<C-f>", ":e ~/.config/nvim/init.lua<CR>")
-- Tabs and switching tabs
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", "<cmd>tabn<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>tabp<CR>", { silent = true })
-- Toggle Filemanager
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

vim.keymap.set("n", "<C-,>", "^")
vim.keymap.set("n", "<C-.>", "$")
vim.keymap.set("v", "<C-,>", "^")
vim.keymap.set("v", "<C-.>", "$")

-- Easy window movement
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("i", "<C-S-V>", "<C-R>+")
-- Scaling
vim.keymap.set(
	"n",
	"<C-=>",
	":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
	{ silent = true }
)
vim.keymap.set(
	"n",
	"<C-->",
	":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
	{ silent = true }
)
vim.keymap.set("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
--- Terminal
vim.keymap.set("n", "<leader>t", ":20sv<CR>:enew<CR>:terminal<CR>")
-- Exit terminal mode
vim.keymap.set("t", "<C-k><C-k>", "<C-\\><C-n>:bd!<CR>")
-- vim.keymap.set("n", "<C-t>t", "<cmd>tabnew<CR>")
-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +1<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>")
-- Different keys for system registery yank and paste
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("v", "<leader>y", '"+y')
-- vim.keymap.set("n", "<leader>d", '"_d') -----deleting into the void register N:mode
vim.keymap.set("v", "<leader>d", '"_d') --- deleting into the void register V:mode
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
	colorscheme retrobox
 	autocmd TermOpen * startinsert
	highlight VertSplit ctermbg=NONE guibg=NONE
	highlight WinSeparator guibg=NONE" ctermbg=NONE guifg=#55587A
	set laststatus=3
	]])

--{-------------------------------------------------------------
-- Show cursorline only in the active window
vim.api.nvim_create_autocmd("WinEnter", {
	pattern = "*",
	callback = function()
		-- vim.wo.cursorline = true
	end,
})
-- Turn-off cursorline on window leave
vim.api.nvim_create_autocmd("WinLeave", {
	pattern = "*",
	callback = function()
		-- vim.wo.cursorline = false
	end,
})
--{--------------------------------------------------------------|---}

-- Scratch buffer
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local bufname = vim.api.nvim_buf_get_name(0)
		if bufname == "" then
			vim.bo.buftype = "nofile" -- Make it a scratch buffer
			vim.bo.bufhidden = "hide" -- Hide when abandoned
			vim.bo.swapfile = false -- No swap file
		end
	end,
})

-- Terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- NOTE:  Deal with this later
-- ------------------
-- vim.keymap.set("n", "<leader>2", function()
--     vim.cmd.vnew()
--     vim.cmd.term()
--     vim.cmd.wincmd("J")
--     vim.api.nvim_win_set_height(0, 15)
--     Job_id = vim.bo.channel
-- end)
--
-- vim.keymap.set("n", "<space>3", function()
--     vim.fn.chansend(Job_id, { "ls -al\r\n" })
-- end)
-- ]]]]]]]]]]]]]]]]]]]]]]]]]]]

------STARTUP LAZY PLUGIN MANAGER-------------
require("config.lazy")
-- Notes ------------------------------------------------]]
-- Use Ctrl+R followed by " to paste from the unnamed register.
-- --------------------------------------------------------]]
