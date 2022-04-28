-- Source: https://github.com/akinsho/toggleterm.nvim
local packer = require 'packer'
local use = packer.use

-- Plugins
use 'akinsho/toggleterm.nvim'

-- Configurations
require('toggleterm').setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    direction = "horizontal",
    open_mapping = [[<c-\>]],
    close_on_exit = false
})

vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>',
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('n', '<leader>th',
                        ':ToggleTerm direction=horizontal<CR>',
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('n', '<leader>tl', ':ToggleTermSendCurrentLine<CR>',
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('v', '<leader>tl', ':ToggleTermSendVisualLines<CR>',
                        {noremap = true, silent = true, expr = false})

