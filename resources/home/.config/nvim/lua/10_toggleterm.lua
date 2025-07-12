require("toggleterm").setup()

-- Double esc to exit terminal view
vim.api.nvim_set_keymap(
	't',
	'<Esc><Esc>',
	'<C-\\><C-n>',
	{}
)
-- F3 to toggle terminal view
vim.api.nvim_set_keymap(
	'n',
	'<F3>',
	':ToggleTerm<CR>',
	{}
)
