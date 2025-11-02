return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  -- enabled = function()
  --   -- Disable Obsidian when running from Oil Simple (to avoid path issues in Zed context)
  --   return not vim.g.disable_obsidian
  -- end,
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    ui = {
      enable = false,
    },
    legacy_commands = false,
    completion = {
      cmp = true,
    },
    workspaces = {
      {
        name = 'second_brain',
        path = '~/vaults/second_brain',
      },
      {
        name = 'work',
        path = '~/vaults/work',
      },
    },
    picker = {
      name = 'telescope.nvim',
    },
    daily_notes = {
      folder = '1. Inbox',
      date_format = '%Y-%m-%d',
      alias_format = '%A, %d %B %Y',
    },
    -- Images/attachments settings
    attachments = {
      img_folder = 'assets',
      -- Insert link as Obsidian wiki link: ![[file.png]]
      img_text_func = function(path)
        local name = vim.fs.basename(tostring(path))
        -- local encoded = require('obsidian.util').urlencode(name)
        return string.format('![[%s]]', name)
      end,
    },
    -- Settings for templates
    templates = {
      subdir = 'templates', -- Subdirectory for templates
      date_format = '%Y-%m-%d-%a', -- Date format for templates
      gtime_format = '%H:%M', -- Time format for templates
      tags = '', -- Default tags for templates
    },
    callbacks = {
      enter_note = function(note)
        local buf = note.bufnr
        -- Create / open / search notes
        vim.keymap.set('n', '<leader>on', '<cmd>Obsidian new<CR>', { buffer = buf, desc = 'Obsidian: new note' })
        vim.keymap.set('n', '<leader>of', '<cmd>Obsidian quick_switch<CR>', { buffer = buf, desc = 'Obsidian: quick switch' })
        vim.keymap.set('n', '<leader>os', '<cmd>Obsidian search<CR>', { buffer = buf, desc = 'Obsidian: search in vault' })
        vim.keymap.set('n', '<leader>od', '<cmd>Obsidian today<CR>', { buffer = buf, desc = 'Obsidian: today note' })

        -- Backlinks / TOC / Links
        vim.keymap.set('n', '<leader>ob', '<cmd>Obsidian backlinks<CR>', { buffer = buf, desc = 'Obsidian: backlinks' })
        vim.keymap.set('n', '<leader>ot', '<cmd>Obsidian toc<CR>', { buffer = buf, desc = 'Obsidian: table of contents' })
        vim.keymap.set('n', '<leader>ol', '<cmd>Obsidian links<CR>', { buffer = buf, desc = 'Obsidian: note links' })

        -- Templates / rename
        vim.keymap.set('n', '<leader>op', '<cmd>Obsidian template<CR>', { buffer = buf, desc = 'Obsidian: insert template' })
        vim.keymap.set('n', '<leader>or', '<cmd>Obsidian rename<CR>', { buffer = buf, desc = 'Obsidian: rename node' })

        -- To-dos
        vim.keymap.set('n', '<leader>ch', '<cmd>Obsidian toggle_checkbox<CR>', { buffer = buf, desc = 'Obsidian: toggle checkbox' })

        -- Paste image
        vim.keymap.set('n', '<leader>oi', '<cmd>Obsidian paste_img<CR>', { buffer = buf, desc = 'Obsidian: paste image' })

        -- Open
        vim.keymap.set('n', '<leader>oo', '<cmd>Obsidian open<CR>', { buffer = buf, desc = 'Obsidian: open' })
      end,
    },
  },
}
