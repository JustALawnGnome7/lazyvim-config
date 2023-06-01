return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      omnisharp = {
        settings = {
         omnisharp = {
            --useModernNet = false,
            --enableEditorConfigSupport = false,
            enableDecompilationSupport = true,
          },
        }
      }
    },
  },
}
