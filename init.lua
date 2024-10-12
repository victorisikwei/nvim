vim.opt.scrolloff = 13
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.swapfile = false
-- vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.splitright = true
vim.opt.whichwrap = "bs<>[]hl"
vim.opt.splitbelow = true
vim.opt.smartindent = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 100
-- don't split word in word wrap
vim.opt.linebreak = true 
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.guifont = "FiraCode Nerd Font:h11"

--
--
-- KEYMAPS
--
--

vim.keymap.set("i", "jk", "<Esc>") -- easy escape
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "Y", "Vy")
vim.keymap.set("n", "<ESC>", "<cmd>silent noh<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>silent w<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>silent only!<CR>")
vim.keymap.set("n", "<leader>=", "<cmd>silent SudaWrite<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>")
-- change to current working directory
vim.keymap.set("n", "<leader>5", "<cmd>silent cd %:h<CR>")
-- Easy window movement
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
-- Better vertical movement
vim.keymap.set("n", "<S-j>", "}")
vim.keymap.set("n", "<S-k>", "{")
vim.keymap.set("v", "<S-j>", "}")
vim.keymap.set("v", "<S-k>", "{")
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

-- Move text up and down
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Lexplore right
vim.keymap.set("n", "<leader>e", "<cmd>silent Sexplore<CR>")
vim.cmd([[ autocmd BufLeave * if &filetype == 'netrw' | bd | endif ]])
-- vim.cmd([[nnoremap <buffer> <CR> :Lexplore!<CR> ]])
-- Find file
vim.keymap.set("n", "<leader>f", ":FZF ~/")
vim.keymap.set("n", "?", ":Rg<CR>")
-- Buffers
vim.keymap.set("n", "<leader><Tab>", ":Buffers<CR>")
-- Hide buffer unless it's the last window on the screen 
vim.keymap.set("n", "<leader>h", ":silent hide<CR>")

-- Terminals
vim.keymap.set("n", "<C-t>", "<cmd>silent terminal<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:bdelete!<CR>")

-- Super search
vim.keymap.set("n", "<C-s>", ":%s/")

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


-- Neovim builtin auto-completion
vim.cmd([[
	inoremap <expr><Tab> CheckBackspace() ? "\<Tab>" : "\<C-n>"
	function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
]])

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Start teminal mode in insert
vim.cmd([[
  augroup insertonenter
		function! InsertOnTerminal()
			if &buftype ==# "terminal"
				normal i
			endif
		endfunction

		autocmd! BufEnter * call InsertOnTerminal()
		if has('nvim')
			autocmd! TermOpen * call InsertOnTerminal()
		endif
	augroup END
]])


--  Neovide stuff
if vim.g.neovide == true then
  -- vim.o.guifont = "FiraCode Nerd Font:h8"
	 -- vim.o.guifont = "Source Code Pro:h11" -- text below applies for VimScript
  vim.opt.linespace = 10
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
end



-- PLUGIN MANAGER
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		{
			"rebelot/kanagawa.nvim",
			opts = {},
			config = function()
			end
		},
		{
			"ollykel/v-vim",
			opts = {},
			config = function()
			end
		},
		{
			"lambdalisue/suda.vim",
			opts = {},
			config = function() 
			end
		},
		{
			"junegunn/fzf",
  		dependencies = { "junegunn/fzf.vim" },
			opts = {},
			config = function() 
			end
		},
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			opts = {},
			-- stylua: ignore
			keys = {
				{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
				{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
				{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
				{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
				{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
			},
		},
		-- colorscheme that will be used when installing plugins.
		install = { colorscheme = { "habamax" } },
		-- automatically check for plugin updates
		checker = { enabled = false },
	}
})

-- SET COLORSCHEME
vim.cmd("colorscheme kanagawa")
vim.cmd([[
	highlight Normal ctermbg=0 guibg=#000000
]])
