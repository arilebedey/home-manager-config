local comment = require("Comment")
local tscomment = require("ts_context_commentstring.integrations.comment_nvim")

comment.setup({
	pre_hook = tscomment.create_pre_hook(),
})

-- gc to comment
-- TODO: ROSTIANRSTIAORNSTIAHNSTihnr
--
