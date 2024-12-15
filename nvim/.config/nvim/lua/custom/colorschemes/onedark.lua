return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  init = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'onedark'
    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}

-- vim: ts=2 sts=2 sw=2 et
