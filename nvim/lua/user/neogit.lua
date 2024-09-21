require("diffview").setup({
	use_icons = false,
})

require("neogit").setup({
	disable_hint = true,
	auto_refresh = false,
	integrations = { diffview = true },
	signs = {
		section = { "»", "-" },
		item = { "+", "*" },
	},
	mappings = {
		status = {
			[";"] = "RefreshBuffer",
		},
	},
})
