local status_ok, checkmate = pcall(require, "checkmate")

if not status_ok then
  return
end

checkmate.setup({
  files = {
    "todo.md",
    "TODO.md",
    "*.todo.md"
  },
  keys = {
    ['<leader>tt'] = {
      rhs = '<cmd>Checkmate toggle<CR>',
      desc = "toggle todo item",
      mode = { "n", "v" }
    },
    ["<leader>tc"] = {
      rhs = "<cmd>Checkmate check<CR>",
      desc = "Set todo item as checked (done)",
      modes = { "n", "v" },
    },
    ["<leader>tu"] = {
      rhs = "<cmd>Checkmate uncheck<CR>",
      desc = "Set todo item as unchecked (not done)",
      modes = { "n", "v" },
    },
    ["<leader>tn"] = {
      rhs = "<cmd>Checkmate create<CR>",
      desc = "Create todo item",
      modes = { "n", "v" },
    },
    ["<leader>tr"] = {
      rhs = "<cmd>Checkmate remove_all_metadata<CR>",
      desc = "Remove all metadata from a todo item",
      modes = { "n", "v" },
    },
    ["<leader>ta"] = {
      rhs = "<cmd>Checkmate archive<CR>",
      desc = "Archive checked/completed todo items (move to bottom section)",
      modes = { "n" },
    },
  },
  style = {
    CheckmateCheckedMarker = { fg = "#8ec07c", bold = true },
    CheckmateUncheckedMarker = { fg = "#fb4934", bold = true },
    CheckmateTodoCountIndicator = { fg = "#fabd2f", bold = true },
  },
  metadata = {
    priority = {
      style = function(context)
        local value = context.value:lower()
        if value == "high" then
          return { fg = "#fb4934", bold = true }
        elseif value == "medium" then
          return { fg = "#fe8019" }
        elseif value == "low" then
          return { fg = "#83a598" }
        else -- fallback
          return { fg = "#83a598" }
        end
      end,
    },
    started = {
      style = { fg = "#b8bb26" },
    },
    done = {
      style = { fg = "#b8bb26" },
    },
  },
  linter = {
    enabled = false,
  }
})
