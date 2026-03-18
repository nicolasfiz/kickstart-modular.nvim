return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    enabled = true,
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
            accept = false,
          },
        },
      }
      vim.keymap.set('i', '<Tab>', function()
        if require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
        end
      end, { desc = 'Accept copilot suggestion or insert tab' })
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
