-- Treesitter --
local packer = require 'packer'
local use = packer.use
-- Plugins
use "nvim-treesitter/nvim-treesitter"
-- use "nvim-treesitter/nvim-treesitter-context"
-- use "eddiebergman/nvim-treesitter-pyfold"
-- Configurations
require("nvim-treesitter.configs").setup({
    indent = {enable = true},
    ensure_installed = {
        "bash", "comment", "json", "lua", "python", "scala", "yaml"
    },
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gs",
            node_incremental = "gsi",
            scope_incremental = "gsI",
            node_decremental = "gsd"
        }
    }
    -- pyfold = {
    --   enable = true,
    --   custom_foldtext = true -- Sets provided foldtext on window where module is active
    -- }
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
