vim.g.mapleader = ' '
local keymap = vim.keymap
local kms = vim.keymap.set

-- MAP S&T TO J&K 
kms("n", "s", "k")
kms("v", "s", "k")
kms("n", "t", "j")
kms("v", "t", "j")

-- SEARCH
keymap.set("n", "<ENTER>", ":nohl<CR>")

-- WINDOWS
kms("n", "<leader>wr", "<C-w>v", { desc = "[W]indow [R]ight" }) 
kms("n", "<leader>wb", "<C-w>s", { desc = "[W]indow [B]elow" }) 
kms("n", "<leader>wc", "<C-w>q", { desc = "[W]indow [C]lose" }) 
kms("n", "<leader>we", "<C-w>=", { desc = "[W]indow [E]qualize" }) 

-- TABS
kms("n", "<leader>tn", ":tabnew<CR>", { desc = "[T]ab [N]ew" })
kms("n", "<leader>tc", ":tabclose<CR>", { desc = "[T]ab [C]lose" })
kms("n", "<leader>ts", ":tabnew %<CR>", { desc = "[T]ab [S]end Current File" })
kms("n", "<leader>tg", ":tabn<CR>", { desc = "Next Tab" })
kms("n", "<leader>gt", ":tabp<CR>", { desc = "Previous Tab" })


