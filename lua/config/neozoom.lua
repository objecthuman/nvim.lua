local M = {}


 M.setup = function () 
    require('neo-zoom').setup {
      winopts = {
        offset = {
          -- NOTE: you can omit `top` and/or `left` to center the floating window.
          -- top = 0,
          -- left = 0.17,
          width = 150,
          height = 0.85,
        },
        -- NOTE: check :help nvim_open_win() for possible border values.
        -- border = 'double',
      },
      -- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
      exclude_buftypes = { 'terminal' },
      presets = {
        {
          filetypes = { 'dapui_.*', 'dap-repl' },
          config = {
            top = 0.25,
            left = 0.6,
            width = 0.4,
            height = 0.65,
          },
          callbacks = {
            function () vim.wo.wrap = true end,
          },
        },
      },
    }
    vim.keymap.set('n', '<CR>', function () vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })

end

return M
