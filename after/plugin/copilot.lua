local keymap = vim.keymap
local global = vim.g

-- for basic disable/enable filetypes
global.copilot_filetypes = { xml = false }

-- for disabling all and enabling specific filetypes
-- vim.g.copilot_filetypes = {["*"] = false, python = true }

-- remap tab for enter
global.copilot_no_tab_map = true
keymap.set("i", "<M-Space>", "copilot#Accept('\\<CR>')<CR>", { expr = true, silent = true })

-- remap (cycle to next suggestion)
keymap.set("i", "<M-Down>", "copilot#Next()", { expr = true, silent = true })

-- remap (cycle to prev suggestion)
keymap.set("i", "<M-Up>", "copilot#Previous()", { expr = true, silent = true })

vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
