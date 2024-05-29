local substitute = require("substitute")

substitute.setup()
local kms = vim.keymap.set

kms("n", "r", substitute.operator, { desc = "[Replace] with motion" })
kms("n", "rr", substitute.line, { desc = "[Replace] line" })
kms("n", "R", substitute.eol, { desc = "[Replace] to end of line" })
kms("x", "r", substitute.visual, { desc = "[Replace] in visual mode" })
