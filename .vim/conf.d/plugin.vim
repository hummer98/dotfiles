" Plugin -------------------------------
" for neocomplete --------------------
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_syntax_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#max_list = 25
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


" for unite.vim ------------------------
let g:unite_update_time = 250
let g:unite_enable_start_insert = 0 " unite starts in insert mode
let g:unite_force_overwrite_statusline = 0

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

" unite mapping
nnoremap [unite] <Nop>
nmap ,u [unite]
nnoremap <silent>[unite]a  :<C-u>Unite -buffer-name=files buffer file_mru bookmark file tab<CR>
nnoremap <silent>[unite]b  :<C-u>Unite buffer<CR>
" nnoremap <silent>[unite]c  :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent>[unite]c  :execute "Unite file file/new -input=" . expand("%:p:h") . "/"<CR>
nnoremap <silent>[unite]fa :<C-u>Unite file_rec/async<CR>
nnoremap <silent>[unite]fg :<C-u>Unite file_rec/git<CR>
nnoremap <silent>[unite]fi :<C-u>Unite find<CR>
nnoremap <silent>[unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer -direction=topleft -no-quit<CR>
nnoremap <silent>[unite]gg :<C-u>Unite grep:. -buffer-name=search-buffer -direction=topleft -no-quit<CR><C-r><C-w><CR>
nnoremap <silent>[unite]gr :<C-u>UniteResume search-buffer -auto-preview<CR>
nnoremap <silent>[unite]m  :<C-u>Unite file_mru<CR>
nnoremap <silent>[unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent>[unite]me :<C-u>Unite output:message<CR>
nnoremap <silent>[unite]l  :<C-u>Unite tab<CR>
nnoremap <silent>[unite]n  :<C-u>Unite file/new<CR>
nnoremap <silent>[unite]o  :<C-u>Unite outline -vertical -winwidth=30<CR>
nnoremap <silent>[unite]qc :<C-u>UniteWithBufferDir -buffer-name=files file file/new -no-quit<CR>
nnoremap <silent>[unite]qo :<C-u>Unite outline -vertical -winwidth=30 -no-quit<CR>
nnoremap <silent>[unite]qt :<C-u>Unite tab -no-quit<CR>
nnoremap <silent>[unite]qu :<C-u>Unite file_mru tab -no-quit<CR>
nnoremap <silent>[unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent>[unite]s  :<C-u>Unite source<CR>
nnoremap <silent>[unite]t  :<C-u>Unite tag/include<CR>
nnoremap <silent>[unite]u  :<C-u>Unite file_mru tab<CR>

" use ag(The Silver Searcher)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" open with separated window
au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
" open with separated vertical window
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" close on push esc*2
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" for vimfiler.vim ---------------------
nnoremap <Leader>e  :<C-u>VimFilerExplorer<CR>


" for emmet-vim ------------------------
" pv = provide
let g:user_emmet_settings = {
  \ 'indentation' : '  ',
  \ 'lang' : 'ja',
  \ 'eruby': {
  \   'snippets': {
  \     'pv' : "<% ${cursor} %>",
  \     'pv-': "<%= ${cursor} %>",
  \     'pve': "<% end %>",
  \   },
  \ },
  \}
let g:user_emmet_expandabbr_key = '<c-z>'


" for surroud.vim ----------------------
noremap <c-3> ysst


" for syntastic  -----------------------
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['javascript', 'php', 'ruby', 'python', 'vim'],
  \ 'passive_filetypes': ['html']
  \}
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--standard=$HOME/.conf/phpcs.xml'
let g:syntastic_php_phpmd_post_args='$HOME/.conf/phpmd.xml'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
nnoremap <silent><leader>s  :<C-u>SyntasticReset<CR>

" for jslint ---------------------------
" augroup call_jslint
  " autocmd! call_jslint
  " autocmd FileType javascript call s:javascript_filetype_settings()
" augroup END

" function! s:javascript_filetype_settings()
  " autocmd BufLeave     <buffer> call jslint#clear()
  " autocmd BufWritePost <buffer> call jslint#check()
  " autocmd CursorMoved  <buffer> call jslint#message()
" endfunction


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
  \   'split': 'botright 5sp',
  \   'close_on_empty': 1,
  \   'hook/time/enable': 1
  \   },
  \ 'javascript': {
  \   'commond': 'node',
  \   'tempfile': '{tempname()}.js'
  \   }
  \ }
" 'split': 'botright 50vsp',
" 'exec': '~/local/bin/python %o %s'
" <C-c>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


" for taglist.vim ----------------------
set tags=tags
if filereadable(expand('/Applications/MacVim.app/Contents/MacOS/ctags'))
  let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags'
  let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'
endif
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
nnoremap <silent> <leader>l :TlistToggle<CR>

" for lightline.vim --------------------
let g:lightline = {
      \ 'colorscheme': 'metroid',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'component_function': {
      \   'mode': 'MyMode',
      \   'fugitive': 'MyFugitive'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }

function! MyMode()
  return &ft == 'unite' ? 'Unite' :
       \ &ft == 'vimfiler' ? 'VimFiler' :
       \ &ft == 'vimshell' ? 'VimShell' :
       \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.(?!html) call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction


let s:base03 = [ '#242424', 235 ]
let s:base023 = [ '#353535 ', 236 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
let s:white = [ '#ffffff', 255 ]
let s:yellow = [ '#fef935', 227 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 197 ]
let s:magenta = [ '#ff4cfc', 200 ]
let s:blue = [ '#8ac6f2', 117 ]
let s:cyan = s:blue
let s:green = [ '#00f896', 48 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:yellow ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base1 ] ]
let s:p.tabline.right = [ [ s:base2, s:base01 ] ]
let s:p.normal.error = [ [ s:base02, s:yellow ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#metroid#palette = lightline#colorscheme#flatten(s:p)

