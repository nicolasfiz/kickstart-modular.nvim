return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        filetypes = {
          go = true,
          python = true,
          javascript = true,
          typescript = true,
          typescriptreact = true,
          javascriptreact = true,
          tsx = true,
          jsx = true,
          lua = true,
          rust = true,
          cpp = true,
          c = true,
          java = true,
          html = true,
          css = true,
          scss = true,
          json = true,
          yaml = true,
          toml = true,
          sh = true,
          bash = true,
          zsh = true,
          sql = true,
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
