" ░█░█░▀█▀░█▄█░█▀▄░█▀▀
" ░▀▄▀░░█░░█░█░█▀▄░█░░
" ░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀

" Be iMproved 
set nocompatible

" ======================= "
" --- Vundle settings --- "
" ======================= "

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'vimwiki/vimwiki'
Plugin 'nathangrigg/vim-beancount'
Plugin 'jamessan/vim-gnupg'
Plugin 'morhetz/gruvbox'
Plugin 'prettier/vim-prettier'
Plugin 'dag/vim-fish'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'csscomb/vim-csscomb'
Plugin 'dense-analysis/ale'
Plugin 'hashivim/vim-terraform'

" -- Python specific -- "

Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'psf/black'
Plugin 'vim-python/python-syntax'

" -- Code/Project navigation -- "

Plugin 'ctrlpvim/ctrlp.vim' " Fast transitions on project files
Plugin 'scrooloose/nerdtree' " Project and file navigation
Plugin 'fholgado/minibufexpl.vim' " Buffer explorer

Plugin 'vim-syntastic/syntastic' " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline' " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'plasticboy/vim-markdown'
Plugin 'mg979/vim-visual-multi'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'

" -- Snippets support -- "

Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " Sparkup(XML/jinja/html-django/etc.) support

" -- Auto-complete -- "
Plugin 'ycm-core/YouCompleteMe'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

" non github repos
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
call vundle#end()
filetype plugin indent on

set encoding=utf-8
set spell
set backspace=indent,eol,start

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"enable fancy syntax colors
syntax on

" Turn on line numbers
set nu

"enable mouse support in all modes."
set mouse=a
set mousehide

" Don't keep results highlighted after searching"
set nohlsearch

" Just highlight as we type"
set incsearch

" Indentation
" set shiftwidth=2 tabstop=2 softtabstop=2 smarttab
" two spaces
set tabstop=2 shiftwidth=2 expandtab

set showmatch
set ignorecase
set autoindent
set history=1000
set cursorline
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set clipboard+=unnamed
set title

" Better paste
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Wrap lines
set wrap
set linebreak

" set background=light
set background=dark

" Access colors present in 256 colorspace if Base16 terminal
" http://github.com/chriskempson/base16-vim
let base16colorspace=256

colorscheme gruvbox
" colorscheme base16-dracula
" colorscheme solarized
" colorscheme rdark
" colorscheme pyte
" colorscheme github
" colorscheme codeschool
" colorscheme darkburn
" colorscheme colorzone
" colorscheme codeburn
" colorscheme proton
" colorscheme toychest

" set guifont=CamingoCode\ Regular\ Nerd\ Font\ Complete:h14
set guifont=Operator\ Mono\ Book:h13

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd vimenter * NERDTree
" let g:nerdtree_tabs_open_on_gui_startup=1
" let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=0

" Ignore this extensions on NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" " NERDTress File highlighting only the glyph/icon
" " test highlight just the glyph (icons) in nerdtree:
" autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

" autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
" " if you are using another syn highlight for a given line (e.g.
" " NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" " other highlight to work with it
" autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
" autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile

" When vsplit do it vertical
let splitMode = 'vertical'

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" Toggle NERDTree with F3
nmap <silent> <F3> :NERDTreeToggle<CR>

let g:miniBufExplModSelTarget = 1

" Enable emmet or zen code
let g:user_emmet_mode='a'

" Don't bell or blink
set noerrorbells
set vb t_vb=

" --- Python settings --- "

" Python proper PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:python_highlight_all = 1

let g:ale_fixers = {}
let g:ale_fixers.python = ['black']

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm""]]"

" Move backup files to ~/.sessions/
set backupdir=~/.sessions
set dir=~/.sessions

map <A-Right> <C-W>1
map <A-Left> <C-W>h
map <leader>c <c-_><c-_>

" Airline config
let laststatus = 2
let g:airline#extensions#tabline#enables = 1
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" Markdown
let g:vim_markdown_folding_disabled=1
let g:mustache_operators = 0

" EditorConfig

" To ensure that this plugin works well with Tim Pope's fugitive,
" use the following patterns array:
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" If you wanted to avoid loading EditorConfig for any remote files over ssh:
let g:EditorConfig_exclude_patterns = ['scp://.*']

" Python
let g:syntastic_python_checkers=['flake8', 'pylint']
" let g:syntastic_python_flake8_args='--ignore=ES501'

" Use flavored-markdown by default
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" --- YouCompleteMe settings --- "

" Close auto-complete window when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" Shortcut
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set formatoptions+=a
set tw=80

" -- Vimwiki settings -- "

let g:automatic_nested_syntaxes = 1
let g:vimwiki_list = [{'path': '~/sync/vimwiki/',
          \ 'syntax': 'markdown', 'ext': '.md'},{ 'path': '~/sync/vimwiki/', 
          \ 'path_html': '~/sync/vimwiki_html/' }]
let g:GPGPreferSymmetric=1
let g:GPGPreferArmor=1
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='

autocmd BufNewFile */diary/[0-9]*.md :silent 0r !~/.vim/bin/generate-vimwiki-dairy-template.py '%'

" -- SnipMate settings -- "

" Use the new parser. The legacy version is deprecated. For more info do
" :h SnipMate-deprecate
let g:snipMate = { 'snippet_version': 1 }

" --- Misc settings --- "

 " Full stack development defaults
au BufNewFile,BufRead *.js, *.jsx, *.ts, *.tsx, *.html, *.css, *.scss
  \ set tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

" Show whitespaces using `\+l`
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nmap <leader>l :set list!<CR>

" --- ALE settings --- "

let b:ale_linters = {'javascript': ['eslint']}
let g:ale_linters_explicit=1
" Fix files when you save them
let g:ale_fix_on_save=1
