local dap = require("dap")
local dapui = require("dapui")

-- ── UI & inline values (language-agnostic) ────────────────────────────────
dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Auto open/close the debug UI with the session — mirrors VSCode's "debug mode".
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- Gutter signs: the "red dot" and the current-line stop marker.
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "" })

-- ── Language adapters ─────────────────────────────────────────────────────
-- Each language is one plug-in here; the UI and keymaps above stay the same.
-- Go (uses delve). To add another language later, install its adapter plugin
-- and add its setup line below — nothing else changes.
require("dap-go").setup()
