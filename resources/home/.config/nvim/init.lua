-- Auto-install vim-plug if not present
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/autoload/plug.vim"

if fn.empty(fn.glob(install_path)) > 0 then
  print("Installing vim-plug...")
  fn.system({
    "sh", "-c",
    "curl -fLo " .. install_path ..
    " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  })
  print("vim-plug installed. Restart Neovim and run :PlugInstall")
end

----Initialize vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin')

--Navigator, interface
Plug 'preservim/nerdtree' --Tree navigator
Plug 'Xuyuanp/nerdtree-git-plugin' --Git coloration integration for nerdtree
Plug 'vim-airline/vim-airline' --Cool bottom bar with rich informations

--LSP Code completion, navigation, hint ecc...
Plug 'williamboman/mason.nvim' --Plugin which install plugins
Plug 'williamboman/mason-lspconfig.nvim' --Bridge between mason and lspconfig
Plug 'neovim/nvim-lspconfig' --Language Service Processor, for code navigation
Plug 'hrsh7th/cmp-nvim-lsp' --Integration with neovim/nvim-lspconfig
Plug 'hrsh7th/nvim-cmp' --Code hint
Plug 'L3MON4D3/LuaSnip' --Snip engine (reuqired for nvim-cmp)
Plug 'saadparwaiz1/cmp_luasnip' --Snip engin integration with nvim-cmp

--Utility for coding (not related to LSP)
Plug 'jiangmiao/auto-pairs' --Autocompletion for quotes/parenthesis
Plug 'preservim/nerdcommenter' --Comment plugin
Plug 'mg979/vim-visual-multi' --Multi column
Plug 'akinsho/toggleterm.nvim' --Terminal window

--Code debugging
Plug 'puremourning/vimspector' --Vimspector DAP

vim.call('plug#end')



-- Load mason, required for mason-lspconfig
require("mason").setup()

---- LSP
-- LSP config loading
require("mason-lspconfig").setup{
	ensure_installed = {
		"bashls",
		"clangd",
		"pyright",
		"vuels",
		"tsserver",
		"yamlls",
		"jedi_language_server",
		"jsonls",
		"dockerls",
		"docker_compose_language_service",
		"html",
		"tailwindcss"
	}
}
local cmp = require'cmp'
cmp.setup{
	snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
	sources = { { name = 'nvim_lsp' } },
	mapping = cmp.mapping.preset.insert({
	    ["<C-p>"] = cmp.mapping.select_prev_item(),
	    ["<C-n>"] = cmp.mapping.select_next_item(),
	    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
	    ["<C-f>"] = cmp.mapping.scroll_docs(4),
	    ["<C-Space>"] = cmp.mapping.complete(),
	    ["<C-e>"] = cmp.mapping.close(),
	    ["<CR>"] = cmp.mapping.confirm({
	      behavior = cmp.ConfirmBehavior.Replace,
	      select = true,
	    }),
	    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
	    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        })
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").jedi_language_server.setup {capabilities = capabilities}
require("lspconfig").jsonls.setup {capabilities = capabilities}
require("lspconfig").yamlls.setup {capabilities = capabilities}
require("lspconfig").dockerls.setup {capabilities = capabilities}
require("lspconfig").docker_compose_language_service.setup {capabilities = capabilities}
require("lspconfig").bashls.setup {capabilities = capabilities}
require("lspconfig").html.setup {capabilities = capabilities}
require("lspconfig").tailwindcss.setup {capabilities = capabilities}



---- DAP
-- vimspector setup
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'
vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'delve', 'vscode-bash-debug', 'vscode-firefox-debug', 'vscode-php-debug', 'vscode-java-debug' }




---- Toggleterm
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


---- Custom keymaps
-- vimspector
--vim.api.nvim_set_keymap(
--	'n',
--	"<F21>",
--	':call vimspector#ToggleAdvancedBreakpoint()<CR>',
--	{}
--)
--vim.api.nvim_set_keymap(
--	'n',
--	"<F20>",
--      ':call vimspector#ListBreakpoints()<CR>',
--	{}
--)

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





---- Other vim settings
vim.cmd([[
syntax on                       "syntax highlighting, see :help syntax
filetype plugin indent on       "file type detection, see :help filetype
set number                      "display line number
set relativenumber              "display relative line numbers
set path+=**                    "improves searching, see :help path
set noswapfile                  "disable use of swap files
set wildmenu                    "completion menu
set backspace=indent,eol,start  "ensure proper backspace functionality
set undodir=~/.cache/nvim/undo  "undo ability will persist after exiting file
set undofile                    "see :help undodir and :help undofile
set incsearch                   "see results while search is being typed, see :help incsearch
set smartindent                 "auto indent on new lines, see :help smartindent
set ic                          "ignore case when searching
set colorcolumn=80,120          "display color when line reaches pep8 standards
set expandtab                   "expanding tab to spaces
set tabstop=4                   "setting tab to 4 columns
set shiftwidth=4                "setting tab to 4 columns
set softtabstop=4               "setting tab to 4 columns
set showmatch                   "display matching bracket or parenthesis
set hlsearch incsearch          "highlight all pervious search pattern with incsearch
set nowrap                      "disable text wrapping

autocmd BufNewFile,BufRead *[jJ]enkinsfile set syntax=groovy  "set syntax highlight for Jenkinsfile(s)
autocmd BufNewFile,BufRead [jJ]enkinsfile.* set syntax=groovy  "set syntax highlight for Jenkinsfile(s)

hi ColorColumn ctermbg=9 "display ugly bright red bar at color column number
hi diffAdded cterm=bold ctermfg=DarkGreen
hi diffRemoved cterm=bold ctermfg=DarkRed

hi diffFile cterm=NONE ctermfg=DarkBlue
hi gitcommitDiff cterm=NONE ctermfg=DarkBlue
hi diffIndexLine cterm=NONE ctermfg=DarkBlue
hi diffLine cterm=NONE ctermfg=DarkBlue
]])
