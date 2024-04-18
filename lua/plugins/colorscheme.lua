return {
  -- Add the colorscheme plugins
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {                                    -- DEFAULT SETTINGS:
      variant = "auto",                         -- "auto"
      dark_variant = "main",                    -- "main"
      dim_inactive_windows = true,              -- false
      extend_background_behind_borders = true,  -- true

      enable = {
        terminal = true,                        -- true
        legacy_highlights = true,               -- true
        migrations = true,                      -- true
      },

      styles = {
        bold = true,                            -- true
        italic = true,                          -- true
        transparency = true,                    -- false
      },

      -- groups = {
      --   border = "muted",
      --   link = "iris",
      --   panel = "surface",
      --
      --   error = "love",
      --   hint = "iris",
      --   info = "foam",
      --   note = "pine",
      --   todo = "rose",
      --   warn = "gold",
      --
      --   git_add = "foam",
      --   git_change = "rose",
      --   git_delete = "love",
      --   git_dirty = "rose",
      --   git_ignore = "muted",
      --   git_merge = "iris",
      --   git_rename = "pine",
      --   git_stage = "iris",
      --   git_text = "rose",
      --   git_untracked = "subtle",
      --
      --   h1 = "iris",
      --   h2 = "foam",
      --   h3 = "rose",
      --   h4 = "gold",
      --   h5 = "pine",
      --   h6 = "foam",
      -- },

      highlight_groups = {
        --Comment = { fg = "foam" },
        --VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, pallette)
        -- -- Disable all underculs
        -- if highlight.undercurl then
        --   highlight.undercurl = false
        -- end
        --
        -- -- Change pallette colour
        -- if highlight.fg == pallette.pine then
        --   highlight.fg = pallette.foam
        -- end
      end,
    },
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
      -- colorscheme = "rose-pine",
      colorscheme = "tokyonight-night",
      transparent = true,
    },
  },
}
