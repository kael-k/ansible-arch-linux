require("telescope").setup({
  extensions = {
    live_grep_args = {
      auto_quoting = true,  -- allows quoting search terms with spaces
    }
  }
})

require("telescope").load_extension("live_grep_args")

local opts = { noremap = true, silent = true }

-- Global Search
vim.api.nvim_set_keymap('n', '<C-F>', ':Telescope live_grep_args live_grep_args<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-F>', '<Esc>:Telescope live_grep_args live_grep_args<CR>', opts)
vim.api.nvim_set_keymap('v', '<C-F>', '<Esc>:Telescope live_grep_args live_grep_args<CR>', opts)
vim.api.nvim_set_keymap('c', '<C-F>', '<C-C>:Telescope live_grep_args live_grep_args<CR>', opts)

-- Open Telescope (on F4)
vim.api.nvim_set_keymap('n', '<F4>', ':Telescope<CR>', opts)
vim.api.nvim_set_keymap('i', '<F4>', '<Esc>:Telescope<CR>', opts)
vim.api.nvim_set_keymap('v', '<F4>', '<Esc>:Telescope<CR>', opts)
vim.api.nvim_set_keymap('c', '<F4>', '<C-C>:Telescope<CR>', opts)

