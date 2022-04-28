vim.api.nvim_create_autocmd("BufEnter", {
    pattern = '*.lua',
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.expandtab = true
        vim.opt.smarttab = true
    end
})
