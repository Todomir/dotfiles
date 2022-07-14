local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local nls_sources = require("null-ls.sources")
local method = require("null-ls").methods.FORMATTING

function M.setup(client, bufnr)
	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
	local enable = false

	if M.has_formatter(filetype) then
		enable = client.name == "null-ls"
	else
		enable = not (client.name == "null-ls")
	end

	client.resolved_capabilities.document_formatting = enable
	client.resolved_capabilities.document_range_formatting = enable

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_sync()
			end,
		})
	end
end

function M.has_formatter(filetype)
	local available = nls_sources.get_available(filetype, method)
	return #available > 0
end

return M
