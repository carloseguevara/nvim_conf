vim.api.nvim_create_autocmd("FileType", {
    pattern = 'python',
    callback = function()
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
        vim.opt.expandtab = true
        vim.opt.smarttab = true
    end
})
