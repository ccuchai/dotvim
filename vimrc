" -----------------------------------------
" Vundle Settings
" -----------------------------------------
filetype off    " for Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/ListToggle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'tagbar'
Bundle 'fcamel/gj'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'elzr/vim-json'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'fatih/vim-go'

" -----------------------------------------
" General Settings
" -----------------------------------------
set nocompatible        " be iMproved
set nu	                " show the line number; use [set nonu] to close;
set cursorline          " highlight current line
set nowrap              " never auto change to next line
set paste               " can use <Cmd>+v to paste in vim

" restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo

set autoindent          " auto indentation
set smartindent         " a improvement of autoindent
set copyindent          " copy the previous indentation on autoindenting
set incsearch           " incremental search
set nobackup            " no *~ backup files
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context

set wildchar=<TAB>      " when type command, use <tab> to do completion
set wildmenu
set showmatch
set showmode
set noswapfile

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set mouse=n

filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

syntax on	            " use syntax
set t_Co=256            " 256 color mode
colorscheme hybrid
set background=dark
set t_ut=               " fix tmux color

" TAB setting
set tabstop=4
set softtabstop=4	    " the default tab space size=4
set shiftwidth=4	    " the default autoindenting space size=4
"set expandtab	        " replace <TAB> with spaces
" show tab

au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.bash set filetype=sh
au FileType Makefile set noexpandtab
au Filetype html setlocal ts=2 sw=2 expandtab

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc
"----------------------------------------------------------------------- 
" ENCODING SETTINGS
"----------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
  set encoding=utf-8                                  
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8                                  
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
  set encoding=big5
  set fileencoding=big5
endfun

"----------------------------------------------------------------------- 
" PLUGINS
"-----------------------------------------------------------------------

" --- YCM(YouCompleteMe) & eclim---
" *** usage: use C-X C-X or C-<space> to trigger the completion ***
" the flowing line enable YCM to do powful C++ completion funtionality
" by loading cpp completion model
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" If you prefer the completion tip window to close when a selection is
" made, these followint lines close it on movement in insert mode or
" when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'html' : ['.'],
      \ }
" The following is for eclim, This will make YCM and Eclim play nice; YCM will
" use Eclim's omnifuncs as the data source for semantic completions and
" provide the auto-triggering and subsequence-based matching (and other YCM
" features) on top of it.
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_filetype_specific_completion_to_disable = {'*': 1}
" -------------------------

" --- istToggle ----------
let g:lt_location_list_toggle_map = '<leader>w'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10
" -------------------------

" --- NERDTree & NERDTreeTabs----
" don't open nerdtree_tabs when gvim/macvim open; otherwise, 0
let g:nerdtree_tabs_open_on_gui_startup = 0
" NERDTreeTabsToggle bind to <F2>
map <F2> <Esc>:NERDTreeTabsToggle<CR>
" NERDTreeToggle bind to <F2>
"map <F2> :NERDTreeToggle<CR>
"map <leader>n :NERDTreeTabsToggle<CR>
" -------------------------

" --- ctags ---------------
" !!!Make sure use <F5> before change to source root dir!!!-----
" use <F5>(means:new tags) to generate a file 'tags', which originally 
" should be generate by command `ctags -R` at (src/project) root dir
map <F5> :call Do_NewTags()<CR>
"set tags=./tags,tags;$HOME
" ctags (the semicolon is important!)
set tags=tags;
"set tags=/synosrc/curr/ds.base/tags,~/.vim/bundle/ctags/tags
" use a new tab to trace tag
" nmap <C-]> viwy:tab tag <C-R>"<CR>

function! Do_NewTags()
  " delete the current tags in the dir 
  if filereadable("~/.vim/bundle/ctags/tags")
    let tagsdeleted=delete("~/.vim/bundle/ctags/"."tags")
    if(tagsdeleted!=0)
      echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
      return
    endif
  endif

  " generate a new tag files to ~/.vim/ctags/tags
  if(executable('ctags'))
    "silent! execute '!ctags -R --c-types=+p --fields=+S *'
    exec "!ctags -R --c++-kinds=+lpx --java-kinds=+l --fields=+iaS --extra=+q -f $HOME/.vim/bundle/ctags/tags `pwd`"
  endif
endfunction
" -------------------------


" ================= Set path and tags =========================================
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" omnicomplete:
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|pclose|endif

" color for synoportforwarding files
autocmd BufNewFile,BufRead router.syn set ft=syn
autocmd BufNewFile,BufRead router.des set ft=des

"autocmd FileType * exe "setlocal dict+=".escape($VIMRUNTIME.'/syntax/' .&filetype.'.vim',' \$,')

filetype plugin on
let g:pydiction_location = '~/.vim/tools/complete-dict'

" --- taglist -------------
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window=1    " window is show at right-side
let Tlist_Show_One_File=1       " only show current file's tags
let Tlist_File_Fold_Auto_Close=1 "files' tags are folded except current one
let Tlist_Sort_Type="name"      " tags will be sorted by name; default is by occurence
let Tlist_Exit_OnlyWindow=1     " exit vim when taglist is the last window
"nmap <F3> : call Do_Tlist_Toggle()<CR>
function! Do_Tlist_Toggle() 
  TlistToggle
  TlistUpdate
endfunction
" -------------------------

"" --- tagbar -------------
nmap <F3> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
    \ 'o:objects',
    \ 'f:functions',
    \ 'a:arrays',
    \ 's:strings'
    \ ]
\ }
" -------------------------

" --- easymotion ------------
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" --- vim-go ------------
let g:go_fmt_autosave = 0

" --- vim-airline ------------
set laststatus=2
let g:airline_powerline_fonts = 1

" --- vim-json ------------
let g:vim_json_syntax_conceal = 0
