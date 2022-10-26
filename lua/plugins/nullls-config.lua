local null_ls = require("null-ls")
local utils = require("null-ls.utils")
local prettier = require("prettier")

null_ls.setup({
    root_dir = utils.root_pattern("composer.json", "package.json", ".git"), -- Add composer
    diagnostics_format = "#{m} (#{c}) [#{s}]",    -- Makes PHPCS errors more readeable
    sources = {
        null_ls.builtins.completion.spell,        -- You still need to execute `:set spell`
        null_ls.builtins.diagnostics.eslint,      -- Add eslint to js projects
        null_ls.builtins.diagnostics.phpcs.with({ -- Change how the php linting will work
            prefer_local = "vendor/bin",
        }),
        null_ls.builtins.formatting.stylua,       -- You need to install stylua first: `brew install stylua`
        null_ls.builtins.formatting.phpcbf.with({ -- Use the local installation first
            prefer_local = "vendor/bin",
        }),
    },
})

prettier.setup({
    ["null-ls"] = {
        cli_options = {
            {
                arrow_parens = "avoid",
                bracket_spacing = false,
                end_of_line = "lf",
                html_white_space_sensitivity = "css",
                print_width = 80,
                prose_wrap = "preserve",
                require_pragma = false,
                semi = false,
                single_quote = true,
                tab_width = 2,
                trailing_comma = "all",
                use_tabs = false
        }
    },
      runtime_condition = function(params)
        -- return false to skip running prettier
        return true
      end,
      timeout = 5000,
    }
  })
