-- OSC 52 clipboard config
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

require("config.lazy")

-- leap config
vim.keymap.set({'n', 'x', 'o'}, 'e',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'E',  '<Plug>(leap-backward)')

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>pm', builtin.oldfiles, { desc = 'Telescope mru' })
vim.keymap.set('n', '<leader>pt', builtin.tags, { desc = 'Telescope tags' })
vim.keymap.set('n', '<leader>pf', builtin.filetypes, { desc = 'Telescope filetypes' })

-- nvim_treesitter config
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
