local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<tab>', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<space>fr', builtin.registers, {})
vim.keymap.set('n', '<space>p', builtin.registers, {})
vim.keymap.set('n', '<space>fs', builtin.spell_suggest, {})
