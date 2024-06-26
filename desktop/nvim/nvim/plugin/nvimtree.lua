vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    -- local function opts(desc)
    --   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    -- end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.del('n', 's', { buffer = bufnr })

    -- your removals and mappings go here
end


require("nvim-tree").setup({
	on_attach = my_on_attach,
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
