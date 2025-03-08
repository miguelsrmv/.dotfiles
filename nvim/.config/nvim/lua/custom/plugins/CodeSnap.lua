return {
  'mistricky/codesnap.nvim',
  build = 'make build_generator',
  keys = {
    { '<leader>cc', '<Esc><cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
    { '<leader>cs', '<Esc><cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures/CodeSnap' },
  },
  opts = {
    save_path = '~/Pictures/CodeSnap',
    has_breadcrumbs = true,
    bg_theme = 'bamboo',
  },
}

-- vim: ts=2 sts=2 sw=2 et
