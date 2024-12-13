local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("css", {
  s("disp", { t("display: "), i(1, "block"), t(";") }),
  s("pos", { t("position: "), i(1, "absolute"), t(";") }),
})

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
