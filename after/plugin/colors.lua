function ColorMyPencils(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "#121212" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121212" })
end

-- ColorMyPencils()
