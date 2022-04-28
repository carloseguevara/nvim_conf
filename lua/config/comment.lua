-- Comments --
local packer = require 'packer'
local use = packer.use

-- Plugins
use "terrortylor/nvim-comment"

-- Configurations
require('nvim_comment').setup({
  marker_padding = true,          -- space in between markers
  comment_empty = false,
  line_mapping = "gcc",
  operator_mapping = "gc",
})
