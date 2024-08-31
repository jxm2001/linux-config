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
vim.keymap.set({'x', 'o', 'n'}, 'e', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'E', '<Plug>(leap-backward-to)')
