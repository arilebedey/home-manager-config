vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup({
	view = {
		width = 35,
		relativenumber = true,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	filters = {
		custom = { ".DS_Store" },
	},
	git = {
		ignore = false,
	},
})

-- KEYMAPS

local kms = vim.keymap.set

kms("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
kms("n", "<C-f>w", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "[F]ile explorer on [W]ord" })
kms("n", "<C-f>r", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ile explorer [R]efresh" })
-- kms("n", "<leader>en", "<cmd>NvimTreeToggle<CR>", { desc = "[F]ile explorer" })
-- kms("n", "<leader>ew", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "[F]ile explorer on [W]ord" })
-- kms("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ile explorer [R]efresh" })
kms("n", "s", "j", { desc = "[F]ile explorer [Refresh" })
