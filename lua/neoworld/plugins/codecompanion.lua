local api_key_loader = require("neoworld.utils.api-key-loader")

require("codecompanion").setup({
    strategies = {
        chat = {
            adapter = "anthropic",
        },
    },
    adapters = {
        anthropic = function()
            local api_key = api_key_loader.read_api_key("~/.config/nvim/secrets/anthropic_api_key")

            return require("codecompanion.adapters").extend("anthropic", {
                env = {
                    api_key = api_key or "",
                },
            })
        end,
    },
})
