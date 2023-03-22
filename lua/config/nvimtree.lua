local M = {}

function M.setup()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            number = true,
            relativenumber = true,
        },
        filters = {
            custom = { ".git" },
        },
    }
end

return M
