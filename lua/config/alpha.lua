-- Source: https://github.com/goolord/alpha-nvim
local packer = require 'packer'
local use = packer.use

-- Plugins
use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
}

-- Configurations
require'alpha'.setup(require'alpha.themes.startify'.config)
