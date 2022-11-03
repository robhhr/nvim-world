local status_ok, ufo = pcall(require, 'ufo')
if not status_ok then
  return
end

-- local ufo = require('ufo')

local ftMap = {
  vim = 'indent',
  php = {'indent'},
  git = ''
}

ufo.setup({
  open_fold_hl_timeout = 150,
  close_fold_links = {'imports', 'comment'},
  preview = {
    mappings = {
      scrollU = '<C-u>',
      scrollD = '<C-d>'
    }
  },
  provider_selector = function(bufnr, filetype, buftype)
    return ftMap[filetype]
  end
})

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
vim.keymap.set('n', 'zm', ufo.closeFoldsWith)
vim.keymap.set('n', 'K', function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not windid then
      vim.lsp.buf.hover()
  end
end)

