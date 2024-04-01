-- SECTION: nvimBufferline
require('nvim-web-devicons')
require('bufferline').setup {
    highlights = {
        background = { -- Registerkarten im Hintergrund
            fg = '#aaaaaa',
            bg = '#2b2739',
            --bg = '#1a1628'
        },
        tab = {
            fg = '#ffffff',
            bg = '#ff00ff'
        },
        tab_separator_selected = {
            fg = '#ff0000',
            bg = '#00ff00',
            sp = '#0000ff',
        },
        buffer_visible = { -- offene Registerkarte ohne Fokus
            fg = '#ffffff',
            bg = '#3c384a'
        },
        buffer_selected = { -- offene Registerkarte mit Fokus
            fg = '#ffffff',
            bg = '#662266',
            italic = false,
        },
        separator_selected = {
            fg = '#1a1628',
            bg = '#662266',
        },
        separator_visible = {
            fg = '#1a1628',
            bg = '#3c384a'
        },
        separator = {
            fg = '#1a1628',
            bg = '#2b2739',
        },
    },
    options = {
        close_command = function(bufnum)
            require('bufdelete').bufdelete(bufnum, false)
        end
        ,
        right_mouse_command = 'vertical sbuffer %d',
        indicator = {
            indicator_icon = '▎',
            style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        separator_style = 'slant',
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        offsets = { { filetype = 'NvimTree', text = 'Verzeichnisbaum', text_align = 'left' } },
        --sort_by = 'extension',
        diagnostics = 'coc',
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ''
            for e, n in pairs(diagnostics_dict) do
                local sym = e == 'error' and ''
                    or (e == 'warning' and '' or '')
                if (sym ~= '') then
                    s = s .. ' ' .. n .. sym
                end
            end
            return s
        end,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
    }
}
vim.keymap.set('n', '<space>b1', '<Cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<space>b2', '<Cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<space>b3', '<Cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<space>b4', '<Cmd>BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<space>b5', '<Cmd>BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<space>b6', '<Cmd>BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '<space>b7', '<Cmd>BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '<space>b8', '<Cmd>BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', '<space>b9', '<Cmd>BufferLineGoToBuffer 9<CR>')
vim.keymap.set('n', '<space>bc', ':BufferLinePick<CR>')
vim.keymap.set('n', '<space>bmn', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', '<space>bmp', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', '<space>bn', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<space>bp', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<space>bsd', ':BufferLineSortByDirectory<CR>')
vim.keymap.set('n', '<space>bse', ':BufferLineSortByExtension<CR>')
