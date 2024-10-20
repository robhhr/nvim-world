local keymap = vim.keymap

keymap.set("i", "<M-Right>", "codeium#Accept()", { expr = true, silent = true, noremap = true })
keymap.set("i", "<M-Left>", "codeium#Clear()", { expr = true, silent = true, noremap = true })
keymap.set("i", "<M-Up>", "<Cmd>call codeium#CycleCompletions(1)<CR>", { silent = true, noremap = true })
keymap.set("i", "<M-Down>", "<Cmd>call codeium#CycleCompletions(-1)<CR>", { silent = true, noremap = true })
