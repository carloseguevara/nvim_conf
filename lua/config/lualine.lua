local packer = require 'packer'
local use = packer.use

-- Plugins
use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = "*",
    callback = function()

        if io.open(".git/") == nil then return end

        local behind_commits = assert(io.popen(
                                          'git rev-list --count $(git branch --show-current)..origin/$(git branch --show-current)',
                                          'r'), ''):read('*a'):sub(0, -2)
        local ahead_commits = assert(io.popen(
                                         'git rev-list --count origin/$(git branch --show-current)..$(git branch --show-current)',
                                         'r'), ''):read('*a'):sub(0, -2)
        if ahead_commits ~= '0' then
            vim.b.git_ahead_commits = '↑' .. ahead_commits
        end

        if behind_commits ~= '0' then
            vim.b.git_behind_commits = '↓' .. behind_commits
        end
        -- vim.b.git_status = git_status
    end,
    desc = "Tell me when I enter a buffer"
})

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '', right = '|'},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {'filename'},
        lualine_b = {
            'branch', {
                'b:git_ahead_commits',
                color = {fg = "#009A44"},
                padding = {left = 0, right = 0}
            }, {
                'b:git_behind_commits',
                color = {fg = "#BF616A"},
                padding = {left = 1, right = 0}
            }
        },
        lualine_c = {'diff'},
        lualine_x = {},
        lualine_y = {'progress', 'diagnostics'},
        lualine_z = {'filetype'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'diagnostics'},
        lualine_y = {},
        lualine_z = {}
    }
}

require('lualine').setup {}
