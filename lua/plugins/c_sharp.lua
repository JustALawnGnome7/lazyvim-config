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
          -- opts.cmd = { "dotnet", "/home/miles/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" }

          -- enable "Goto Definition" for metadata
          opts.handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler, }

          -- Temporary hack for: "https://github.com/OmniSharp/omnisharp-roslyn/issues/2483"
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

  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --       opts = function(_, opts)
  --         opts.ensure_installed = opts.ensure_installed or {}
  --         -- table.insert(opts.ensure_installed, "js-debug-adapter")
  --         table.insert(opts.ensure_installed, "netcoredbg")
  --       end,
  --     },
  --   },
  --   opts = function()
  --     local dap = require("dap")
  --     if not dap.adapters["pwa-node"] then
  --       dap.adapters["pwa-node"] = {
  --         type = "server",
  --         host = "localhost",
  --         port = "${port}",
  --         executable = {
  --           command = "node",
  --           -- 💀 Make sure to update this path to point to your installation
  --           args = {
  --             -- require("mason-registry").get_package("js-debug-adapter"):get_install_path()
  --             require("mason-registry").get_package("netcoredbg"):get_install_path()
  --               .. "/js-debug/src/dapDebugServer.js",
  --             "${port}",
  --           },
  --         },
  --       }
  --     end
  --     -- for _, language in ipairs({ "typescript", "javascript" }) do
  --     for _, language in ipairs({ "c_sharp" }) do
  --       if not dap.configurations[language] then
  --         dap.configurations[language] = {
  --           {
  --             type = "pwa-node",
  --             request = "launch",
  --             name = "Launch file",
  --             program = "${file}",
  --             cwd = "${workspaceFolder}",
  --           },
  --           {
  --             type = "pwa-node",
  --             request = "attach",
  --             name = "Attach",
  --             processId = require("dap.utils").pick_process,
  --             cwd = "${workspaceFolder}",
  --           },
  --         }
  --       end
  --     end
  --   end,
  -- },
}
