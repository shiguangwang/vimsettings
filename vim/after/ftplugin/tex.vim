" IMPORTANT: win32 users will need to have 'shellslash' set so that latex can be
" called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you search in
" a single file. This will confuse Latex-Suite. Set your grep program to always
" generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 6, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded. The
" following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" This is mostly a matter of taste. but Latex looks good with just a bit of
" indentation.
set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you type in
" \ref{fig: and press <C-n> you will automatically cycle through all the figure
" labels. Very userful!
set iskeyword+=:

" Other settings:
let g:tex_conceal=""
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -synctex=1 --interaction=nonstopmodes $*'
let g:Tex_TreatMacViewerAsUNIX=1
let g:Tex_ViewRule_pdf='open -a /Applications/Skim.app'
let g:Imap_UsePlaceHolders=0  " totally disable the placeholder in vim-latex
let g:Tex_FoldedSections=''
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedMisc=''
