local autopairs = require("nvim-autopairs")

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter node
		javascript = { "template_string" }, -- don't add pairs in js template_string treesitter node
		java = false, -- don't check treesitter on java
	}
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
