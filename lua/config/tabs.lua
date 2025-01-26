local packer = require 'packer'
local use = packer.use

use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
} -- Source: https://github.com/akinsho/bufferline.nvim

require('bufferline').setup {
    options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false
    }
}
vim.keymap.set('n', '<leader>tp', ':BufferLinePick<CR>')
vim.keymap.set('n', '<leader>tc', ':BufferLinePickClose<CR>')
