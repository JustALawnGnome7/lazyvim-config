return {
  -- add C# to the list of supported treesitter languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "c_sharp",
      })
    end,
  },

  -- Configure omnisharp (C#) settings
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Hoffs/omnisharp-extended-lsp.nvim",
      "OmniSharp/omnisharp-vim",
    },
    ---@class PluginLspOpts
    opts = {
      setup = {
        omnisharp = function(_, opts)
          -- opts.cmd = { "dotnet", "/home/miles/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" }
          opts.handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").handler,
          }

          opts.on_attach = function (client, _)
            local function toSnakeCase(str)
              return string.gsub(str, "%s*[- ]%s*", "_")
            end

            local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
            for i, v in ipairs(tokenModifiers) do
              tokenModifiers[i] = toSnakeCase(v)
            end

            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
            for i, v in ipairs(tokenTypes) do
              tokenTypes[i] = toSnakeCase(v)
            end
          end
        end,
      }
    },
  },

  -- Configure omnisharp-vim to use the OmniSharp binary acquired through Mason
  {
    "OmniSharp/omnisharp-vim",
    config = function()
      vim.cmd([[
        let g:OmniSharp_server_path = "/home/miles/.local/share/nvim/mason/bin/omnisharp"
      ]])
    end,
  },
}
