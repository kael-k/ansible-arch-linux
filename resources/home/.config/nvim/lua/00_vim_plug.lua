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

--Git related pluins
Plug 'lewis6991/gitsigns.nvim' --Line number colors for git
Plug 'tpope/vim-fugitive' --Git for vim, integrates with vim-airline
Plug 'sindrets/diffview.nvim' --Git diff comparison side-to-side

--Navigator, interface
Plug 'preservim/nerdtree' --Tree navigator
Plug 'Xuyuanp/nerdtree-git-plugin' --Git coloration integration for nerdtree
Plug 'vim-airline/vim-airline' --Cool bottom bar with rich informations
Plug 'folke/tokyonight.nvim' --Color theme

--LSP Code completion, navigation, hint ecc...
Plug 'williamboman/mason.nvim' --Plugin which install plugins
Plug 'williamboman/mason-lspconfig.nvim' --Bridge between mason and lspconfig
Plug 'neovim/nvim-lspconfig' --Language Service Processor, for code navigation
Plug 'hrsh7th/cmp-nvim-lsp' --Integration with neovim/nvim-lspconfig
Plug 'hrsh7th/nvim-cmp' --Code hint
Plug 'L3MON4D3/LuaSnip' --Snip engine (reuqired for nvim-cmp)
Plug 'saadparwaiz1/cmp_luasnip' --Snip engin integration with nvim-cmp
Plug 'ray-x/lsp_signature.nvim' --Autocomplete support with LSP

--Syntax Highlight and autocomplete
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- --Language specific packages
--Rust
Plug 'simrat39/rust-tools.nvim'

--Utility for coding (not related to LSP)
Plug 'jiangmiao/auto-pairs' --Autocompletion for quotes/parenthesis
Plug 'preservim/nerdcommenter' --Comment plugin
Plug 'mg979/vim-visual-multi' --Multi column
Plug 'akinsho/toggleterm.nvim' --Terminal window

-- telescope + dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug('nvim-telescope/telescope.nvim' , { ['tag'] = '0.1.8' })
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

--Code debugging
Plug 'puremourning/vimspector' --Vimspector DAP

vim.call('plug#end')
