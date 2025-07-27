local api_key_loader = require("neoworld.utils.api-key-loader")

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
      model = "claude-sonnet-4-20250514",
    },
    inline = {
      adapter = "copilot",
      model = "claude-sonnet-4-20250514",
    }
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

local fidget = require("fidget")
local spinner = require("fidget.spinner").animate("dots", 1.2)
local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

require("fidget.notification").set_config("CodeCompanion", {
  name = "",
  icon = "",
  info_annote = "",
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestStarted",
  group = group,
  callback = function(event)
    local name = event.data.adapter.name or "unknown"
    local model = event.data.adapter.model or "unknown"
    local msg = ("%s\n%s"):format(name, model)

    fidget.notify(msg, vim.log.levels.INFO, {
      group = "CodeCompanion",
      icon = spinner,
      icon_on_left = true,
      skip_history = true,
      annote = nil,
    })
  end,
})
