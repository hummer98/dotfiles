" Plugin -------------------------------
" for neocomplete --------------------
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_syntax_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#max_list = 50
let g:neocomplete#enable_auto_select = 1

let g:neocomplete#force_overwrite_completefunc = 1


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#smart_close_popup() . "\<CR>" " For inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>" " For no inserting <CR> key.
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1


" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For rubyomni.vim setting.
" let g:neocomplete#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete


" for neosnippet -----------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" for unite.vim ------------------------
let g:unite_update_time = 1000
call unite#custom#substitute('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#custom#substitute('file', '[^~.]\zs/', '*/*', 20)
call unite#custom#substitute('file', '/\ze[^*]', '/*', 10)
call unite#custom#substitute('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#custom#substitute('file', '^@', '\=getcwd()."/*"', 1)
call unite#custom#substitute('file', '^\\', '~/*')
call unite#custom#substitute('file', '^;v', '~/.vim/*')
call unite#custom#substitute('file', '^;r', '\=$VIMRUNTIME."/*"')
call unite#custom#substitute('file', '\*\*\+', '*', -1)
call unite#custom#substitute('file', '^\~', escape($HOME, '\'), -2)
call unite#custom#substitute('file', '\\\@<! ', '\\ ', -20)
call unite#custom#substitute('file', '\\ \@!', '/', -30)

" unite starts in insert mode
let g:unite_enable_start_insert=0

" unite mapping
nnoremap [unite] <Nop>
nmap ,u [unite]
nnoremap <silent>[unite]b :<C-u>Unite buffer<CR>
nnoremap <silent>[unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent>[unite]f :<C-u>Unite file<CR>
nnoremap <silent>[unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent>[unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent>[unite]t :<C-u>Unite tab<CR>
nnoremap <silent>[unite]tq :<C-u>Unite tab -no-quit<CR>
nnoremap <silent>[unite]u :<C-u>Unite buffer file_mru tab<CR>
nnoremap <silent>[unite]s :<C-u>Unite session<CR>
nnoremap <silent>[unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file tab<CR>

" unite plugin mapping
nnoremap <silent>[unite]o :<C-u>Unite outline<CR>

" open with separated window
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" open with separated vertical window
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" close on push esc*2
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" for operator-replace
nmap _ <Plug>(operator-replace)


" for jslint ---------------------------
augroup call_jslint
  autocmd! call_jslint
  autocmd FileType javascript call s:javascript_filetype_settings()
augroup END

function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction


" for emmet-vim ------------------------
" pv = provide
let g:user_emmet_settings = {
\ 'indentation' : '  ',
\ 'lang' : 'ja',
\ 'eruby': {
\   'snippets': {
\     'pv' : "<% ${cursor} %>",
\     'pv-': "<%= ${cursor} %>",
\   },
\ },
\}
let g:user_emmet_expandabbr_key = '<c-z>'


" for surroud.vim ----------------------
noremap <c-3> ysst


" for NERDCommenter --------------------
" use NERDCommenterToggle c--
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <c-_> <Plug>NERDCommenterToggle
vmap <c-_> <Plug>NERDCommenterToggle


" for open-browser ---------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


" for jump2pm.vim ----------------------
" au FileType perl :setlocal path+=追加したいパス
noremap fg :call Jump2pm('vne')<CR>
noremap ff :call Jump2pm('e')<CR>
noremap fd :call Jump2pm('sp')<CR>
noremap ft :call Jump2pm('tabe')<CR>


" for vim-quickrun ---------------------
let g:quickrun_config = {
  \ '_': {
  \   'runner': 'vimproc',
  \   'runner/vimproc/updatetime': '60',
  \   'outputter': 'buffer',
  \   'split': 'botright 50vsp',
  \   'close_on_empty': 1,
  \   'hook/time/enable': 1
  \   },
  \ 'javascript': {
  \   'commond': 'node',
  \   'tempfile': '{tempname()}.js'
  \   }
  \ }
" 'split': 'botright 10sp',
" 'exec': '~/local/bin/python %o %s'
" <C-c>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


" for taglist.vim ----------------------
set tags=tags
if filereadable(expand('/Applications/MacVim.app/Contents/MacOS/ctags'))
  let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags'
endif
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
nnoremap <silent> <leader>l :TlistToggle<CR>

