-- Source: https://github.com/phaazon/hop.nvim
local packer = require 'packer'
local use = packer.use

-- Plugins
use {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function() require("hop").setup() end
}

-- Keybinding

-- Word
vim.keymap.set('n', '<leader>w', function() require'hop'.hint_words() end)
vim.keymap.set('v', '<leader>w', function() require'hop'.hint_words() end)

-- Line
vim.keymap.set('n', '<leader>l', function() require'hop'.hint_lines() end)
vim.keymap.set('v', '<leader>l', function() require'hop'.hint_lines() end)

-- Char
vim.keymap.set('n', '<leader>n', function() require('hop').hint_char1() end)
vim.keymap.set('n', '<leader>N', function() require('hop').hint_char2() end)
vim.keymap.set('n', 'f', function()
    require('hop').hint_char1({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        current_line_only = true
    })
end)
vim.keymap.set('n', 'F', function()
    require'hop'.hint_char1({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        current_line_only = true
    })
end)
vim.keymap.set('o', 'f', function()
    require'hop'.hint_char1({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        current_line_only = true,
        inclusive_jump = true
    })
end)
vim.keymap.set('o', 'F', function()
    require'hop'.hint_char1({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        current_line_only = true,
        inclusive_jump = true
    })
end)
vim.keymap.set('', 't', function()
    require'hop'.hint_char1({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        current_line_only = true
    })
end)
vim.keymap.set('', 'T', function()
    require'hop'.hint_char1({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        current_line_only = true
    })
end, {})

