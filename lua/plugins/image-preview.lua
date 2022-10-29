local status_ok, image_preview = pcall(require, 'image_preview')
if not status_ok then
  return
end

image_preview.setup({})
