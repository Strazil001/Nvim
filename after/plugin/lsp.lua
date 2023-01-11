---@diagnostic disable: undefined-global
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
})

local cmp = require('cmp')
local cmp_select = { behaviorr = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	--sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.implementation() end, opts)
end)

lsp.setup()

vim.diagnostic.config(
	{
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = false,
		float = {
			focusable = false,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}
)
