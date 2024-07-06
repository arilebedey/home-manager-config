vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
local autosession = require("auto-session")

autosession.setup({
	auto_session_enabled = true,
	auto_retore_enabled = false,
	auto_save_enabled = false,
	log_level = "error",
	auto_session_enable_last_session = false, -- Loads the last loaded session if session for cwd does not exist
	-- auto_session_root_dir = vim.fn.stdpath("data") .. "/home/ari/Information/sessions/",
	session_lens = {
		-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
		buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
		load_on_setup = true,
		theme_conf = { border = true },
		previewer = false,
	},
})

-- is further implemented with (see comment) 1. lualine 2. telescope
