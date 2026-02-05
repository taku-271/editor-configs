return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      underline = true,
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      signs = true,
      severity_sort = true,
    })

    -- ts_lsと重複するeslintルールを除外（グローバルハンドラーで処理）
    local eslint_diagnostic_filter = {
      ["no-unused-vars"] = true,
      ["@typescript-eslint/no-unused-vars"] = true,
      ["no-undef"] = true,
      ["no-redeclare"] = true,
      ["@typescript-eslint/no-redeclare"] = true,
    }

    local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if client and client.name == "eslint" then
        result.diagnostics = vim.tbl_filter(function(d)
          return not eslint_diagnostic_filter[d.code]
        end, result.diagnostics)
      end
      return original_handler(err, result, ctx, config)
    end

    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
    })

vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    })

    vim.lsp.config("eslint", {
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      settings = {
        validate = "on",
        run = "onType",
        format = true,
        quiet = false,
        workingDirectory = { mode = "auto" },
        codeAction = {
          disableRuleComment = { enable = true, location = "separateLine" },
          showDocumentation = { enable = true },
        },
      },
      handlers = {
        ["eslint/confirmESLintExecution"] = function()
          return 4 -- approve
        end,
        ["eslint/noLibrary"] = function()
          vim.notify("ESLint library not found.", vim.log.levels.WARN)
          return {}
        end,
        ["eslint/openDoc"] = function(_, result)
          if result then
            vim.ui.open(result.url)
          end
          return {}
        end,
        ["eslint/probeFailed"] = function()
          vim.notify("ESLint probe failed.", vim.log.levels.WARN)
          return {}
        end,
      },
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.enable({ "ts_ls", "eslint", "lua_ls" })
  end,
}
