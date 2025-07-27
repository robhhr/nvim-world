local global = vim.g
local keymap = vim.keymap

global.copilot_filetypes = { ["*"] = true, xml = false }

global.copilot_no_tab_map = true

keymap.set("i", "<M-Up>", "copilot#Previous()", { expr = true, silent = true })
keymap.set("i", "<M-Down>", "copilot#Next()", { expr = true, silent = true })
keymap.set("i", "<M-Left>", "copilot#Dismiss()", { expr = true, silent = true })

vim.cmd [[highlight CopilotSuggestion guifg=#83a598 ctermfg=8]]
