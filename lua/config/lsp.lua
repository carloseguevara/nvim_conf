-- LSP related --
local packer = require 'packer'
local use = packer.use

-- Plugins
use 'folke/lua-dev.nvim'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
use 'hrsh7th/cmp-nvim-lsp-signature-help' -- functions
use 'hrsh7th/cmp-path'
use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
use 'hrsh7th/vim-vsnip' -- Source: https://github.com/hrsh7th/vim-vsnip
use 'hrsh7th/vim-vsnip-integ'
use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

-- Installation
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
-- use {
--   "williamboman/nvim-lsp-installer",
--   requires = {
--     "neovim/nvim-lspconfig",
--     "hrsh7th/nvim-cmp"
--   },
--   config = function()
--     local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
--     -- local on_attach = require "config.on_attach"
--     require("nvim-lsp-installer").on_server_ready(
--       function(server)
--         local config = {
--           -- on_attach = on_attach[server.name],
--           cmd = {"/Users/carlos/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
--           capabilities = capabilities,
--           autostart = true,
--           settings = {
--             Lua = {
--               diagnostics = {globals = {"vim"}}
--             }
--           }
--         }
--         server:setup(config)
--       end
--     )
--   end
-- }

-- Configurations

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm i -g pyright
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            -- require('luasnip').lsp_expand(args.body)
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-b>'] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = {
        {name = 'buffer'}, {name = 'path'}, {name = 'nvim_lsp'},
        {name = "nvim_lsp_signature_help"}, {name = 'luasnip'}
    }
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<c-Space>',
                        '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<space>q',
                        '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'pyright', 'tsserver'}
local lspconfig = require('lspconfig')
for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150
        }
    }
end

local luadev = require("lua-dev").setup({
    lspconfig = {
        on_attach = on_attach,
        cmd = {
            "/Users/carlos/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
        }
    }
})
lspconfig.sumneko_lua.setup(luadev)

