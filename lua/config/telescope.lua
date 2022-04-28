-- Explorer --
local packer = require 'packer'
local use = packer.use

-- Plugins
use {
    'nvim-telescope/telescope.nvim',
    requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-live-grep-raw.nvim'}
    }
}
-- use {
--     "nvim-telescope/telescope-file-browser.nvim",
--     requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'}
-- }
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
            preview_cutoff = 8,
            preview_width = 0.6,
            height = 0.99,
            width = 0.99
        }
    }
})
-- require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("projects")
-- Keybinding
-- vim.api.nvim_set_keymap("n", "<leader>E", ":Telescope file_browser<CR>",
--                         {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>e", ":Telescope find_files<CR>",
--                         {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>F", ":Telescope live_grep<CR>",
                        {noremap = true})
vim.api
    .nvim_set_keymap("n", "<c-e>", ":Telescope buffers<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<c-f>",
--                         ":Telescope current_buffer_fuzzy_find<CR>",
--                         {noremap = true})
-- vim.api.nvim_set_keymap("n", "<c-r>", ":Telescope projects<CR>", { noremap = true })
-- Git
-- vim.api.nvim_set_keymap("n", "<leader>tgs", ":Telescope git_status<CR>",
--                         {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>tgb", ":Telescope git_branches<CR>",
--                         {noremap = true})
