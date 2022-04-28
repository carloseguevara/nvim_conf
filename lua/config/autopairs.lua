-- Source: https://github.com/windwp/nvim-autopairs
local packer = require 'packer'
local use = packer.use

-- Plugins
use 'windwp/nvim-autopairs'

-- Configurations
require("nvim-autopairs").setup({
  disable_filetype = { 'TelescopePrompt' , 'vim' },
  fast_wrap = {
    map = '<C-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})
