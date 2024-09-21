local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- Tab toggles selection and moves to the next item across all pickers
				["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
				-- Enter performs the default action (open file in all pickers)
				["<CR>"] = actions.select_default + actions.center,
				-- Optionally, map Ctrl-s to send selected items to quickfix in all pickers
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			n = {
				-- Same logic for normal mode
				["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
				["<CR>"] = actions.select_default + actions.center,
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})
