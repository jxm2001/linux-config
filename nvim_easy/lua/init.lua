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
