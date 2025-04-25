return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000, -- Ensures it's loaded first
    opts = { transparent = true },
    config = function()
      vim.cmd.colorscheme 'nightfox' -- Set active colorscheme
      vim.cmd.hi 'Comment gui=none' -- Custom highlights
    end,
  },
  { 'Mofiqul/dracula.nvim', event = 'VeryLazy' },
  { 'folke/tokyonight.nvim', event = 'VeryLazy' },
  { 'ellisonleao/gruvbox.nvim', event = 'VeryLazy' }, -- Lazy-load
  { 'olimorris/onedarkpro.nvim', event = 'VeryLazy' }, -- Lazy-load
  { 'rebelot/kanagawa.nvim', event = 'VeryLazy' }, -- Lazy-load
  { 'catppuccin/nvim', name = 'catppuccin', event = 'VeryLazy' }, -- Lazy-load
  { 'gbprod/nord.nvim', event = 'VeryLazy' }, -- Lazy-load
  {
    'neanias/everforest-nvim',
    event = 'VeryLazy',
  },
}
