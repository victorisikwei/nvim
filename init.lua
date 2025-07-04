vim.opt.guicursor = "n:block"
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.sidescrolloff = 9999
vim.opt.scrolloff = 9999
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
vim.opt.showtabline = 1
vim.opt.signcolumn = "no"
-- vim.opt.list = true
vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = " " }) -- remove [~] character from nvim
vim.o.winborder = 'rounded'
vim.g.termguicolors = 1
---------KEYMAPS---------
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", ";", ":")
-- window navigation
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
-- delete current buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete %<CR>", {silent = true})
-- some helpful stuffs.
vim.keymap.set("n", "-", "$")
vim.keymap.set("v", "-", "$")
--- move stuff up or down and auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- keep cursor in the middle.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- yank to another register
vim.keymap.set("n", "P", '"+p')
vim.keymap.set("v", "P", '"+p')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("v", "Y", '"+y')
-- Split windows
vim.keymap.set("n", "<leader>wv", "<cmd>vs<CR>", {silent = true}) -- split horizontal
vim.keymap.set("n", "<leader>ws", "<cmd>sv<CR>", {silent = true}) -- split vertical
vim.keymap.set("n", "<leader>wd", "<cmd>q<CR>", {silent = true}) -- split vertical
-- go to normal mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- open terminal in split window
vim.keymap.set("n", "<leader>t", "<cmd>hor terminal<CR>", {silent = true })
-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +1<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>", { silent = true })
-- Turn off numbers or relative numbers in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- Working with scratch buffer.
local scratch_bufnr = nil
local scratch_winid = nil

vim.keymap.set("n", "<leader>bx", function()
    local current_buf = vim.api.nvim_get_current_buf()
    -- If we're already in the scratch buffer: close the window
    if scratch_bufnr and current_buf == scratch_bufnr then
        if scratch_winid and vim.api.nvim_win_is_valid(scratch_winid) then
            vim.api.nvim_win_close(scratch_winid, false)
        end
        scratch_winid = nil
        return
    end
    -- Create scratch buffer if it doesn't exist
    if not (scratch_bufnr and vim.api.nvim_buf_is_valid(scratch_bufnr)) then
        scratch_bufnr = vim.api.nvim_create_buf(false, true) -- listed = false, scratch = true
        vim.api.nvim_buf_set_name(scratch_bufnr, "[Scratch]")
        vim.bo[scratch_bufnr].buftype = "nofile"
        vim.bo[scratch_bufnr].bufhidden = "hide"
        vim.bo[scratch_bufnr].swapfile = false
    end
    -- Open in vertical split (or change to horizontal if you prefer)
    vim.cmd("vsplit")
    scratch_winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(scratch_winid, scratch_bufnr)
end, { desc = "Toggle scratch buffer" })
-- Highlight text for yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- For markdown
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

--====================================================
-- Compiling workflow.
_G.compile_cmd = ""
-- Command to set the compile command (e.g. :C)
vim.api.nvim_create_user_command("C", function()
    vim.ui.input({ prompt = "Enter compile command: " }, function(input)
        if input ~= nil and input ~= "" then
            _G.compile_cmd = input
            print("Set compile command to: " .. input)
        else
            print("No command entered.")
        end
    end)
end, {})
-- Function to run the compile command
function _G.run_compile_cmd()
    if _G.compile_cmd == "" then
        print("No compile command set. Use :C to set one.")
    else
        vim.cmd("hor terminal " .. _G.compile_cmd)
    end
end
-- Keybinding to run compile command
vim.keymap.set("n", "<leader>cc", _G.run_compile_cmd, { desc = "Run compile command" })
-- =======================================================

-- collaps all windows except the focused one.
vim.keymap.set("n", "<leader>wm", function()
    vim.cmd("mksession! ~/.config/nvim/split_session.vim")
    vim.cmd("only!")
end, { silent = true })
-- Restore previous windows
vim.keymap.set("n", "<leader>wu", function()
  vim.cmd("source ~/.config/nvim/split_session.vim")
end, { silent = true })

-- Enable the LSPs server
vim.lsp.enable({
    'lua-language-server',
    'ols',
    -- 'go',
    -- 'zls',
    --'yamlls'
})

-- save file write to a root owned file
vim.api.nvim_create_user_command("W", function()
  vim.cmd("SudaWrite")
end, {})
vim.diagnostic.config({ virtual_text = true })

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, { buffer = args.buf })
    end,
})
------STARTUP LAZY PLUGIN MANAGER-------------
require("config.lazy")
