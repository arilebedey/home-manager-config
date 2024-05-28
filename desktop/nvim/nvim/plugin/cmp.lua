local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  completion = {
	completeopt = "menu,menuone,preview,noselect",
  },
  snippet = { -- configure how nvim-cmp interacts with snippet engine
	expand = function(args)
	  luasnip.lsp_expand(args.body)
	end,
  },
  mapping = cmp.mapping.preset.insert({
	["<C-s>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	["<C-t>"] = cmp.mapping.select_next_item(), -- next suggestion
	["<C-z>"] = cmp.mapping.scroll_docs(-4),
	["<C-x>"] = cmp.mapping.scroll_docs(4),
	["<C-Enter>"] = cmp.mapping.complete(), -- show completion suggestions
	["<C-e>"] = cmp.mapping.abort(), -- close completion window
	["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
	{ name = "nvim_lsp"},
	{ name = "luasnip" }, -- snippets
	{ name = "buffer" }, -- text within current buffer
	{ name = "path" }, -- file system paths
  }),

  -- configure lspkind for vs-code like pictograms in completion menu
  formatting = {
	format = lspkind.cmp_format({
	  maxwidth = 50,
	  ellipsis_char = "...",
	}),
  },
})
