" pathogen load
filetype off
execute pathogen#infect()
filetype plugin indent on

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" set indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" highlight the search
set hlsearch

" set soft wrap without a new line sign
set wrap linebreak nolist

" set text width not the format option to enable softwrap
set formatoptions-=t

" set the text width be 80
set tw=80

" set the wrap margin
"set wm=80

" set continuous left/right after hitting the beginning/end of line.
set whichwrap+=<,>,h,l,[,]

" do not use the fly spell checking
set nospell  

" set the incremental searches
set incsearch

" set the gui options
set guioptions=aem

" enable code folding
set foldmethod=indent
set foldlevel=99

" Get the running OS
function! GetRunningOS()
  if has('win32')
    return 'win'
  endif
  if has('unix')
    if system('uname')=~'Darwin'
      return 'mac'
    else
      return 'linux'
    endif
  endif
endfunction

" Set the <leader> key from the \ to the more accessible , key
let mapleader=','
set timeout timeoutlen=1000


" Disable the Option key and set it as Meta key
if GetRunningOS()=~'mac'
  if has('gui_macvim')
    set macmeta
  endif
endif


" Use Shift+movement to extend the selection in Mac.
if has('gui_macvim')
  let macvim_hig_shift_movement=1
endif


" Set the font be Source Code Pro in Mac
if has('gui_running')
  if GetRunningOS()=~'mac'
    set guifont=Source\ Code\ Pro:h14
  endif
endif


" Make sure the diff pane are all closed. This function guarantees only one diff 
" pane is open.
let g:mynerdtreeisactive=0  " define the indicator of the NERDTree
function! CloseCurUtilityDiffPane()
  :UndotreeHide  " Close the Undotree diff pane
  :NERDTreeClose  " Close the NERDTree diff pane
  let g:mynerdtreeisactive=0
endfunction
nmap <Leader>dc :call CloseCurUtilityDiffPane()<CR>


" Diff Pane -- Undotree
function! MyUndotreeToggle()
  if UndotreeIsVisible()
    :UndotreeHide
  else
    :call CloseCurUtilityDiffPane()
    :UndotreeShow
  endif
endfunction
nmap <Leader>du :call MyUndotreeToggle()<CR>
nmap <F4> :call MyUndotreeToggle()<cr>
imap <F4> <Esc>:call MyUndotreeToggle()<CR>i
if has('persistent_undo')
  set undodir='~/.vim/undo'
  set undofile
  set undolevels=1000  "max number of changes that can be undone
  set undoreload=10000  "max number of lines to save for undo on a buffer reload
endif


" Diff Pane -- NERDTree
function! MyNERDTreeToggle()
  if g:mynerdtreeisactive
    :NERDTreeClose
    let g:mynerdtreeisactive=0
  else
    :call CloseCurUtilityDiffPane()
    :NERDTree
    let g:mynerdtreeisactive=1
  endif
endfunction
nmap <Leader>dn :call MyNERDTreeToggle()<CR>
nmap <F3> :call MyNERDTreeToggle()<CR>
imap <F3> <Esc>:call MyNERDTreeToggle()<CR>i


" CtrlP
let g:ctrlp_map='<C-P>'
let g:ctrlp_cmd='CtrlP'


" MacVim Transparency
function! IncreaseTransparency()
  if has('gui_running')
    if &transparency<60
      set transparency+=15
    else  
      set transparency=60
    endif
  endif
endfunction

function! ResetTransparency()
  if has('gui_running')
    set transparency=0
  endif
endfunction

if GetRunningOS()=~'mac' 
  nmap <F2> :call IncreaseTransparency()<cr>
  imap <F2> <Esc>:call IncreaseTransparency()<CR>i
  nmap <C-F2> :call ResetTransparency()<cr>
  imap <C-F2> <Esc>:call ResetTransparency()<CR>i
endif


" " MATLAB
" source $VIMRUNTIME/macros/matchit.vim
" autocmd BufEnter *.m compiler mlint


" Add a shortcut to toggle line numbers
nmap <C-L> :set invnumber<CR>
imap <C-L> <Esc>:set invnumber<CR>i
set invnumber  " show line number when vim starts


" Add a shortcut to split line under cursor
nnoremap K i<CR><Esc>


" Add a new shortcut for completion
imap <S-Space> <C-N>


" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '|'


" Has moved to ~/.vim/after/ftplugin/tex.vim
" " vim-latex settings
" filetype plugin on
" filetype indent on
" set shellslash
" set grepprg=grep\ -nH\ $*
" " set sw=2  " LaTeX looks good with just a bit of indentation.
" set winaltkeys=no  " Disable the Alt key to focus to the menu bar
" set iskeyword+=:  " <C-n> cycle all the fig:lables in \ref{fig:
" let g:tex_flavor='latex'
" let g:tex_conceal = ""
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmodes $*'
" let g:Tex_TreatMacViewerAsUNIX = 1
" let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'
" let g:Imap_UsePlaceHolders=0  " totally disable the placeholder in vim-latex
" let g:Tex_FoldedSections=''
" let g:Tex_FoldedEnvironments=''
" let g:Tex_FoldedMisc=''


" " color theme -- Solarized
" if has('gui_running')
"     set background=light
"     colorscheme solarized
" endif


" " color theme -- Hybrid-light
" if has('gui_running')
"   colorscheme hybrid-light
" endif


" color theme -- pyte
if has('gui_running')
  colorscheme pyte
endif
