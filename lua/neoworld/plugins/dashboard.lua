local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  return
end

dashboard.setup({
  theme = 'hyper',
  config = {
    header = {
      '',
      ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      '       configs are never done — only abandoned.        ',
      '    ──────────────────────────────────────────────     ',
      ''
    },
    packages = {
      enable = false, -- disable package count
    },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
    },
  },
})
