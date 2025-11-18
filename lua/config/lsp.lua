local M = {}

function M.setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"rust_analyzer",
			"pyright",
			"clangd",
			"yamlls",
		},
	})

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = true,
	})


	vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
	vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	vim.keymap.set('n', 'T', '<cmd>lua vim.diagnostic.open_float()<cr>')

	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(event)
			local bufmap = function(mode, lhs, rhs)
				vim.keymap.set(mode, lhs, rhs, { buffer = event.buf })
			end

			bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
			bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
			bufmap('n', 'gv', '<cmd>lua vim.lsp.buf.definition()<cr>')
			bufmap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>')
			bufmap('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>')
			bufmap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
			bufmap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>')
			bufmap('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
			bufmap({ 'i', 's' }, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

			bufmap('n', '<leader>vws', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>')
			bufmap('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
			bufmap('n', '<leader>vrr', '<cmd>lua vim.lsp.buf.references()<cr>')
			bufmap('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>')
			bufmap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
			bufmap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
			bufmap('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		end,
	})
end

return M
