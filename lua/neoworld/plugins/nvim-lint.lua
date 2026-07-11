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

local function run_lint()
  if vim.bo.filetype == "php" then
    local root = php_root()
    local bin = root and (root .. "/vendor/bin/phpcs")

    if bin and vim.uv.fs_stat(bin) then
      phpcs.cmd = "php"
      phpcs.args = { bin, "-q", "--report=json" }
      phpcs.cwd = root
    else
      -- fall back to a global phpcs if one exists.
      phpcs.cmd = "phpcs"
      phpcs.args = { "-q", "--report=json" }
      phpcs.cwd = nil
    end
  end

  lint.try_lint()
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = run_lint,
})

vim.schedule(run_lint)
