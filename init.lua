vim.opt.scrolloff = 13
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.opt.breakindent = true
-- vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.splitright = true
vim.opt.whichwrap = "bs<>[]hl"
vim.opt.splitbelow = true
vim.opt.smartindent = true
vim.opt.updatetime = 100

vim.opt.autochdir = true
-- OR
--[[
vim.cmd(autocmd BufEnter * lcd %:p:h)
]]

vim.opt.timeoutlen = 100
-- don't split word in word wrap
vim.opt.linebreak = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.o.guifont = "FiraCode Nerd Font:h11"
vim.o.guifont = "0xProto Nerd Font:h10"
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

vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
-- terms
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- Better vertical movement
vim.keymap.set("n", "<S-j>", "}zz")
vim.keymap.set("n", "<S-k>", "{zz")

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

-- for pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Move text up and down
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Lexplore right
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
-- vim.cmd([[ autocmd BufLeave * if &filetype == 'netrw' | bd | endif ]])
-- vim.cmd([[nnoremap <buffer> <CR> :Lexplore!<CR> ]])
-- Find file
vim.keymap.set("n", "<C-p>", ":FZF<CR>")
vim.keymap.set("n", "<C-f>", ":lcd ~ | FZF<CR>")

vim.keymap.set("n", "?", ":Rg<CR>")
-- Buffers
vim.keymap.set("n", "<leader><Tab>", ":Buffers<CR>")
-- Hide buffer unless it's the last window on the screen 
vim.keymap.set("n", "<leader>h", ":silent hide<CR>")

-- Terminals
vim.keymap.set("n", "<C-t>", "<cmd>silent terminal<CR>")
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>q", ":silent q<CR>")

-- Super search
vim.keymap.set("n", "<C-s>", ":%s/")

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


-- Neovim builtin auto-completion
--[[
  vim.cmd(
  [[
  inoremap <expr><Tab> CheckBackspace() ? "\<Tab>" : "\<C-n>"
  function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  ]]
  --)

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
      vim.opt.linespace = 1
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
      vim.api.nvim_set_keymap("n", "<Home>", "<Nop>", { silent = true })
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
        {"Tetralux/odin.vim"},
        {
          'huy-hng/anyline.nvim',
          dependencies = { 'nvim-treesitter/nvim-treesitter' },
          event = 'VeryLazy',
          opts = {},
          config = function ()
          end
        },
        {
          { -- Add indentation guides even on blank lines
            'lukas-reineke/indent-blankline.nvim',
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help ibl`
            main = 'ibl',
            opts = {},
          },
        },
        {
          "rebelot/kanagawa.nvim",
          opts = {},
          config = function()
          end
        },
        {
          'stevearc/oil.nvim',
          ---@module 'oil'
          ---@type oil.SetupOpts
          -- Optional dependencies
          dependencies = { { "echasnovski/mini.icons", opts = {} } },
          -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
          opts = {
            columns = {
              "icon",
              "permissions",
              "size",
              -- "mtime",
            },
          },
          config = function ()
            require("oil").setup({

              keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                -- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
                ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                ["<C-p>"] = "actions.preview",
                [" d"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
              },
            })
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
        {
          "nvim-treesitter/nvim-treesitter",
          opts = {},
          config = function()
            require'nvim-treesitter.configs'.setup {
              -- A list of parser names, or "all" (the listed parsers MUST always be installed)
              ensure_installed = { "c", "lua", "nim", "markdown", "markdown_inline" },

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,

              -- Automatically install missing parsers when entering buffer
              -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
              auto_install = true,

              -- List of parsers to ignore installing (or "all")
              ignore_install = { "javascript" },

              ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
              -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

              highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                disable = { "c", "rust" },
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                  local max_filesize = 100 * 1024 -- 100 KB
                  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                  if ok and stats and stats.size > max_filesize then
                    return true
                  end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
              },
            }
          end
        },
        {
          {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
          {'neovim/nvim-lspconfig'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/nvim-cmp'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
        },
        {
          {"prabirshrestha/asyncomplete.vim"},
          {"prabirshrestha/async.vim"},
          {"prabirshrestha/vim-lsp"},
          {"prabirshrestha/asyncomplete-lsp.vim"},
        },

        -- colorscheme that will be used when installing plugins.
        install = { colorscheme = { "habamax" } },
        -- automatically check for plugin updates
        checker = { enabled = false },
      }

    }) -- Enc of Lazy prlgin in manager

    -- SET COLORSCHEME
    vim.cmd("colorscheme kanagawa")
    vim.cmd([[
    highlight Normal ctermbg=0 guibg=#000000
    highlight SignColumn ctermbg=0 guibg=#0E0E0E
    ]])

    -- LSP

    vim.opt.signcolumn = 'yes'

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
    )

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'H', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', '<leader>w', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end,
    })

    --[[
    vim.api.nvim_create_autocmd("CursorHold", {
      pattern = "*",
      callback = function()
        vim.lsp.buf.signature_help()
      end
    })
    ]]

    vim.cmd(
    [[
    let s:nimlspexecutable = "nimlsp"
    let g:lsp_log_verbose = 1
    let g:lsp_log_file = expand('/tmp/vim-lsp.log')
    " for asyncomplete.vim log
    let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')

    let g:asyncomplete_auto_popup = 0

    if has('win32')
      let s:nimlspexecutable = "nimlsp.cmd"
      " Windows has no /tmp directory, but has $TEMP environment variable
      let g:lsp_log_file = expand('$TEMP/vim-lsp.log')
      let g:asyncomplete_log_file = expand('$TEMP/asyncomplete.log')
      endif
      if executable(s:nimlspexecutable)
        au User lsp_setup call lsp#register_server({
          \ 'name': 'nimlsp',
          \ 'cmd': {server_info->[s:nimlspexecutable]},
          \ 'whitelist': ['nim'],
          \ })
          endif

          function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~ '\s'
          endfunction

          inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ asyncomplete#force_refresh()
          inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
          ]]
          )

    --Mason
    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      },
    })
    require'lspconfig'.nim_langserver.setup{
      settings = {
        nim = {
          nimsuggestPath = "~/.nimble/bin/custom_lang_server_build"
        }
      }
    }

    require('cmp_nvim_lsp').setup {
      signature_help = true,
    }

    -- Autocomplition
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      mapping = cmp.mapping.preset.insert({
        -- Navigate between completion items
        ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),

        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    })
