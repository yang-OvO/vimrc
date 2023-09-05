local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end


db.setup({
    theme = 'hyper',
    config = {
        header = {
             [[]],
  [[          ▀████▀▄▄              ▄█ ]],
  [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
  [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
  [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
  [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
  [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
  [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
  [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
  [[   █   █  █      ▄▄           ▄▀   ]],
             [[]],
        },
        shortcut = {
            -- { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
                icon = "  ",
                desc = "Projects",
                action = "Telescope projects",
                key = 'i',
            },
            {
              icon = "  ",
              icon_hl = '@variable',
              desc = 'Old Files',
              group = 'Label',
              action = 'Telescope oldfiles',
              key = 'o',
            },
            -- {
            --   desc = ' Apps',
            --   group = 'DiagnosticHint',
            --   action = 'Telescope app',
            --   key = 'a',
            -- },
            -- {
            --   desc = ' dotfiles',
            --   group = 'Number',
            --   action = 'Telescope dotfiles',
            --   key = 'd',
            -- },
        },
    },
})
