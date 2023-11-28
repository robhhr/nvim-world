local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' - ' .. datetime
end

-- Banner
local flagBanner = {
  [[    -------------------------------------------------------------------   ]],
  [[    XWXWXWXWXWXWXWXW                                   WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX                 A                 XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW                AWA                WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX           AA  AWXWA  AA           XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW            VWXWXWXWXWV            WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX        AA   VWXWXWXWV   AA        XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW    VWXWXWXA  VWXWXWV  AXWXWXWV    WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX     XWXWXWXWXWXWXWXWXWXWXWXWX     XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW   AXWXWXWXWXWXWXWXWXWXWXWXWXWXA   WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX      VXWXWXWXWXWXWXWXWXWXWXV      XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW         VXWXWXWXWXWXWXWXV         WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX           XWXWXWXWXWXWX           XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW         AXWXWXWXWXWXWXWXA         WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX                 I                 XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW                 I                 WXWXWXWXWXWXWXWX   ]],
  [[    WXWXWXWXWXWXWXWX                 I                 XWXWXWXWXWXWXWXW   ]],
  [[    XWXWXWXWXWXWXWXW                                   WXWXWXWXWXWXWXWX   ]],
  [[    -------------------------------------------------------------------   ]],
}

local banner = {
  [[  /      \                    ]],
  [[ |        |                   ]],
  [[ |:/-\\--\.                   ]],
  [[   ( )-( )/,                  ]],
  [[   | ,  .                     ]],
  [[   / \- /. \                  ]],
  [[ | ||L  / \ \                 ]],
  [[ / /  \/    | *               ]],
  [[ / /          \  \            ]],
  [[ | |      []   |\ |           ]],
  [[ /| |           ||  |         ]],
  [[ || |           ||  |         ]],
  [[ |  |           ||  |         ]],
  [[ /_ |__________|||  |         ]],
  [[ /_ \| ---------||   |        ]],
  [[ /_ / |         ||   |        ]],
  [[ /  | ||         | |          ]],
  [[ \//  ||         | |  |       ]],
  [[ /  | ||    T    | |  |       ]],
  [[ /   | ||    |     |          ]],
  [[ /     fog╚═╝╚═╝  ╚═╝╚══════╝ ]],
}

local bannerPikachu = {
  [[      ⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣠⣤⣶⣶    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢰⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣀⣀⣾⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⡏⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠙⠿⠿⠿⠻⠿⠿⠟⠿⠛⠉⠀⠀⠀⠀⠀⣸⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⢰⣹⡆⠀⠀⠀⠀⠀⠀⣭⣷⠀⠀⠀⠸⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠈⠉⠀⠀⠤⠄⠀⠀⠀⠉⠁⠀⠀⠀⠀⢿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⢾⣿⣷⠀⠀⠀⠀⡠⠤⢄⠀⠀⠀⠠⣿⣿⣷⠀⢸⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡀⠉⠀⠀⠀⠀⠀⢄⠀⢀⠀⠀⠀⠀⠉⠉⠁⠀⠀⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿    ]],
}

local bannerPikachuColor = {
  [[  ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛⬛⬛⬛⬛⬛⬛⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛⬛⬛🟨🟨🟨🟨🟨🟨🟨⬛⬛⬛⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛⬛⬛⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬛⬛⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬛⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬛⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬛⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬛🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨⬛⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬛⬛🟨🟨🟨🟨🟨⬛🟨🟨🟨⬛⬛🟨🟨🟨🟨🟨🟨🟨⬛⬛🟨🟨🟨⬛🟨🟨🟨🟨🟨⬛⬛⬜  ]],
  [[  ⬜⬜⬜⬜⬛⬛⬛⬛🟨🟨⬛⬛🟨🟨⬛⬛🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨⬛⬛🟨🟨⬛⬛🟨🟨⬛⬛⬛⬛  ]],
  [[  ⬜⬜⬜⬛⬛⬛⬛⬛⬛⬛⬜⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬜⬛⬛⬛⬛⬛⬛  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛🟨🟨🟨🟨🟨🟨🟨🟨⬛⬛⬛🟨🟨🟨🟨🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛🟨🟨🟥🟥🟨🟨🟨🟨⬛⬛⬛⬛⬛🟨🟨🟨🟨🟥🟥🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛⬛⬛⬛⬛⬛⬜⬜⬜⬜⬛🟨🟥🟥🟥🟥🟨🟨🟨⬛🟥🟥🟥⬛🟨🟨🟨🟥🟥🟥🟥🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛🟨🟨🟨🟨🟨⬛⬛⬛⬜⬛🟨🟥🟥🟥🟥🟨🟨🟨⬛🟥🟥🟥⬛🟨🟨🟨🟥🟥🟥🟥🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛🟨🟨🟨🟨🟨🟨🟨🟨⬛⬛🟨🟨🟥🟥🟨🟨🟨🟨⬛🟥🟥🟥⬛⬛⬛🟨🟨🟥🟥🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬛⬛⬛🟨🟨⬛🟨🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨⬛🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨⬛🟨🟨⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬛⬛⬛⬛🟨🟨🟨🟨🟨🟨🟨⬛⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨⬛⬛⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬛⬛⬛🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨⬛🟨⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬜⬜⬛⬛🟨🟨⬛🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬛⬛🟨🟨🟨⬛⬛🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬛⬛🟨🟨🟨⬛⬛⬛🟨🟨🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬛🟨🟨🟨⬛⬛⬛⬛⬛🟨🟨⬛🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬛⬛🟨🟨🟨⬛⬛⬛🟨🟨⬛🟨🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
  [[  ⬜⬜⬜⬜⬜⬛⬛🟨🟨🟨⬛🟨🟨🟨⬛🟨🟨⬛🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨🟨⬛⬜⬜⬜⬜⬜⬜  ]],
}

local bannerL = {
  [[      ⣿⣿⡿⠛⠛⠛⠛⠛⠛⠿⢿⣿⣿⡿⠿⣻⣿⣿⠿⠟⠛⢛⣛⣿⣿⣿⣿⣿    ]],
  [[      ⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⠟⠁⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⢃⣴⣾⣿⣷⣶⣦⣤⣤⣶⠞⠀⢠⣿⣿⠃⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⣾⣿⣿⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⣿⣿⣧⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢿⣿⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⡿⠛⠉⠉⠉⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣷⣶⣶⣦⡀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⢸⣿⣿⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣉⡉⠉⠁⠀⠀⠀⣾⣿⡟⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⢰⣿⡿⠁⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣿⡿⠁⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⣿⡿⠁⢠⡾⠋⠠⠞⠛⠛⠉⠉⠉⠉⠉⠙⠛⠿⣿⣿⣿⣿    ]],
  [[      ⣿⣿⣿⣿⣿⣿⡟⠁⠠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠋⣡    ]],
  [[      ⣿⣿⣿⣿⡿⠋⢀⣀⣤⣤⣴⣶⣶⣶⣶⣶⣶⣤⣤⣀⠀⠀⠀⠀⠀⣠⣾⣿    ]],
  [[      ⣿⣿⣿⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⣠⣾⣿⣿⣿    ]],
}

dashboard.section.header.val = bannerPikachu

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
  dashboard.button('s', '  Settings', ':n ~/.config/nvim/<CR>'),
  dashboard.button('u', '  Update plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
