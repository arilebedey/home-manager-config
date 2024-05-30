-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- TYPESCRIPT
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
}
-- To configure typescript language server, add a tsconfig.json or jsconfig.json to the root of your project.
--
-- Here's an example that disables type checking in JavaScript files.
--
-- {
--   "compilerOptions": {
--     "module": "commonjs",
--     "target": "es6",
--     "checkJs": false
--   },
--   "exclude": [
--     "node_modules"
--   ]
-- }

-- HTML
require'lspconfig'.html.setup{
  capabilities = capabilities,
}
-- TODO: Integrate with luasnip
--
-- --Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- require'lspconfig'.html.setup {
--   capabilities = capabilities,
-- }

-- CSS
-- TODO: Integrate with luasnip
--
-- --Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- TAILWINDCSS
require'lspconfig'.tailwindcss.setup{
  capabilities = capabilities,
}

-- PYTHON
require'lspconfig'.pyright.setup{
  capabilities = capabilities,
}


local keymap = vim.keymap -- for conciseness

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = ev.buf, silent = true }

	-- set keybinds
	opts.desc = "Show [L]SP [R]eferences"
	keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

	opts.desc = "Go to declaration"
	keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts) -- go to declaration

	-- Where in the project it is defined
	opts.desc = "Show [L]SP [D]efinitions"
	keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

	opts.desc = "Show [L]SP [I]mplementations"
	keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

	opts.desc = "Show [L]SP [T]ype definitions"
	keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

	opts.desc = "See available [L]SP code [A]ctions"
	keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

	-- Should work renaming vars in whole project
	opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

	opts.desc = "Show line [DD]iagnostics"
	keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts) -- show diagnostics for line

	opts.desc = "[D]iagnostic [P]revious"
	keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

	opts.desc = "[D]iagnostic [N]ext"
	keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})


