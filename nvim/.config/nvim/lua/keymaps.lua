-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[Custom Commands]]
-- Keybinds to make navigating between buffers and tabs easier
vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true }) -- Next buffer
vim.keymap.set('n', '[b', ':bprevious<CR>', { silent = true }) -- Previous buffer
vim.keymap.set('n', ']B', ':blast<CR>', { silent = true }) -- Last buffer
vim.keymap.set('n', '[B', ':bfirst<CR>', { silent = true }) -- First buffer

vim.keymap.set('n', ']t', ':tabnext<CR>', { silent = true }) -- Next tab
vim.keymap.set('n', '[t', ':tabprevious<CR>', { silent = true }) -- Previous tab
vim.keymap.set('n', ']T', ':tablast<CR>', { silent = true }) -- Last tab
vim.keymap.set('n', '[T', ':tabfirst<CR>', { silent = true }) -- First tab

-- Direct tab access with :T{number}
vim.cmd 'command! -nargs=1 T tabnext <args>'
vim.cmd 'command! -nargs=1 B buffernext <args>'

-- Center automatically after moving or searching
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Split windows horizontally or vertically
vim.keymap.set('n', '<leader>wh', ':split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'Split window vertically' })

-- Resize windows with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
