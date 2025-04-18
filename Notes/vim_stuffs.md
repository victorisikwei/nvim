## How to toggle Explore
[[solution link]](https://vi.stackexchange.com/questions/10988/toggle-explorer-window)
```lua
vim.keymap.set('n', '<leader>e', function()
    if vim.bo.filetype == 'netrw' then
        vim.cmd 'bwipeout'
    else
        vim.cmd 'Explore'
    end
end, { silent = true })
```
