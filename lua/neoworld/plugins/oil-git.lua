local status_ok, oil_git = pcall(require, "oil-git-status")
if not status_ok then
  return
end

oil_git.setup({
  show_ignored = true
})
