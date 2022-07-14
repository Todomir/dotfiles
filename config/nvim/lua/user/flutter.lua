local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	return
end

local M = {}

function M.setup()
	flutter_tools.setup({})
end

return M
