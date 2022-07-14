local M = {}

M.setup = function()
	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_colors = {
		none = "NONE",
		bg_dark = "#000000",
		bg = "#000000",
		bg_highlight = "#292e42",
		terminal_black = "#000000",
		fg = "#c0caf5",
		fg_dark = "#a9b1d6",
		fg_gutter = "#3b4261",
		dark3 = "#545c7e",
		comment = "#565f89",
		dark5 = "#737aa2",
		blue0 = "#3396cc1",
		blue = "#51C7DA",
		cyan = "#7dcfff",
		blue1 = "#2ac3de",
		blue2 = "#0db9d7",
		blue5 = "#89ddff",
		blue6 = "#B4F9F8",
		blue7 = "#394b70",
		magenta = "#bb9af7",
		magenta2 = "#ff007c",
		purple = "#9d7cd8",
		orange = "#ff9e64",
		yellow = "#e0af68",
		green = "#9ece6a",
		green1 = "#73daca",
		green2 = "#41a6b5",
		teal = "#1abc9c",
		red = "#f7768e",
		red1 = "#db4b4b",
		git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
		gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
	}
end

return M
