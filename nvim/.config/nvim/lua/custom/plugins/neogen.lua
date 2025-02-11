return {
  'danymat/neogen',
  config = true,
  version = '*',
  vim.api.nvim_set_keymap('n', '<Leader>c', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true, desc = 'Generate comment (Neogen)' }),
  event = 'VeryLazy',
}

-- vim: ts=2 sts=2 sw=2 et
