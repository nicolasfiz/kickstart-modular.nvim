return {
  -- install without yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreview<cr>', desc = 'Start Markdown Preview' },
      { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', desc = 'Stop Markdown Preview' },
    },
  },
  -- install with yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreview<cr>', desc = 'Start Markdown Preview' },
      { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', desc = 'Stop Markdown Preview' },
    },
  },
}
