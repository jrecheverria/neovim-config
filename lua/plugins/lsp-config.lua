-- lsp-config.lua
return {
  {
    -- Mason: The installer
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  {
    -- mason-lspconfig: The bridge
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- This list MUST use the LSPCONFIG server names.
      -- The plugin will translate them to Mason package names automatically.
      ensure_installed = {
        "lua_ls",         -- Correct lspconfig name
        "rust_analyzer",  -- This name is the same for both
        "ts_ls",          -- Correct lspconfig name
      },

      -- The handlers section remains the same, it is the correct pattern.
      handlers = {
        function(server_name) -- server_name will be "lua_ls", "ts_ls", etc.
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          local on_attach = function(client, bufnr)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
          end

          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      },
    },
  },
}
