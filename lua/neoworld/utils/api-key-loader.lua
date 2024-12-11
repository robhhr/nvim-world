local M = {}

-- Function to read API key from a file
function M.read_api_key(file_path)
  -- Expand the path to handle ~ for home directory
  local full_path = vim.fn.expand(file_path)

  -- Open the file
  local file = io.open(full_path, "r")
  if not file then
    vim.notify("Could not open API key file: " .. full_path, vim.log.levels.ERROR)
    return nil
  end

  -- Read the entire file content, trim whitespace
  local content = file:read("*all"):gsub("^%s*(.-)%s*$", "%1")
  file:close()

  return content
end

return M
