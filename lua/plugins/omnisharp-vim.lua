-- disable this spec file as "omnisharp-vim" has been moved to lspconfig.lua
if true then return {} end

return {
  {
    "OmniSharp/omnisharp-vim",
    ft = "cs",
    config = function()
      vim.cmd([[
        let g:OmniSharp_server_use_net6 = 1
        let g:OmniSharp_server_stdio = 1
        let g:OmniSharp_server_path = "/home/miles/.local/share/nvim/mason/bin/omnisharp"
      ]])
    end,
    init = function ()
      require("lazyvim.util").on_attach(function(client, _)
        if client.name == 'omnisharp' then
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
      end)
    end,
  },
}
