-- SECTION: nvimBufferline
require('nvim-web-devicons')
require('bufferline').setup {
    -- TODO: Richtige Farben setzen und auf highlights ohne 2 setzen
    highlights2 = {
        fill = {
            fg = '#ff00ff',
            bg = '#ff00ff'
        },
        background = {
            fg = '#ff00ff',
            bg = '#ff00ff'
        },
        tab = {
            fg = '#ff00ff',
            bg = '#ff00ff'
        },
        tab_selected = {
            fg = '#00ffff',
            bg = '#ffff00',
        },
        tab_separator = {
            fg = '#ffff00',
            bg = '#00ffff',
        },
        tab_separator_selected = {
            fg = '#ff0000',
            bg = '#00ff00',
            sp = '#0000ff',
            --underline = '<colour-value-here>',
        },
        buffer_visible = {
            fg = '#ff0000',
            bg = '#ff0000',
        },
        buffer_selected = {
            fg = '#ff0000',
            bg = '#ff0000',
            italic = false,
        },
        separator_selected = {
            fg = '#ff0000',
            bg = '#000000',
        },
        separator_visible = {
            fg = '#ff0000',
            bg = '#000000',
        },
        separator = {
            fg = '#ff0000',
            bg = '#000000',
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
        --separator_style = 'slant',
        separator_style = 'thin',
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
vim.keymap.set('n', '<leader>b1', '<Cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<leader>b2', '<Cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<leader>b3', '<Cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<leader>b4', '<Cmd>BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<leader>b5', '<Cmd>BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<leader>b6', '<Cmd>BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '<leader>b7', '<Cmd>BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '<leader>b8', '<Cmd>BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', '<leader>b9', '<Cmd>BufferLineGoToBuffer 9<CR>')
vim.keymap.set('n', '<leader>bc', ':BufferLinePick<CR>')
vim.keymap.set('n', '<leader>bmn', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', '<leader>bmp', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>bsd', ':BufferLineSortByDirectory<CR>')
vim.keymap.set('n', '<leader>bse', ':BufferLineSortByExtension<CR>')
