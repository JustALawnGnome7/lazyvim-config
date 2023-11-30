local animate = require('mini.animate')
local neovide_undefined = vim.g.neovide == nil

return {
  "echasnovski/mini.animate",
  config = {
    cursor = {
      enable = neovide_undefined,
      timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
    },
    scroll = {
      enable = true,
      timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
      -- Animate equally but with at most 120 steps instead of default 60
      -- subscroll = animate.gen_subscroll.equal({ max_output_steps = 120 }),
    },
    resize = {
      enable = true,
      timing = animate.gen_timing.linear({ duration = 80, unit = 'total' }),
    },
    -- open = {
    --   -- Animate for 400 milliseconds with linear easing
    --   timing = animate.gen_timing.linear({ duration = 400, unit = 'total' }),
    --
    --   -- Animate with wiping from nearest edge instead of default static one
    --   winconfig = animate.gen_winconfig.wipe({ direction = 'from_edge' }),
    --
    --   -- Make bigger windows more transparent
    --   winblend = animate.gen_winblend.linear({ from = 80, to = 100 }),
    -- },
    -- close = {
    --   -- Animate for 400 milliseconds with linear easing
    --   timing = animate.gen_timing.linear({ duration = 400, unit = 'total' }),
    --
    --   -- Animate with wiping to nearest edge instead of default static one
    --   winconfig = animate.gen_winconfig.wipe({ direction = 'to_edge' }),
    --
    --   -- Make bigger windows more transparent
    --   winblend = animate.gen_winblend.linear({ from = 100, to = 80 }),
    -- }
  }
}
