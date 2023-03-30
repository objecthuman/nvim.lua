-- local M = {}
--
-- function M.setup()
--   local lspconfig = require('lspconfig')
--   lspconfig.pyright.setup {}
--   lspconfig.tsserver.setup {}
--   lspconfig.clangd.setup {}
--   lspconfig.yamlls.setup {}
--
--   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--       -- delay update diagnostics
--       update_in_insert = true,
--     }
--   )
--
--
--   lspconfig.rust_analyzer.setup {
--     settings = {
--       ['rust-analyzer'] = {},
--     },
--   }
--
--
--   vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--   vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--   vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
--
--   vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--       vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--       local opts = { buffer = ev.buf }
--       vim.keymap.set('i', 'gD', vim.lsp.buf.declaration, opts)
--       vim.keymap.set('i', 'gd', vim.lsp.buf.definition, opts)
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--       vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--       vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--       vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--       vim.keymap.set('n', '<space>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       end, opts)
--       vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--       vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, opts)
--       vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, opts)
--       vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--       vim.keymap.set('n', '<space>f', function()
--         vim.lsp.buf.format { async = true }
--       end, opts)
--     end,
--   })
-- end
--
-- return M
local M = {}
function M.setup()
  local lsp = require("lsp-zero")


  lsp.preset("recommended")

  lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'pyright',
    'clangd',
    'yamlls',
  })



  -- local cmp = require('cmp')
  -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
  -- local cmp_mappings = lsp.defaults.cmp_mappings({
  --   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  --   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  --   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  --   ["<C-Space>"] = cmp.mapping.complete(),
  -- })

  -- cmp_mappings['<Tab>'] = nil
  -- cmp_mappings['<S-Tab>'] = nil

  -- lsp.setup_nvim_cmp({
  --   mapping = cmp_mappings
  -- })

  -- lsp.set_preferences({
  --   suggest_lsp_servers = false,
  --   sign_icons = {
  --     error = 'E',
  --     warn = 'W',
  --     hint = 'H',
  --     info = 'I'
  --   }
  -- })

  lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, opts)
  end)

  lsp.setup()

  vim.diagnostic.config({
    virtual_text = true
  })
end

return M
