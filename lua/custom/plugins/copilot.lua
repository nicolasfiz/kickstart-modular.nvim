return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        filetypes = {
          ['*'] = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<Tab>',
          },
        },
      }
    end,
  },
  -- {
  --   'saghen/blink.cmp',
  --   optional = true,
  --   -- enabled = false,
  --   dependencies = { 'fang2hou/blink-copilot' },
  --   opts = {
  --     sources = {
  --       default = { 'copilot' },
  --       providers = {
  --         copilot = {
  --           name = 'copilot',
  --           module = 'blink-copilot',
  --           score_offset = 100,
  --           async = true,
  --         },
  --       },
  --     },
  --   },
  -- },
}
