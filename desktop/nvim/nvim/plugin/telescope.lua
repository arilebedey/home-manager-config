local telescope = require('telescope')
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-s>"] = actions.move_selection_previous,
				["<C-t>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})

require('telescope').load_extension('fzf')

-- KEYMAPS
local kms = vim.keymap.set

kms("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "[F]uzzy find in CWD" })
kms("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "[F]uzzy find [R]ecent files" })
kms("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "[F]uzzy find [S]tring in CWD" })
kms("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "[F]uzzy find string under [C]ursor" })

-- TROUBLE INTEGRATION
-- You can easily open any search results in Trouble, by defining a custom action:
--
-- local actions = require("telescope.actions")
-- local open_with_trouble = require("trouble.sources.telescope").open
--
-- -- Use this to add more results without clearing the trouble list
-- local add_to_trouble = require("trouble.sources.telescope").add
--
-- local telescope = require("telescope")
--
-- telescope.setup({
--   defaults = {
--     mappings = {
--       i = { ["<c-t>"] = open_with_trouble },
--       n = { ["<c-t>"] = open_with_trouble },
--     },
--   },
