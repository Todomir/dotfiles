local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tsserver" then
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({
				debug = false,
				disable_commands = false,
				enable_import_on_completion = false,

				-- import all
				import_all_timeout = 5000, -- ms
				-- lower numbers = higher priority
				import_all_priorities = {
					same_file = 1, -- add to existing import statement
					local_files = 2, -- git files or files with relative path markers
					buffer_content = 3, -- loaded buffer content
					buffers = 4, -- loaded buffer names
				},
				import_all_scan_buffers = 100,
				import_all_select_source = false,
				-- if false will avoid organizing imports
				always_organize_imports = true,

				-- filter diagnostics
				filter_out_diagnostics_by_severity = {},
				filter_out_diagnostics_by_code = {},

				-- update imports on file move
				update_imports_on_move = false,
				require_confirmation_on_move = false,
				watch_dir = nil,
			})

			ts_utils.setup_client(client)
		end
	end
	if server.name == "stylelint_lsp" then
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
