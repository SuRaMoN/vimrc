set nocompatible
set viminfo=
set nowrap " no wrapping
set nobackup " no stuppid backup files for when vim crashes
set lazyredraw
set tabstop=4 " for spaces for a tab
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set sidescrolloff=4
set ignorecase
set smartcase " default searhc CI unless a capital is supplied
set wildmenu
set incsearch
set hlsearch " highlight search results
set shortmess+=It
set nomore
set showcmd " 4 unix
set noswapfile
set su+=.class,.exe,.jar,.zip,.gz,.tar,.7z,.dll
set su-=.h
set nomodeline
set virtualedit=block
set textwidth=75
set complete+=t,k
set dictionary+=dictionary
set formatoptions-=tc
set completeopt+=longest,menuone
set hid
set confirm
set clipboard+=unnamed
set visualbell
set expandtab
colorscheme solarized

if has("unix")
	set shell=bash
endif

if exists("+shellslash")
	set shellslash
endif

if !exists("allow_all_charset")
	set fileencodings=latin1
endif
