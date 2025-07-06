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
    -- ADD THE CONFIG FUNCTION BELOW
    config = function()
      vim.diagnostic.config({
        virtual_text = true, -- Enable inline error messages
        signs = true,        -- Show icons in the sign column
        underline = true,    -- Underline the code with issues
        update_in_insert = false,
        severity_sort = true,
      })
    end,
    -- THE REST OF YOUR CONFIGURATION STAYS WITHIN `opts`
    opts = {
      -- This list MUST use the LSPCONFIG server names.
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
      },

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
