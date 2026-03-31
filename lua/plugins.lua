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
		{ "catppuccin/nvim",      name = "catppuccin" },
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
		{ "nvimtools/none-ls.nvim" },
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
		{ "mason-org/mason.nvim" },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
		},
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
		},
		{
			"NickvanDyke/opencode.nvim",
			dependencies = {
				-- Recommended for `ask()` and `select()`.
				-- Required for `snacks` provider.
				---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
				{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
			},
			config = function()
				---@type opencode.Opts
				vim.g.opencode_opts = {
					-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
				}

				-- Required for `opts.events.reload`.
				vim.o.autoread = true

				-- Recommended/example keymaps.
				vim.keymap.set({ "n", "x" }, "<C-c>",
					function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
				vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
					{ desc = "Execute opencode action…" })
				vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,
					{ desc = "Toggle opencode" })

				vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
					{ desc = "Add range to opencode", expr = true })
				vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
					{ desc = "Add line to opencode", expr = true })

				vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
					{ desc = "Scroll opencode up" })
				vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
					{ desc = "Scroll opencode down" })

				-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
				vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
				vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
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
	require("config.completion").setup()
end

return R
