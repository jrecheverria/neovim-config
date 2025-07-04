return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- This is the key setting
					leave_dirs_open = false, -- Optional: closes unused directories
				},
			},
			window = {
				position = "left",
				width = 30,
			},
		})

		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>', {})
	end,
}
