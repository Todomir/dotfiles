local M = {}

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local null_ls_utils_status_ok, null_ls_utils = pcall(require, "null-ls.utils")
if not null_ls_utils_status_ok then
	return
end

local config = require("user.lsp.null-ls.formatting")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

M.setup = function()
	local eslint_config_files = { ".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc" }
	local prettier_filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
		"astro",
	}

	local sources = {
		-- js/ts config
		formatting.prettierd.with({
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("$HOME/.config/nvim/.prettierrc.json"),
			},
			filetypes = prettier_filetypes,
		}),
		diagnostics.eslint_d.with({
			diagnostics_format = "#{m} [#{c}]",
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			condition = function(utils)
				return utils.root_has_file(eslint_config_files)
			end,
		}),
		code_actions.eslint_d.with({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			condition = function(utils)
				return utils.root_has_file(eslint_config_files)
			end,
		}),
		formatting.eslint_d.with({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			condition = function(utils)
				return utils.root_has_file(eslint_config_files)
			end,
		}),

		-- lua config
		formatting.stylua,

		-- stylelint config
		formatting.stylelint.with({
			extra_args = {
				"--config",
				vim.fn.expand("$HOME/.config/nvim/.stylelintrc.js"),
			},
		}),
	}

	null_ls.setup({
		sources = sources,
		debounce = 200,
		debug = true,
		root_dir = null_ls_utils.root_pattern({ ".git", "package.json" }),
		on_attach = function(client, bufnr)
			config.setup(client, bufnr)
		end,
	})
end

return M
