local R = {}

function R.setup()
	local cmp = require("cmp")

	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
		},
		select = { behavior = cmp.SelectBehavior.Select },
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<Tab>"] = nil,
			["<S-Tab>"] = nil,
		}),
	})
end

return R
