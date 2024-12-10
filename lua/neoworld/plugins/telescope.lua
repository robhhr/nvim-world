local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>t", ":Telescope ")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ll', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>gp', function()
    builtin.grep_string({ search = vim.fn.input("grep_string >") });
end)
vim.keymap.set('n', '<leader><leader>e', builtin.symbols, {})

-- telescope.load_extension('lazygit')
-- telescope.load_extension('media_files')

telescope.setup({
    defaults = {
        path_display = { "absolute" },
        file_ignore_patterns = {
            ".git/",
            "node_modules/*",
            "^wp-admin/",
            "^wp-includes/",
        },
    },
    pickers = {
        find_files = {
            theme = 'dropdown',
        },
        git_files = {
            theme = 'dropdown'
        },
        live_grep = {
            theme = 'dropdown'
        },
        buffers = {
            theme = 'dropdown'
        },
        current_buffer_fuzzy_find = {
            theme = 'dropdown'
        },
    }
})
