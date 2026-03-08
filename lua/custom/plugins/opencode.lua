return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        -- picker = { -- Enhances `select()`
        --   actions = {
        --     opencode_send = function(...)
        --       return require('opencode').snacks_picker_send(...)
        --     end,
        --   },
        --   win = {
        --     input = {
        --       keys = {
        --         ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
        --       },
        --     },
        --   },
        -- },
        terminal = {}, -- Enables the `snacks` provider
      },
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        require('telescope').setup {
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown {},
            },
          },
        }
        require('telescope').load_extension 'ui-select'
      end,
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type or field for details
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = 'Opencode: Ask opencode…' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ox', function()
      require('opencode').select()
    end, { desc = 'Opencode: Execute opencode action…' })
    vim.keymap.set({ 'n', 't' }, '<leader>oo', function()
      require('opencode').toggle()
    end, { desc = 'Opencode: Toggle opencode' })

    vim.keymap.set({ 'n', 'x' }, '<leader>or', function()
      return require('opencode').operator '@this '
    end, { desc = 'Opencode: Add range to opencode', expr = true })
    vim.keymap.set('n', '<leader>ol', function()
      return require('opencode').operator '@this ' .. '_'
    end, { desc = 'Opencode: Add line to opencode', expr = true })

    vim.keymap.set('n', '<S-C-u>', function()
      require('opencode').command 'session.half.page.up'
    end, { desc = 'Opencode: Scroll opencode up' })
    vim.keymap.set('n', '<S-C-d>', function()
      require('opencode').command 'session.half.page.down'
    end, { desc = 'Opencode: Scroll opencode down' })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    -- vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment under cursor', noremap = true })
    -- vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement under cursor', noremap = true })
  end,
}
