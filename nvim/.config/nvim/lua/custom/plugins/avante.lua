return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = 'copilot',
    --   openai = {
    --     endpoint = "https://api.openai.com/v1",
    --     model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    --     timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    --     temperature = 0,
    --     max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    --     --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    --   },
  },
  config = function()
    vim.keymap.set('n', '<leader>ac', function()
      vim.cmd ':Git add .'
      vim.cmd ':Git commit --verbose'
      vim.cmd ":AvanteAsk 'Generate a concise commit message following Conventional Commits format (type(scope): description). Analyze the changes to identify the primary purpose (feat, fix, docs, style, refactor, perf, test, chore). Include relevant ticket numbers if pattern [ABC-123] is found in branch name. Keep the first line under 72 characters.'"
    end, { desc = 'avante: generate commit message' })

    vim.keymap.set('n', '<leader>ad', function()
      vim.cmd ":AvanteAsk 'Add comprehensive Doxygen documentation to this file. Include: @brief descriptions, @param details with types and purpose, @return values, @throws exceptions, @note for important considerations, and @example where helpful. Maintain existing documentation style if present. Focus on public APIs first.'"
    end, { desc = 'avante: generate complete documentation' })

    vim.keymap.set({ 'v', 'x' }, '<leader>ad', function()
      vim.cmd ":AvanteAsk 'Add comprehensive Doxygen documentation to this code. Include: @brief descriptions, @param details with types and purpose, @return values, @throws exceptions, @note for important considerations, and @example where helpful. Maintain existing documentation style if present. Focus on public APIs first.'"
    end, { desc = 'avante: generate complete documentation' })

    vim.keymap.set({ 'v', 'x' }, '<leader>ao', function()
      vim.cmd ":AvanteAsk 'Optimize this code for: 1) Performance - reduce time/space complexity, 2) Readability - improve naming and structure, 3) Maintainability - reduce duplications and follow best practices. Explain key optimizations and preserve original functionality.'"
    end, { desc = 'avante: optimize selected code' })

    vim.keymap.set({ 'v', 'x' }, '<leader>at', function()
      vim.cmd ":AvanteAsk 'Create comprehensive unit tests for this code. Include: 1) Happy path tests, 2) Edge cases and error conditions, 3) Boundary values, 4) Appropriate mocks/stubs where needed. Use testing framework patterns appropriate for the language. Organize tests logically with descriptive names.'"
    end, { desc = 'avante: create thorough unit tests' })

    vim.keymap.set({ 'v', 'x' }, '<leader>ar', function()
      vim.cmd ":AvanteAsk 'Review this code for: 1) Potential bugs/errors, 2) Security vulnerabilities, 3) Performance issues, 4) Maintainability concerns, 5) Adherence to language best practices, 6) Edge cases not handled. Prioritize critical issues first and suggest specific improvements.'"
    end, { desc = 'avante: perform detailed code review' })

    vim.keymap.set({ 'v', 'x' }, '<leader>ax', function()
      vim.cmd ":AvanteAsk 'Explain this code in detail: 1) Overall purpose, 2) How it works step-by-step, 3) Key algorithms or patterns used, 4) Potential edge cases or limitations, 5) Performance characteristics. Adjust explanation depth based on complexity. Include relevant programming concepts where helpful.'"
    end, { desc = 'avante: explain code comprehensively' })

    vim.keymap.set({ 'v', 'x' }, '<leader>ab', function()
      vim.cmd ":AvanteAsk 'Debug this code. Identify potential issues, suggest fixes, and explain the root causes of any bugs. Consider edge cases and runtime errors.'"
    end, { desc = 'avante: debug code' })
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
    -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
