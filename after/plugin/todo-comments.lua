require('todo-comments').setup({
  keywords = {
    FIX = {
      color = '#FF3131',
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'BROKEN' }
    },
    TODO = {
      color = '#FAFA33',
      alt = { 'PENDING' }
    },
    HACK = {
      color = '#E0B0FF',
      alt = { 'HACKY' }
    },
    WARN = {
      color = '#FFC000',
      alt = { 'ALERT', 'WARNING' }
    },
    PERF = {
      color = '#0FFF50',
      alt = { 'DONE', 'PASS' }
    },
    NOTE = {
      color = '#40E0D0',
      alt = { 'COMMENT', 'NOTED' }
    },
    TEST = {
      color = '#E5E4E2',
      alt = { 'TESTING', 'TEMP' }
    },
  },
})
