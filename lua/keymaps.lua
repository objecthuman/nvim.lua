vim.g.mapleader = ' '

vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save' })
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>q!<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':NeoTreeFocusToggle<CR>', {  silent = false })
vim.keymap.set('n', '<leader>o', ':NeoTreeFocus<CR>', {  silent = true })

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format);

vim.api.nvim_set_keymap('i', '<C-x>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

vim.g['copilot_no_tab_map'] = true
vim.g['copilot_assume_mapped'] = true
