local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local config = require("user.lsp.null-ls.formatting")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	formatting.stylua,

	-- eslint config
	diagnostics.eslint_d,
	code_actions.eslint_d,
	formatting.eslint_d.with({
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	}),
	formatting.prettier,
}

null_ls.setup({
	debug = false,
	sources = sources,

	on_attach = function(client, buf)
		config.setup(client, buf)
	end,
})
