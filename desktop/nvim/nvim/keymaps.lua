vim.g.mapleader = ' '
-- local keymap = vim.keymap
local kms = vim.keymap.set

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
kms("n", "<leader>gt", ":tabp<CR>", { desc = "Previous Tab" })
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

-- SUBSTITUTE
