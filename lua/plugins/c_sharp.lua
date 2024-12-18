return {
  -- add C# to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp", })
      end
    end,
  },

  -- setup lspconfig for C#
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "Hoffs/omnisharp-extended-lsp.nvim" },
      {
        -- configure omnisharp-vim to use the omnisharp binary from mason
        "OmniSharp/omnisharp-vim",
        config = function()
          vim.cmd([[
            let g:OmniSharp_server_path = "/home/miles/.local/share/nvim/mason/bin/omnisharp"
          ]])
        end
      },
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.omnisharp
        omnisharp = {
          keys = {
            -- override default LazyVim functionality with omnisharp-vim features
            { "gd", "<cmd>OmniSharpGotoDefinition<CR>", desc = "Goto Definition" },
            { "gy", "<cmd>OmniSharpGotoTypeDefinition<CR>", desc = "Goto Type Definition" },
          },
        }
      },
      setup = {
        omnisharp = function(_, opts)
          -- enable "Goto Definition" for metadata
          opts.handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler, }
        end,
      }
    },
  },
}
