local autosession = require("auto-session")

autosession.setup({
	auto_retore_enabled = false,
	auto_session_suppress_dirs = { },
})

local kms = vim.keymap.set

kms("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "[W]ork session [R]estore" })
kms("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "[W]ork session [S]ave" })
