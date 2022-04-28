-- Explorer --
local packer = require 'packer'
local use = packer.use

-- Plugins
use {'ibhagwan/fzf-lua', requires = {'kyazdani42/nvim-web-devicons'}}

-- Configurations
require'fzf-lua'.setup {
    files = {
        previewer = "bat",
        -- fd_opts = "--hidden",
        rg_opts = "--color=never --files --hidden --follow -g '!.git'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git"
    },
    grep = {cmd = "rg --hidden"}
}

-- Keybinding
vim.keymap.set('n', '<leader>e', function() require('fzf-lua').files() end)
vim.keymap.set('n', '<leader>gb',
               function() require('fzf-lua').git_branches() end)
-- vim.keymap.set('n', '<c-e>', function() require('fzf-lua').buffers() end)

-- Files
-- vim.keymap.set('n', '<leader>F', function() require('fzf-lua').live_grep() end)
vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').blines() end)
vim.keymap
    .set('n', '<leader>fw', function() require('fzf-lua').grep_cword() end)
vim.keymap.set('n', '<leader>fl', function() require('fzf-lua').grep_last() end)
