vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")
-- add relative line numbers

vim.opt.relativenumber = true

vim.cmd([[
  augroup AutoRead
    autocmd!
    autocmd FocusGained,BufEnter * silent! checktime
  augroup END
]])

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  command = 'checktime',
})

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  pattern = '*',
  callback = function()
    vim.notify('File reloaded: ' .. vim.fn.expand('%'), vim.log.levels.INFO)
  end,
})

