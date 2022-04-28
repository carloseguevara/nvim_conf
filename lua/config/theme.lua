-- Theme --
local packer = require 'packer'
local use = packer.use

-- Plugins
use "EdenEast/nightfox.nvim" -- https://github.com/EdenEast/nightfox.nvim
use 'folke/tokyonight.nvim' -- https://github.com/folke/tokyonight.nvim

-- Configurations
require("nightfox").setup({
    options = {
        styles = {comments = "italic", keywords = "bold", types = "italic,bold"}
    }
})

-- local current_time = os.date("*t")
-- local current_hour = current_time.hour
-- if current_hour > 6 and current_hour < 19 then
--     vim.o.background = "light"
--     vim.g.tokyonight_style = "day"
--     vim.g.tokyonight_colors = {hint = 'black'}
--     vim.cmd("colorscheme tokyonight")
-- else
--     vim.cmd("colorscheme nightfox")
-- end

local command = 'defaults read -g AppleInterfaceStyle'
local handle = io.popen(command)
local result = handle:read("*a")
handle:close()

if result:sub(1, -2) == "Dark" then
    vim.cmd("colorscheme nightfox")
else
    vim.cmd("colorscheme dayfox")
end
