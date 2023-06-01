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
        -- if client.name == "omnisharp" then
        --   client.server_capabilities.semanticTokensProvider = {
        --     full = vim.empty_dict(),
        --     legend = {
        --       tokenModifiers = { "static_symbol" },
        --       tokenTypes = {
        --         "comment",
        --         "excluded_code",
        --         "identifier",
        --         "keyword",
        --         "keyword_control",
        --         "number",
        --         "operator",
        --         "operator_overloaded",
        --         "preprocessor_keyword",
        --         "string",
        --         "whitespace",
        --         "text",
        --         "static_symbol",
        --         "preprocessor_text",
        --         "punctuation",
        --         "string_verbatim",
        --         "string_escape_character",
        --         "class_name",
        --         "delegate_name",
        --         "enum_name",
        --         "interface_name",
        --         "module_name",
        --         "struct_name",
        --         "type_parameter_name",
        --         "field_name",
        --         "enum_member_name",
        --         "constant_name",
        --         "local_name",
        --         "parameter_name",
        --         "method_name",
        --         "extension_method_name",
        --         "property_name",
        --         "event_name",
        --         "namespace_name",
        --         "label_name",
        --         "xml_doc_comment_attribute_name",
        --         "xml_doc_comment_attribute_quotes",
        --         "xml_doc_comment_attribute_value",
        --         "xml_doc_comment_cdata_section",
        --         "xml_doc_comment_comment",
        --         "xml_doc_comment_delimiter",
        --         "xml_doc_comment_entity_reference",
        --         "xml_doc_comment_name",
        --         "xml_doc_comment_processing_instruction",
        --         "xml_doc_comment_text",
        --         "xml_literal_attribute_name",
        --         "xml_literal_attribute_quotes",
        --         "xml_literal_attribute_value",
        --         "xml_literal_cdata_section",
        --         "xml_literal_comment",
        --         "xml_literal_delimiter",
        --         "xml_literal_embedded_expression",
        --         "xml_literal_entity_reference",
        --         "xml_literal_name",
        --         "xml_literal_processing_instruction",
        --         "xml_literal_text",
        --         "regex_comment",
        --         "regex_character_class",
        --         "regex_anchor",
        --         "regex_quantifier",
        --         "regex_grouping",
        --         "regex_alternation",
        --         "regex_text",
        --         "regex_self_escaped_character",
        --         "regex_other_escape",
        --       },
        --     },
        --     range = true,
        --   }
        -- end

        local function toSnakeCase(str)
          return string.gsub(str, "%s*[- ]%s*", "_")
        end

        if client.name == 'omnisharp' then
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
    -- dependencies = {
    --   "Hoffs/omnisharp-extended-lsp.nvim",
    -- }
  },
  --{
  --  "Hoffs/omnisharp-extended-lsp.nvim",
  --  lazy = false,
  --  config = function()
  --    local pid = vim.fn.getpid()
  --    -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
  --    --local omnisharp_bin = "/path/to/omnisharp-repo/run"
  --    local omnisharp_bin = "/home/miles/.local/share/nvim/mason/bin/omnisharp"
  --    -- on Windows
  --    -- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"

  --    local config = {
  --      handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler, },
  --      cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  --    }

  --    --require("lspconfig").omnisharp.setup(config)
  --    require("lspconfig").omnisharp.setup(config)
  --  end,
  --},
}
