local status_ok, catp = pcall(require, "catppuccin")
if not status_ok then
	return
end

local M = {}

M.setup = function()
	catp.setup({
		transparent_background = false,
		term_colors = true,
		styles = {
			comments = "italic",
			conditionals = "italic",
			loops = "NONE",
			functions = "NONE",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
			numbers = "NONE",
			booleans = "NONE",
			properties = "NONE",
			types = "NONE",
			operators = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "NONE",
					hints = "NONE",
					warnings = "NONE",
					information = "NONE",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			cmp = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = false,
				transparent_panel = false,
			},
			which_key = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			ts_rainbow = false,
			hop = true,
			notify = true,
			telekasten = true,
			symbols_outline = true,
		},
	})

	vim.g.catppuccin_flavour = "dusk"

	catp.load()
end

return M
