require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true
        },
    },
    diagnostics = {
        enable = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
    modified = {
        enable = true,
    },
    renderer = {
        group_empty = false,
        highlight_git = true,
        highlight_modified = 'all',
        highlight_opened_files = "all",
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
        icons = {
            git_placement = 'after',
            modified_placement = 'before',
            padding = ' ',
            show = {
                folder = true,
                folder_arrow = false,
                modified = false,
            },
            glyphs = {
                git = {
                    unstaged = "✘",
                    staged = "✔",
                },
            },
        },
    },
    view = {
        number = true,
        relativenumber = true,
        side = "left",
        width = "100%",
    },
})

