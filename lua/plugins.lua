local R = {}

function R.setup()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end

    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        { 'folke/tokyonight.nvim' },
        { 'ellisonleao/gruvbox.nvim' },
        { 'nvim-lualine/lualine.nvim' },
        { 'windwp/nvim-autopairs' },
        { 'numToStr/Comment.nvim' },
        { 'olimorris/onedarkpro.nvim' },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            'nvim-tree/nvim-tree.lua',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        {
            'nvim-neo-tree/neo-tree.nvim',
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            }
        },
        { 'neovim/nvim-lspconfig' },
        { 'nvim-treesitter/nvim-treesitter', setup = ":TSUpdate" },
		{'numToStr/Navigator.nvim'},
		{'jose-elias-alvarez/null-ls.nvim'},
		{'github/copilot.vim'},

    })

    require('lualine').setup()
    -- require("config.nvimtree").setup()
    require('config.neotree').setup()
    require("config.autoparis").setup()
    require("config.telescope").setup()
    require("config.comment").setup()
    require("config.lsp").setup()
	require("config.navigator").setup()
	require("config.nullls").setup()
end

return R
