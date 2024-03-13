-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 0 -- Lines of context
vim.o.guifont = "Cascadia Mono:h12"
vim.g.autoformat = false

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

  -- vim.g.neovide_cursor_animation_length = AnimateSpeed.cursor_ms / 1000
  -- vim.g.neovide_scroll_animation_length = AnimateSpeed.scroll_ms / 1000
  -- print(vim.g.neovide_scroll_animation_length) --use for debugging

  local map = vim.keymap.set
  local function neovide_scale(amount)
    local new_scale_factor = vim.g.neovide_scale_factor + amount
    if new_scale_factor < 0.5 then
      return
    end
    vim.g.neovide_scale_factor = new_scale_factor
  end

  map("n", "<C-=>", function() neovide_scale(0.1) end)
  map("n", "<C-->", function() neovide_scale(-0.1) end)

end
