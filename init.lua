-- Default Options --
-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
vim.opt.mouse = 'a' -- allow the mouse to be used in neovim

-- UI
-- vim.opt.showtabline = 2
vim.o.ls = 0 -- last status
-- vim.o.ch = 0 -- command height
-- vim.o.winbar = "%f"
vim.opt.cursorline = true -- highlight the current line
vim.opt.showmode = false
vim.opt.wrap = true -- display lines as one long line

-- Tab behavior
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- convert tabs to spaces

vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case

vim.g.mapleader = ' '
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.guifont = "monospace:h17"
vim.keymap.set('n', '<leader>fa', function()
    local api = vim.api
    local current_window = api.nvim_get_current_win()
    api.nvim_win_set_option(current_window, 'foldenable', true)
end)

require('plugins')

