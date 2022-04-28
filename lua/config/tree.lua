-- Tree
local packer = require 'packer'
local use = packer.use

-- Plugins
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
        'kyazdani42/nvim-web-devicons' -- optional, for file icon
    }
}

use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
        'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons',
        'MunifTanjim/nui.nvim', 's1n7ax/nvim-window-picker'
    }
}
-- Configurations

require('window-picker').setup({
    autoselect_one = true,
    include_current = false,
    selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
    filter_rules = {
        bo = {
            filetype = {'neo-tree', "neo-tree-popup", "notify", "quickfix"},
            buftype = {'terminal'}
        }
    },
    other_win_hl_color = '#e35e4f'
})

require('neo-tree').setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    window = {
        position = "right",
        width = 50,
        mappings = {["<cr>"] = "open_with_window_picker"}
    },
    filesystem = {
        filtered_items = {hide_dotfiles = false},
        follow_current_file = true
    }
})

require('nvim-tree').setup({ -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    -- hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 40,
        height = 30,
        side = "right",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            }
        }
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {corner = "└ ", edge = "│ ", none = "  "}
        },
        icons = {webdev_colors = true}
    },
    hijack_directories = {enable = true, auto_open = true},
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    ignore_ft_on_setup = {},
    system_open = {cmd = nil, args = {}},
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    filters = {dotfiles = false, custom = {}, exclude = {}},
    git = {enable = true, ignore = true, timeout = 400},
    actions = {
        use_system_clipboard = true,
        change_dir = {enable = true, global = false},
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {
                        "notify", "packer", "qf", "diff", "fugitive",
                        "fugitiveblame"
                    },
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        }
    },
    trash = {cmd = "trash", require_confirm = true},
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false
        }
    }
}) -- END_DEFAULT_OPTS

-- Keybinding
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeFindFileToggle<CR>',
                        {noremap = true})
--
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neotree toggle git_status<CR>', {})
-- vim.api.nvim_set_keymap('n', '<leader>b', ':Neotree toggle filesystem<CR>', {})
