-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 0 -- Lines of context

vim.o.guifont = "Cascadia Mono:h13"

if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  -- vim.g.neovide_scroll_animation_length = 0.5
end
