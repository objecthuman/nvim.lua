local M = {}

function M.setup()
	require('telescope').load_extension('neoclip')
	require("neoclip").setup()
end

return M
