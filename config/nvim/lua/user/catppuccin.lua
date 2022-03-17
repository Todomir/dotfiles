local catp = require("catppuccin")
local M = {}

M.setup = function()
	catp.setup({
		transparent_background = true,
		term_colors = true,
		styles = {
			functions = "NONE",
			variables = "NONE",
		},
		integrations = {
			gitsigns = true,
			telescope = true,
			treesitter = true,
			cmp = true,
			nvimtree = {
				enabled = true,
				show_root = false,
			},
			native_lsp = {
				enabled = true,
			},
			ts_rainbow = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
		},
	})

	catp.load()
end

return M
