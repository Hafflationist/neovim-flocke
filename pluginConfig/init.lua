-- SECTION: basic
vim.o.encoding = 'utf-8'
vim.o.mouse = 'a'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.cmdheight = 1
vim.o.updatetime = 300
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.tm = 1000
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = 'yes:2'
vim.o.ai = true
vim.o.visualbell = false
vim.o.errorbells = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
-- vim.o.guifont = 'OverpassMono Nerd Font:h10'
vim.o.t_Co = 256

-- map leader to <Space>
vim.keymap.set('n', ' ', '<Nop>', { silent = true, remap = false })
vim.g.mapleader = ' '


-- SECTION: autopairs
require('nvim-autopairs').setup()

require('suda-vim').setup()

-- SECTION: indent blankline
require('indent_blankline').setup {
    char = '│',
    show_current_context = true,
    show_end_of_line = true,
}


-- vim.g.cursorline_timeout = 0
