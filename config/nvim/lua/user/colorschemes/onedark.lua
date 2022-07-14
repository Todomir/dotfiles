local status_ok, onedark = pcall(require, "onedarkpro")
if not status_ok then
	return
end

local M = {}

M.setup = function()
	onedark.setup({
		dark_theme = "onedark_dark", -- The default dark theme
		light_theme = "onelight", -- The default light theme
		plugins = { -- Override which plugins highlight groups are loaded
			native_lsp = true,
			polygot = true,
			treesitter = true,
		},
		styles = {
			strings = "NONE", -- Style that is applied to strings
			comments = "italic", -- Style that is applied to comments
			keywords = "bold,italic", -- Style that is applied to keywords
			functions = "NONE", -- Style that is applied to functions
			variables = "NONE", -- Style that is applied to variables
			virtual_text = "NONE", -- Style that is applied to virtual text
		},
		options = {
			bold = true, -- Use the themes opinionated bold styles?
			italic = true, -- Use the themes opinionated italic styles?
			underline = true, -- Use the themes opinionated underline styles?
			undercurl = true, -- Use the themes opinionated undercurl styles?
			cursorline = true, -- Use cursorline highlighting?
			transparency = false, -- Use a transparent background?
			terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
			window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
		},
		colors = {
			purple = "#AF98E6",
			blue = "#51C7DA",
			green = "#7BD88F",
			orange = "#fd9353",
			yellow = "#E3CF65",
			red = "#FC618D",
			gray = "#88898F",
		},
		hlgroups = {
			Constant = { fg = "${purple}" }, -- a constant: nil, true, false, or 'hello world'
			String = { fg = "${yellow}" }, -- a string constant: "hello world"
			Character = { fg = "${yellow}" }, -- a character constant: 'c'
			Number = { fg = "${purple}" }, -- a number constant: 234, 0xff
			Boolean = { fg = "${purple}" }, -- a boolean constant: TRUE, false
			Float = { fg = "${purple}" }, -- a floating point constant: 2.3e10
			Identifier = { fg = "${purple}" },
			Function = { fg = "${green}" }, -- a function: function() end
			Statement = { fg = "${blue}" },
			Conditional = { fg = "${red}" },
			Repeat = { fg = "${red}" },
			Label = { fg = "${red}" },
			Operator = { fg = "${red}" },
			Keyword = { fg = "${blue}" }, -- a keyword: if, else, while, etc.
			Exception = { fg = "${red}" }, -- an exception: catch, finally, throw
			Special = { fg = "${red}" }, -- a special: __index, __newindex, __call, etc.
			SpecialChar = { fg = "${purple}" }, -- a special character: ., :, etc.
			PreProc = { fg = "${purple}" }, -- a preprocessor: #include, #define, #if, #end, etc.

			TSInclude = { fg = "${red}" },
			TSVariable = { fg = "${white}" },
			TSField = { fg = "${green}" },
			TSProperty = { fg = "${green}" },
			TSKeyword = { fg = "${red}" }, -- a keyword: if, else, while, etc.
			TSKeywordFunction = { fg = "${blue}" },
			TSFunction = { fg = "${green}" },
			TSFuncBuiltin = { fg = "${blue}" },
			TSParameter = { fg = "${orange}" },
			TSType = { fg = "${blue}" },
			TSConstant = { fg = "${purple}" }, -- a constant: nil, true, false, or 'hello world'
			TSString = { fg = "${yellow}" }, -- a string constant: "hello world"
			TSCharacter = { fg = "${yellow}" }, -- a character constant: 'c'
			TSNumber = { fg = "${purple}" }, -- a number constant: 234, 0xff
			TSBoolean = { fg = "${purple}" }, -- a boolean constant: TRUE, false
			TSFloat = { fg = "${purple}" }, -- a floating point constant: 2.3e10
			TSIdentifier = { fg = "${purple}" },
			TSStatement = { fg = "${blue}" },
			TSConditional = { fg = "${red}" },
			TSRepeat = { fg = "${red}" },
			TSLabel = { fg = "${red}" },
			TSOperator = { fg = "${red}" },
			TSException = { fg = "${red}" }, -- an exception: catch, finally, throw
			TSSpecial = { fg = "${red}" }, -- a special: __index, __newindex, __call, etc.
			TSSpecialChar = { fg = "${purple}" }, -- a special character: ., :, etc.
			TSTag = { fg = "${red}" },
			TSTagAttribute = { fg = "${blue}" },
			TSPunctDelimiter = { fg = "${gray}" },
			TSPunctSpecial = { fg = "${red}" },
			TSConstructor = { fg = "${blue}" },
			TSTypeBuiltin = { fg = "${blue}" },
			typescriptBlock = { fg = "${blue}" },
			typescriptIdentifierName = { fg = "${purple}" },
			typescriptProp = { fg = "${white}" },
			typescriptConditionalParen = { fg = "${orange}" },
			typescriptObjectDestructure = { fg = "${purple}" },
			typescriptDestructureVariable = { fg = "${purple}" },
			typescriptObjectLabel = { fg = "${white}" },
			typescriptFuncName = { fg = "${green}" },
			tsxTagName = { fg = "${blue}" },
			tsxAtrib = { fg = "${green}" },
		},
	})
	onedark.load()
end

return M
