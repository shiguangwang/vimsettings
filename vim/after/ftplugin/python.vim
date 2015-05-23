" Not use the quickfix window for pyflakes
let g:pyflakes_use_quickfix=0

" a key mapping for pep8 plugin
let g:pip8_map='<leader>8'

" supertab configuration
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview

" refactoring and goto definition
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" fuzzy searching
nmap <leader>a <Esc>:Ack!

echo "Python conf loaded."
