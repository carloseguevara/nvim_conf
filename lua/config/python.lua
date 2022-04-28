local packer = require 'packer'
local use = packer.use

-- Plugins
use 'heavenshell/vim-pydocstring' -- https://github.com/heavenshell/vim-pydocstring

-- Configurations
vim.g.pydocstring_doq_path = '/opt/homebrew/bin/doq'
vim.g.pydocstring_formatter = 'google'
