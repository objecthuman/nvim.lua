local M = {}
function M.setup()
	require("Comment").setup({
		padding = true,
		sticky = true,
		ignore = nil,
		toggler = { line = "<leader>/", block = "<leader>-" },
		opleader = { line = "<leader>/", block = "<leader>-" },
		extra = { above = "gcO", below = "gco", eol = "gcA" },
		mappings = { basic = true, extra = true },
		pre_hook = nil,
		post_hook = nil,
	})
end

return M
