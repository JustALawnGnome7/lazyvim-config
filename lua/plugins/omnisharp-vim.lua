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
  },
}
