local M = {}

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Up"))
	vim.keymap.set("n", "<leader>o", api.node.open.preview, opts("Up"))
	vim.keymap.set("n", "<leader>s", api.node.open.vertical, opts("Up"))
	vim.keymap.set("n", "<leader>h", api.node.open.horizontal, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

function M.setup()
	require("nvim-tree").setup({
		disable_netrw = true,
		on_attach = on_attach,
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
		filters = {
			git_ignored = true,
			dotfiles = false,
			git_clean = false,
			no_buffer = false,
			no_bookmark = false,
			custom = { "\\.git$", "node_modules" },
			exclude = {},
		},
		update_focused_file = {
			enable = true,
			update_root = false,
			ignore_list = {},
		},
	})
end

return M
