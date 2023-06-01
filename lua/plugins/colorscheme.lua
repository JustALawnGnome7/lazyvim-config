return {
  -- Add the colorscheme plugins
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },

  -- Configure LazyVim to load a colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
      -- colorscheme = "tokyonight-night",
      transparent = true,
    },
  },
}
