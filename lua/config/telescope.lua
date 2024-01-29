local M = {}

function M.setup()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			file_ignore_patterns = { "node_modules", "env", ".git" },
			previewer = {
				split = true,
				split_direction = "left",
			},
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
				},
			},
		},
	})
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	vim.keymap.set("n", "<leader>fb", builtin.git_branches, {})
	vim.keymap.set("n", "<leader>fs", builtin.git_status, {})
	vim.keymap.set("n", "<leader>df", builtin.lsp_dynamic_workspace_symbols, {})
end

return M
