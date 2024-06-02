local autosession = require("auto-session")

autosession.setup({
	auto_retore_enabled = nil,
	auto_save_enabled = nil,
	log_level = "error",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/home/ari/Information/sessions/",
	auto_session_enabled = false,
	auto_session_use_git_branch = true,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
})
