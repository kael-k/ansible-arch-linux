---- Other vim settings
vim.cmd([[
    syntax on                       "syntax highlighting, see :help syntax
    
    set termguicolors               "Enable 24-bit color
    colorscheme tokyonight-night    "Set tokyonight-night color theme
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
]])
