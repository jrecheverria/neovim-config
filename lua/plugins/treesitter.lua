return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensured_installed = { "rust", "typescript", "bash", "lua", "markdown", "python" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
