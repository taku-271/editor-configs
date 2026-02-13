return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "ts_ls", "eslint", "lua_ls", "pyright" },
    })
    local registry = require("mason-registry")
    local ensure_tools = { "eslint_d" }
    for _, tool in ipairs(ensure_tools) do
      if not registry.is_installed(tool) then
        registry.get_package(tool):install()
      end
    end
  end,
}
