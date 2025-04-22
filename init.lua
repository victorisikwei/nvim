vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.laststatus = 3 -- always and ONLY the last window
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.virtualedit = "all"
vim.opt.smartindent = true
vim.opt.updatetime = 60
vim.opt.timeoutlen = 60
vim.opt.autochdir = true
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
-- vim.opt.list = true
vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = "~" }) -- remove [~] character from nvim
vim.o.winborder = 'rounded'
vim.g.termguicolors = 1

---------KEYMAPS---------
---======================================
---=====================================

vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")

vim.keymap.set("n", ";", ":")

vim.keymap.set("c", "<C-v>", "<C-r>+") -- command mode paste

vim.keymap.set("n", "-", "$")
vim.keymap.set("v", "-", "$")

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

vim.keymap.set("n", "<leader>1", "<cmd>only!<CR>", { silent = true }) -- NOTE: check <cmd> vs ":"

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +1<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>", { silent = true })

-- past into command mode from system clipboard
vim.keymap.set("i", "<C-S-V>", "<C-R>+")

-- indenting helper
vim.keymap.set("v", "<", "<gv^")
vim.keymap.set("v", ">", ">gv^")

-- Different keys for system registery yank and paste
-- vim.keymap.set("v", "<leader>d", '"_d') --- deleting into the void register V:mode
-- vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "P", '"+p')
vim.keymap.set("v", "P", '"+p')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("v", "Y", '"+y')

-- Edit a file
vim.keymap.set("n", "<leader>.", ":e ~/")

-- yank entire line
vim.keymap.set("n", "yy", "VY")
vim.keymap.set("v", "yy", "VY")


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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<CR>", function()
            local file = vim.fn.expand("<cfile>")
            if file:match("^https?://") then
                vim.fn.jobstart({ "xdg-open", file }, { detach = true })
            elseif vim.fn.filereadable(file) == 1 or vim.fn.isdirectory(file) == 1 then
                vim.cmd("edit " .. file)
            else
                -- Fallback to default <CR>
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
            end
        end, { buffer = true, desc = "Smart open for markdown links and URLs" })
    end
})


-- Enable the LSPs server
vim.lsp.enable({
    'lua-language-server',
    'v-analyzer',
    'ols',
    'go',
    'zls',
    --'yamlls'
})
vim.diagnostic.config({ virtual_text = true })

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})

------STARTUP LAZY PLUGIN MANAGER-------------
require("config.lazy")
