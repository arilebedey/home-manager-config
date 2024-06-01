vim.g.mapleader = " "
-- local keymap = vim.keymap
local kms = vim.keymap.set

-- MISC
kms("n", "vV", "Vp")

-- FILES
kms("n", "<leader>ia", ":wq<CR>")
kms("n", "<leader>ii", ":w<CR>")
kms("n", "<leader>,,", ":qa<CR>")
kms("n", "<leader>,u", ":q!<CR>")

-- MAP S&T TO J&K
kms("n", "s", "k")
kms("v", "s", "k")
kms("n", "t", "j")
kms("v", "t", "j")

-- SEARCH
kms("n", "<ENTER>", ":nohl<CR>")

-- WINDOWS
kms("n", "<leader>wl", "<C-w>v", { desc = "[W]indow [L]eft" })
kms("n", "<leader>wb", "<C-w>s", { desc = "[W]indow [B]elow" })
kms("n", "<leader>wc", "<C-w>q", { desc = "[W]indow [C]lose" })
kms("n", "<leader>we", "<C-w>=", { desc = "[W]indow [E]qualize" })
-- VIM-MAXIMIZER
kms("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", { desc = "[S]et window to [M]aximized" })

-- TABS
kms("n", "<leader>tn", ":tabnew<CR>", { desc = "[T]ab [N]ew" })
kms("n", "<leader>tc", ":tabclose<CR>", { desc = "[T]ab [C]lose" })
kms("n", "<leader>ts", ":tabnew %<CR>", { desc = "[T]ab [S]end Current File" })
kms("n", "<leader>tg", ":tabn<CR>", { desc = "Next Tab" })
kms("n", "gp", ":tabp<CR>", { desc = "Previous Tab" })

-- AUTO-SESSION
kms("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "[S]ession [R]estore" })
kms("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "[S]ession [S]ave" })
kms("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "[S]ession [D]elete" })

-- TELESCOPE KEYMAPS
kms("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "[F]uzzy find in CWD" })
kms("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "[F]uzzy find [R]ecent files" })
kms("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "[F]uzzy find [S]tring in CWD" })
kms("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "[F]uzzy find string under [C]ursor" })
kms("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "[F]uzzy find [P]rojects" })
-- TODO
kms("n", "<leader>cs", "<cmd>TodoTelescope<CR>", { desc = "TOOD [C]omment [S]ee list" })

-- TROUBLE
kms("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Open/close trouble list" })
kms("n", "<leader>xp", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open diagnostics for [P]roject" })
kms("n", "<leader>xb", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open diagnostics for [B]uffer" })
kms("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open trouble quickfix list" })
kms("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Open trouble location list" })
kms("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Open [T]odos in trouble" })

-- LINTING
vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- GITSIGNS
-- https://youtu.be/6pAG3BHurdM?si=0cFeblgQBqFi52h3&t=4924
local gs = package.loaded.gitsigns
kms("n", "<leader>gn", gs.next_hunk, { desc = "Github [N]ext Hunk" })
kms("n", "<leader>gp", gs.prev_hunk, { desc = "Github [P]rev Hunk" })
kms("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
kms("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
kms("v", "<leader>gs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
kms("v", "<leader>hr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

kms("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
kms("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })

kms("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })

kms("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })

kms("n", "<leader>hb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame line" })
kms("n", "<leader>hB", gs.toggle_current_line_blame, { desc = "Toggle line blame" })

kms("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
kms("n", "<leader>hD", function()
	gs.diffthis("~")
end, { desc = "Diff this ~" })

-- Text object
kms({ "o", "x" }, "h", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
