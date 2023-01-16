local custom_cat = require 'lualine.themes.catppuccin'

-- Change the background of lualine_x section for normal mode
custom_cat.normal.a.bg = '#afb4fe'
custom_cat.normal.b.bg = '#313244'
custom_cat.normal.b.fg = '#b4befe'

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

require('lualine').setup {

	options = {
		icons_enabled = true,
		theme = custom_cat,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},

	sections = {
		lualine_a = {
			{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { 'encoding', 'fileformat', 'filetype', 'progress', 'location' },
		lualine_z = { { getLspName } }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
