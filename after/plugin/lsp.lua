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

vim.o.updatetime = 50

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.implementation() end, opts)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
end)

lsp.setup()

vim.diagnostic.config(
	{
		virtual_text = false,
		signs = true,
		update_in_insert = true,
		underline = true,
		severity_sort = false,
		float = {
			focusable = false,
			style = 'full',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}
)
