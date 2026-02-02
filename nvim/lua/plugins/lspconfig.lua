return {
  "lspcontainers/lspcontainers.nvim",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspcontainers = require("lspcontainers")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      ts_ls = {
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        container = "tsserver",
        root_markers = { "package.json", "tsconfig.json", ".git" },
      },
      eslint = {
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        container = "eslint",
        image = "lspcontainers/eslint-language-server",
        root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs", "package.json", ".git" },
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
      },
      lua_ls = {
        filetypes = { "lua" },
        container = "lua_ls",
        root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      },
    }

    local function start_lsp(buf)
      local ft = vim.bo[buf].filetype
      for name, server in pairs(servers) do
        if vim.tbl_contains(server.filetypes, ft) then
          if #vim.lsp.get_clients({ bufnr = buf, name = name }) == 0 then
            local root_dir = vim.fs.root(buf, server.root_markers) or vim.fn.getcwd()
            local cmd_opts = { root_dir = root_dir }
            if server.image then
              cmd_opts.image = server.image
            end
            vim.lsp.start({
              name = name,
              cmd = lspcontainers.command(server.container, cmd_opts),
              root_dir = root_dir,
              capabilities = capabilities,
              settings = server.settings,
              handlers = server.handlers,
              before_init = function(params)
                params.processId = vim.NIL
              end,
            })
          end
        end
      end
    end

    vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
      callback = function(ev)
        start_lsp(ev.buf)
      end,
    })
  end,
}
