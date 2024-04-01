-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = require "nvim-tree.api"
vim.keymap.set('n', '<space><tab>', api.tree.toggle, {})
vim.keymap.set('n', '<space>t', api.tree.toggle, {})

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            --git_placement = "signcolumn",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    view = {
        width = 48,
    },
    actions = {
        change_dir = {
            enable = false,
            restrict_above_cwd = true,
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
})
