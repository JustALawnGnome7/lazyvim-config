-- disable flash.nvim because it conflicts with baseline F key functionality
return {
  {
    "folke/flash.nvim",
    enabled = false,
    -- -- settings to use if reenabled
    -- opts = {
    --   modes = {
    --     char = {
    --       multi_line = false,
    --       highlight = { backdrop = false },
    --     },
    --   },
    -- },
  },
}
