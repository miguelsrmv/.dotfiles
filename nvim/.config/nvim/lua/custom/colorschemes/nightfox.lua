return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  opts = { transparent = true },
  init = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'nightfox'
    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
