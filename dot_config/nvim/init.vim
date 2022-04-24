" If in iTerm, change the background color of the terminal using a profile
if $TERM_PROGRAM == "iTerm.app"

	" It's easy to set the profile: ESC ] 1337 ; SetProfile=<name> BEL
	silent! call writefile(["\033]1337;SetProfile=NeoVim\07"], "/dev/tty")

	" Restoring the profile is harder. We need to write to the tty itself.
	" This doesn't work in sudo. Not sure if there's a way around that.
	augroup restore_iterm_profile
		autocmd!
		autocmd VimLeave * silent! call writefile(["\033]1337;SetProfile=" . $ITERM_PROFILE . "\07"], "/dev/tty")
	augroup end

endif

" Enable 24-bit color if available
if has('termguicolors')
	set termguicolors
endif

" More room for the commands
set cmdheight=2

" Show absolute line number of current line, above/below are relative
set number relativenumber

" Wrapped lines count towards the line number count
set cpoptions+=n

" Sometimes it's nice to click, sue me
set mouse=a

" Search as you type
set incsearch

" Case insensitive searches, unless there's an upper case letter
set ignorecase smartcase

" Substitute always uses the global flag
set gdefault

" Show the line and column
set ruler

" Makes backspace behave how you expect it to
set backspace=indent,eol,start

" Show whitespace by default
set list listchars=tab:→\ ,lead:·,trail:·,nbsp:•

" Delete comment characters when joining lines
set formatoptions+=j

" Recognize numbered lists, insert numbers
set formatoptions+=n

" Read files when changed on disk
set autoread

" Better command line completion
set wildmenu

" Abandon buffers that aren't in the foreground
set nohidden

" Require confirmation before closing a buffer with unsaved changes
set confirm

" Insert only 1 space when joining a line that ends with punctuation
set nojoinspaces

" Copy indent from the current line when starting a new line
set autoindent

" Text wrapping options
set nowrap                   " Don't wrap by default (customize in an ftplugin)
set linebreak                " Break on spaces instead of letters
set showbreak=↪              " Show this before continuing on the next line
set breakindent              " Indent as many characters as the original line
set breakindentopt=list:-1   " If the line was a list, indent as many characters as start

" Tab options
set noexpandtab    " Use hard tabs by default (clearly better)
set smarttab       " When 'expandtab' is on, leading spaces are multiples of 'shiftwidth'
set tabstop=2      " Tab characters (\t) are 2 characters wide
set shiftwidth=0   " Number of spaces to use for autoindents (0 = use tabstop)

" Open new splits to the right or below, instead of left or above
set splitright splitbelow

" Start diffs with veritcal splits
set diffopt+=vertical

" Keep some space between the caret and the edge of the screen
set scrolloff=3 sidescrolloff=5

" Don't inherit this buffer's options
set sessionoptions-=options viewoptions-=options

" Always show the sign column
set signcolumn=yes

" Shorter time between swap file updates and CursorHold events
set updatetime=300

" Better completion experience, apparently
set completeopt=menuone,noselect

" Use dark colorschemes
set background=dark

" Don't wait indefinitely for another key, timeout after 400ms
set timeout timeoutlen=200

" Disable modelines (comments that set vim settings)
set nomodeline

" Ignore files matching these patterns when expanding wildcards
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,.DS_Store

" No splash text
set shortmess=I

" Write to a sane location
let &undodir = stdpath('data') . "/undo"
let &backupdir = stdpath('data') . "/backup"

" Use tree-style browsing
let g:netrw_liststyle = 3

""""""""""""""""""""""""""""""""""""""""""""""""""

" C-l clears highlighting
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Consistent yank
nnoremap <silent> Y y$

" No arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" No arrow keys in visual mode
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" No up/down in normal mode, but left/right switch buffers
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <silent> <left> :bprevious<CR>
nnoremap <silent> <right> :bnext<CR>

" Move by visual line. If a count is used, move by file line.
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
vnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
vnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'

let mapleader = " "

" Delete a buffer without closing the pane
nnoremap <silent> <leader>bd :bp\|bd #<CR>

" Enable loading ftplugins
filetype plugin on

" Enable loading indent plugins
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""

" Create intermediate directories when writing a file
augroup writemkdirp
	autocmd!
	autocmd BufWritePre * silent! call mkdir(expand("<afile>:p:h"), "p")
augroup end

" Highlight the yanked range
augroup highlight_yank
	autocmd!
	autocmd TextYankPost * lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

" Disable line numbers in terminals
augroup no_term_numbers
	autocmd!
	autocmd TermOpen * setlocal signcolumn=no nonumber norelativenumber
augroup end

" Finally, run the plugins script
let plugins_script = stdpath('config') . '/plugins.vim'

if filereadable(plugins_script)
	let g:myplugins = plugins_script

	function! g:EditPlugins()
		 execute 'edit ' . g:myplugins
	endfunction

	execute 'source ' . plugins_script
endif
