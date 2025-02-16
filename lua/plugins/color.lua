return {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    opts = {
    },
    config = function()
        require("catppuccin").setup({
            vim.cmd.colorscheme "catppuccin-mocha"
        })
        vim.cmd([[
        " highlight Normal ctermbg=NONE guibg=NONE
        " highlight Normal ctermbg=0 guibg=#000000
        " highlight SignColumn ctermbg=0 guibg=#000000
        " highlight LineNr ctermbg=0 guibg=#000000
        " highlight NormalFloat ctermbg=0 guibg=#000000
        " highlight FloatBorder ctermbg=0 guibg=#000000
        " highlight FloatFooter ctermbg=0 guibg=#000000
        ]])
    end
}
