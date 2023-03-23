local M = {}

function M.setup()
	local builtin = require("telescope.builtin")
	require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "env", ".git"} } }
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

return M
