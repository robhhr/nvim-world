local M = {}

-- Reads the desired background mode from the system theme file (written by an
-- external theme switcher). Returns "light" or "dark"; defaults to "dark" if
-- the file is missing/unreadable. Single source of truth — both set.lua and the
-- gruvbox config consume this so the read logic lives in exactly one place.
function M.read_mode()
  local f = io.open(vim.fn.expand("~/.config/theme/current"), "r")
  local mode = f and f:read("*l") or "dark"
  if f then f:close() end
  return mode
end

return M
