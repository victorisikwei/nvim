vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.wrap = false
-- vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.laststatus = 3 -- always and ONLY the last window
vim.opt.splitbelow = true
vim.opt.undofile = true
-- vim.opt.whichwrap = "bs<>[]hl"
vim.opt.smartindent = true
-- vim.opt.confirm = true
vim.opt.updatetime = 80
vim.opt.timeoutlen = 80
vim.opt.autochdir = true
vim.opt.showtabline = 0
vim.opt.signcolumn = "no"
-- vim.opt.list = true
vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = " " }) -- remove [~] character from nvim
vim.o.winborder = 'rounded'

---------KEYMAPS---------
---======================================
---=====================================

vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")

vim.keymap.set("n", ";", ":")

-- move to next tab
vim.keymap.set("n", "<leader>n", ":tabNext<CR>", { silent = true })


-- kill all buffer except the current one
vim.keymap.set("n", "<leader>bk", "<cmd>%bd|e#<CR>")

--- move stuff
-- vim.keymap.set("n", "Q", "<nop>") --- TODO: Check what this do latter
vim.keymap.set("n", ",", "<nop>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- go to normal mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>c", ":close<CR>", { silent = true })

vim.keymap.set("n", "<leader>1", "<cmd>only!<CR>", { silent = true }) -- NOTE: check <cmd> vs ":"
vim.keymap.set("i", "<leader>1", "<cmd>only!<CR>", { silent = true }) -- NOTE: check <cmd> vs ":"
vim.keymap.set("t", "<leader>1", "<cmd>only!<CR>", { silent = true }) -- NOTE: check <cmd> vs ":"

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +1<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>", { silent = true })

-- Easy window movement
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")

-- past into command mode from system clipboard
vim.keymap.set("i", "<C-S-V>", "<C-R>+")

-- Indenting helper
vim.keymap.set("v", "<", "<gv^")
vim.keymap.set("v", ">", ">gv^")

--- Terminal
vim.keymap.set("n", "<leader>t", ":tabnew<CR>:terminal<CR>")
vim.keymap.set("n", "<leader>r", ":terminal ")

-- Different keys for system registery yank and paste
vim.keymap.set("v", "<leader>d", '"_d') --- deleting into the void register V:mode
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "P", '"+p')
vim.keymap.set("v", "P", '"+p')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("v", "Y", '"+y')

-- Edit a file
vim.keymap.set("n", "<leader>.", ":e ~/")

-- neovvim buffer yank
-- yank entire line
vim.keymap.set("n", "yy", "VY")
vim.keymap.set("v", "yy", "VY")

-- Mini.Pick helper key mappings
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>Pick buffers<CR>")
vim.keymap.set("n", "<leader>lg", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
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

-- Enable the LSPs server
vim.lsp.enable({
    'lua-language-server',
    'ols',
    -- "gopls",
    --'yamlls'
})

------STARTUP LAZY PLUGIN MANAGER-------------
require("config.lazy")
