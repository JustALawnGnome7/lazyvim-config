-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 0 -- Lines of context
vim.o.guifont = "Cascadia Mono:h13"

AnimateSpeed = {
  cursor_ms = 100,
  scroll_ms = 150,
  resize_ms = 80,
}

if vim.g.neovide then
  vim.g.neovide_transparency = 0.8
  -- vim.g.neovide_profiler = true --displays frame rate
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_unlink_border_highlights = true

  vim.g.neovide_cursor_animation_length = AnimateSpeed.cursor_ms / 1000
  vim.g.neovide_scroll_animation_length = AnimateSpeed.scroll_ms / 1000

  -- print(vim.g.neovide_scroll_animation_length) --use for debugging
end
