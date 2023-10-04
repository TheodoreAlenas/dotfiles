function SetTransparentBackground()
  --vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
  local groups = {
    "Normal",
    "LineNR", "CursorLineNR",
    "SignColumn", "FoldColumn",
    "TelescopeBorder",
    "GitSignsAdd", "GitSignsChange", "GitSignsDelete",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, {ctermbg=220})
  end
end

vim.cmd.colorscheme "desert16"


