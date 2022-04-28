local packer = require("packer")
packer.init()
packer.reset()
local use = packer.use

use 'folke/which-key.nvim'
require('which-key').setup({})

RequireFolder = require('helpers/require_folder')
RequireFolder.set("config")

use 'wbthomason/packer.nvim'
use 'tpope/vim-surround'
use 'tpope/vim-repeat' -- https://github.com/tpope/vim-repeat
use 'wellle/targets.vim' -- https://github.com/wellle/targets.vim
use 'tpope/vim-unimpaired' -- https://github.com/tpope/vim-unimpaired
use 'Yggdroot/indentLine' -- https://github.com/Yggdroot/indentLine
-- use 'FooSoft/vim-argwrap' -- Toggle arguments

-- use {'chrisbra/csv.vim', ft = {'csv'}}
