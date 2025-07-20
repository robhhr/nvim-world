local status_ok, markdown = pcall(require, "render-markdown")

if not status_ok then
  return
end

markdown.setup({
  enabled = false
})
