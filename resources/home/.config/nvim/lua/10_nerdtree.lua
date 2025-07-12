-- Set NerdTreeToggle shortcut with F2
vim.api.nvim_set_keymap(
	'n',
	"<F2>",
	':NERDTreeToggle<CR>',
	{}
)
-- Close tab
vim.api.nvim_set_keymap(
	'n',
	"<CS-w>",
	':tabclose<CR>',
	{}
)

