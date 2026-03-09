local global = vim.g
local keymap = vim.keymap

global.copilot_filetypes = {
  ["env"] = false,
  ["json"] = false,
  ["sh"] = false,
  ["markdown"] = false,
  ["text"] = false,
  ["xml"] = false,
}

global.copilot_no_tab_map = true

keymap.set("i", "<M-Up>", "copilot#Previous()", { expr = true, silent = true })
keymap.set("i", "<M-Down>", "copilot#Next()", { expr = true, silent = true })
keymap.set("i", "<M-Left>", "copilot#Dismiss()", { expr = true, silent = true })
keymap.set("n", "<leader>cd", ":Copilot disable<CR>")
keymap.set("n", "<leader>ce", ":Copilot enable<CR>")

vim.cmd [[highlight CopilotSuggestion guifg=#83a598 ctermfg=8]]
