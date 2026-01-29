local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("html", {
  s("html5", {
    t("<!DOCTYPE html>"),
    t({ "", "<html lang='en'>" }),
    t({ "", "<head>", "  <meta charset='UTF-8'>", "  <title>" }),
    i(1, "Title"),
    t({ "</title>", "</head>", "", "<body>", "" }),
    i(2),
    t({ "", "</body>", "</html>" }),
  }),
})

ls.add_snippets("php", {
  s("echo", {
    t("<?php echo "),
    i(1),
    t(" ?>"),
  }),
})

ls.add_snippets("php", {
  s("phpif", {
    t("<?php if ("),
    i(1, "condition"),
    t(") : ?>"),
    t({ "", "  " }),
    i(2, "// content"),
    t({ "", "<?php endif; ?>" }),
  }),
})

ls.add_snippets("php", {
  s("phpife", {
    t("<?php if ("),
    i(1),
    t(") : ?>"),
    t({ "", "  " }),
    i(2),
    t({ "", "<?php else : ?>" }),
    t({ "", "  " }),
    i(3),
    t({ "", "<?php endif; ?>" }),
  }),
})

