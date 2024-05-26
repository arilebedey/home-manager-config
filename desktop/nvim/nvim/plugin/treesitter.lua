-- Run :TSUpdate everytime you update the plugin/flake.
--

local treesitter = require("nvim-treesitter.configs")
 
treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	-- autotag enabled through "nvim-ts-autotag" plugin
	autotag = {
		enable = true
	},
	incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
	},
})
