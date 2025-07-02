return {
  'akinsho/toggleterm.nvim',
  version = "*",
  -- Change `config = true` to a function to add your custom setup
  config = function()
    require('toggleterm').setup({
      -- You can customize the setup here, for example:
      direction = 'float', -- Open as a floating window
      open_mapping = [[<c-t>]], -- This is the main keymap to open/close the terminal
      start_in_insert = true, -- Start in insert mode
      close_on_exit = true,   -- Close the terminal window when the process exits
    })

    -- This is a helper function to set keymaps specifically for when the terminal is open
    function _G.set_terminal_keymaps()
      -- Use <esc> to go back to normal mode from terminal mode
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
    end

    -- Run the helper function when a terminal window is opened
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        set_terminal_keymaps()
      end,
    })

    -- Set the main keybinding to toggle the terminal
    -- The <c-t> here should match the 'open_mapping' in the setup table above.
    -- Or you can set a different one here.
    vim.keymap.set('n', '<c-t>', '<cmd>ToggleTerm<CR>', {
      noremap = true,
      silent = true,
      desc = "Toggle terminal"
    })
  end,
}
