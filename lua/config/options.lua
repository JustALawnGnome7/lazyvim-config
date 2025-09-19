-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for

vim.opt.scrolloff = 0 -- Lines of context
vim.g.autoformat = false

AnimateSpeed = {
  cursor_ms = 100,
  scroll_ms = 150,
  resize_ms = 80,
}

if vim.g.neovide then
  vim.o.guifont = "Cascadia Mono NF:h11:#e-subpixelantialias"

  vim.g.neovide_opacity = 0.85
  -- vim.g.neovide_profiler = true --displays frame rate
  -- vim.g.neovide_refresh_rate = 165 --forced refresh rate; no longer needed.
  -- vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_unlink_border_highlights = true

  -- vim.g.neovide_cursor_animation_length = AnimateSpeed.cursor_ms / 1000
  -- vim.g.neovide_scroll_animation_length = AnimateSpeed.scroll_ms / 1000
  vim.g.neovide_scroll_animation_length = 0.1
  -- vim.g.neovide_scroll_animation_far_lines = 9999

  -- Used for debugging only
  -- print("vim.g.neovide_cursor_animation_length = ", vim.g.neovide_cursor_animation_length)
  -- print("vim.g.neovide_scroll_animation_length = ", vim.g.neovide_scroll_animation_length)
  -- print("vim.g.neovide_scroll_animation_far_lines = ", vim.g.neovide_scroll_animation_far_lines)

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
