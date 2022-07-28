require "lsp-format".setup {
    css = {{cmd = {'prettier -w'}}},
    html = {{cmd = {'prettier -w'}}},
    javascript = {{cmd = {'prettier -w', './node_modules/.bin/eslint -- fix'}}},
    typescript = { tab_width = 2 },
    yaml = { tab_width = 2 },
}
local prettier = {
    formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
    formatStdin = true,
}
require "lspconfig".efm.setup {
    on_attach = require "lsp-format".on_attach,
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            css = { prettier },
            html = { prettier },
            typescript = { prettier },
            yaml = { prettier },
            javascript = { prettier }
        },
    },
}

