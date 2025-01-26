-- Explorer --
local packer = require 'packer'
local use = packer.use

-- Plugins
use { 'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-live-grep-raw.nvim' } } }
-- use {
--   "ahmedkhalf/project.nvim",
--   requires = {"neovim/nvim-lspconfig"},
--   config = function()
--     require("project_nvim").setup({
--       manual_mode = true,
--       detection_methods = { "lsp", "pattern" },
--       silent_chdir = false,
--       show_hidden = false,
--     })
--   end
-- }

-- Configurations
require('telescope').setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            -- promt_position = "top",
            preview_cutoff = 8, preview_width = 0.6, height = 0.99, width = 0.99
        }
    }
})
-- Keybinding
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>F", builtin.live_grep, {})
vim.keymap.set("n", "<leader>e", builtin.buffers, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- Git
-- vim.api.nvim_set_keymap("n", "<leader>tgs", ":Telescope git_status<CR>",
--                         {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>tgb", ":Telescope git_branches<CR>",
--                         {noremap = true})
