vim.g.colors_name = "oh-lucy"

local pallete = {
	Purple = "#AE75FF",
	Magenta = "#AF98E6",
	Pink = "#FF79C6",
	Red = "#FC618D",
	Orange = "#FD9353",
	Yellow = "#E3CF65",
	Green = "#7BD88F",
	Cyan = "#8BE9FD",
	Blue = "#51C7DA",
	Black = "#1A1D26",
	Blackish = "#24272B",
	Gray = "#88898F",
	White = "#F8F8F2",
}

require("config.colorscheme").setup({
	base00 = pallete.Black,
	base01 = pallete.Blackish,
	base02 = pallete.Blackish,
	base03 = pallete.Gray,
	base04 = pallete.Gray,
	base05 = pallete.White,
	base06 = pallete.Yellow,
	base07 = pallete.Cyan,
	base08 = pallete.Magenta,
	base09 = pallete.Purple,
	base0A = pallete.Blue,
	base0B = pallete.Yellow,
	base0C = pallete.Orange,
	base0D = pallete.Green,
	base0E = pallete.Red,
	base0F = pallete.Gray,
})
