local lint = require("lint")

lint.linters_by_ft = {
  php = { "phpcs" },
}

local phpcs = lint.linters.phpcs

phpcs.stdin = false
phpcs.append_fname = true

local function php_root()
  return vim.fs.root(0, { "phpcs.xml.dist", "phpcs.xml", "composer.json", ".git" })
end

-- Composer ships vendor/bin/phpcs in three shapes across projects:
--   1. an executable symlink/script  -> run it directly
--   2. a non-executable `sh` proxy    -> `php <proxy>` just ECHOES the shell
--      script (the "Parser failed / invalid token" error), so we must instead
--      target the real PHP entry point, vendor/squizlabs/.../bin/phpcs
--   3. a non-executable plain PHP script -> run it through `php`
-- Returns (cmd, leading_args) or nil when no project-local phpcs is found.
local function resolve_phpcs(root)
  local bin = root .. "/vendor/bin/phpcs"
  if vim.fn.executable(bin) == 1 then
    return bin, {}
  end

  local real = root .. "/vendor/squizlabs/php_codesniffer/bin/phpcs"
  if vim.uv.fs_stat(real) then
    return "php", { real }
  end

  if vim.uv.fs_stat(bin) then
    return "php", { bin }
  end

  return nil, nil
end

local function run_lint()
  if vim.bo.filetype == "php" then
    local root = php_root()
    local cmd, lead = nil, nil
    if root then
      cmd, lead = resolve_phpcs(root)
    end

    if cmd then
      phpcs.cmd = cmd
      phpcs.args = vim.list_extend(lead, { "-q", "--report=json" })
    else
      -- fall back to a global phpcs if one exists.
      phpcs.cmd = "phpcs"
      phpcs.args = { "-q", "--report=json" }
    end
    -- Run from the project root so phpcs discovers a phpcs.xml(.dist) ruleset.
    phpcs.cwd = root
  end

  lint.try_lint()
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = run_lint,
})

vim.schedule(run_lint)
