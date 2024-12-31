return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local fzf = require 'fzf-lua'
    harpoon:setup()

    -- Function to toggle FZF-Lua with Harpoon files
    local function toggle_fzf_with_harpoon(harpoon_files, window_title)
      -- Prepare the list of file paths for FZF
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      -- Use FZF-Lua to display the Harpoon files
      fzf.fzf_exec(file_paths, {
        previewer = 'builtin', -- Use FZF-Lua's built-in file previewer
        winopts = {
          title = window_title,
          title_pos = 'center',
          cursorline = true,
        },
        actions = {
          ['default'] = function(selected)
            if #selected > 0 then
              vim.cmd('edit ' .. selected[1])
            end
          end,
        },
      })
    end

    vim.keymap.set('n', '<leader>hl', function()
      toggle_fzf_with_harpoon(harpoon:list(), 'Harpoon List')
    end, { desc = '[H]arpoon [L]ist' })

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd' })

    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon Buffer [1]' })

    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon Buffer [2]' })

    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon Buffer [3]' })

    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon Buffer [4]' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon [P]revious' })

    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon [N]ext' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
