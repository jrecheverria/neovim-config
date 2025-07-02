return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,
  config = function()
    vim.keymap.set("n", "<C-m>", ":Markview toggle", {})
  end
}
