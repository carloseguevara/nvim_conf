-- Source: https://github.com/sbdchd/neoformat
local packer = require 'packer'
local use = packer.use

-- Plugins
use 'sbdchd/neoformat'

-- Configurations
_G.neoformat_enabled_python = [[ black ]]
vim.api.nvim_exec([[
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]], false)
