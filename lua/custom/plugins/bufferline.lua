return {
  'akinsho/bufferline.nvim',
  version = '*',
  enabled = true,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'tabs',
        always_show_bufferline = false,
      },
    }
  end,
}
