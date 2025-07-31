local R = {}

function R.setup()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end

	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		{ "catppuccin/nvim", name = "catppuccin" },
		{ "windwp/nvim-autopairs" },
		{ "numToStr/Comment.nvim" },
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.4",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{ "neovim/nvim-lspconfig" },
		{ "nvim-treesitter/nvim-treesitter", setup = ":TSUpdate" },
		{ "nyngwang/NeoZoom.lua" },
		{ "numToStr/Navigator.nvim" },
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
		{ "onsails/lspkind.nvim" },
		{ "hrsh7th/vim-vsnip" },
		{ "danymat/neogen" },
		{ "VonHeikemen/lsp-zero.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
		},
		{
			"greggh/claude-code.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim", -- Required for git operations
			},
			config = function()
				require("claude-code").setup()
			end,
		},

		checker = { enabled = true },
	})

	require("mason").setup()
	require("config.autoparis").setup()
	require("config.telescope").setup()
	require("config.comment").setup()
	require("config.lsp").setup()
	require("config.navigator").setup()
	require("config.nullls").setup()
	require("config.icons")
	require("config.neozoom").setup()
	require("config.catppuccin").setup()
	require("config.nvimtree").setup()
	require("config.treesitter").setup()
end

return R
