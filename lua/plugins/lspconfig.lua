--local omnisharp_extended = require("Hoffs/omnisharp-extended-lsp.nvim")
--local omnisharp_extended = require("omnisharp_extended").handler

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
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- omnisharp will be automatically installed with mason and loaded with lspconfig
        omnisharp = {
          --handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler(), },
          handlers = {
            ["textDocument/definition"] = function ()
              return require("omnisharp_extended").handler()
            end
          },
          cmd = { "/home/miles/.local/share/nvim/mason/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
          on_attach = (function (client, _)
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
          end),
          settings = {
            omnisharp = {
              useModernNet = false,
              enableEditorConfigSupport = false,
              enableDecompilationSupport = true,
            },
          },
        },
      },
      setup = {
        -- omnisharp = function(_, opts)
        --   local pid = vim.fn.getpid()
        --   local omnisharp_bin = "/home/miles/.local/share/nvim/mason/bin/omnisharp"
        --   local config = {
        --     handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler, },
        --     cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        --   }
        --   --local omnisharp = require ("mason-lspconfig.server_configurations.omnisharp").setup({ server = opts })
        --   --require("omnisharp").setup({ server = opts })
        --   --require("lspconfig").omnisharp.setup(config)
        --   return true
        -- end,
      }
    },
  },

  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = "cs",
  },
}
