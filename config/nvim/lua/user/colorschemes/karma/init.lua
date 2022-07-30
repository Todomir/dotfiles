vim.g.colors_name = "karma"

local pallete = {
	purple = "#AF98E6",
	blue = "#51C7DA",
	green = "#7BD88F",
	orange = "#fd9353",
	yellow = "#E3CF65",
	light_yellow = "#f5e17a",
	red = "#FC618D",
	gray = "#88898F",
	black = "#0a0e13",
	light_black = "#212729",
	white = "#F8F8F2",
}

require("colorscheme").setup({
	base00 = pallete.black,
	base01 = pallete.light_black,
	base02 = pallete.light_black,
	base03 = pallete.gray,
	base04 = pallete.gray,
	base05 = pallete.white,
	base06 = pallete.yellow,
	base07 = pallete.light_yellow,
	base08 = pallete.purple,
	base09 = pallete.purple,
	base0A = pallete.blue,
	base0B = pallete.yellow,
	base0C = pallete.orange,
	base0D = pallete.green,
	base0E = pallete.red,
	base0F = pallete.gray,
})
