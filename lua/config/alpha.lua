-- Source: https://github.com/goolord/alpha-nvim
local packer = require 'packer'
local use = packer.use
local banner = {
    "                                     __",
    "      ██████  ██████                / _)",
    "     ██      ██            _.----._/ / ",
    "     ██      ██   ███     /         / ",
    "     ██      ██    ██  __/ (  | (  | ",
    "      ██████  ██████  /__.-'|_|--|_| ", "",
    "<<It is not motivation, it is discipline>>"
}
-- Plugins
use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

-- Configurations
local alpha = require('alpha')

local startify = require 'alpha.themes.startify'
local star_sections = startify.section
local dashboard = require('alpha.themes.dashboard').section

local config = startify.config

star_sections.header.val = banner
star_sections.header.opts = dashboard.header.opts

config.layout = {
    { type = 'padding', val = 2 }, star_sections.header,
    { type = 'padding', val = 2 }, star_sections.top_buttons,
    { type = 'padding', val = 2 }, star_sections.mru_cwd,
    { type = 'padding', val = 2 }, star_sections.bottom_buttons
}

alpha.setup(startify.config)

