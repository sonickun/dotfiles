
" ====================================================
" ====================================================
" vimshell
" ====================================================
let g:vimshell_interactive_update_time = 10

" ====================================================
" ====================================================
" Unite.vim
" ====================================================

let g:unite_enable_start_insert=0

" 大文字小文字を区別しない
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1

"file_mruの高速化
let g:unite_source_file_mru_filename_format = ''

augroup MyUnite
    autocmd!
    autocmd FileType unite call s:unite_setting()
augroup END
"
function! s:unite_setting()
    "<ESC>でuniteを終了(消えるのに1秒くらいかかる)
    nmap <buffer> <ESC> <Plug>(unite_exit)
    "分割して開く
    nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
endfunction

let g:unite_source_grep_max_candidates = 200

if executable('hw')
    " Use hw (highway)
    " https://github.com/tkengo/highway
    let g:unite_source_grep_command = 'hw'
    let g:unite_source_grep_default_opts = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --vimgrep --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt (the platinum searcher)
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack
    " http://beyondgrep.com/
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " Use jvgrep
    " https://github.com/mattn/jvgrep
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts =
                \ '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
endif

" call unite#custom#source('file', 'matchers', ["matcher_vigemo"])
" call unite#custom#source('file_mru', 'matchers', ["matcher_vigemo"])

let g:neomru#filename_format=':~:.'

" ====================================================
" ====================================================
" vimfiler.vim
" ====================================================

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1


" ====================================================
" ====================================================
" indentguide.vim
" ====================================================

" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_start_level=2
" let g:indent_guides_auto_colors=0
" let g:indent_guides_guide_size=1

" ====================================================
" ====================================================
" deoplete.nvim or neocomplete.vim
" ====================================================

if has('nvim')

    " deopleteの有効化
    let g:deoplete#enable_at_startup = 1
    " 大文字が入力されるまで大文字と小文字を区別しない
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    " 補完を開始する文字長
    let g:deoplete#auto_completion_start_length = 1
    " 自動で補完されるのを防ぐ
    let g:deoplete#enable_auto_select = 0

    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#ignore_sources = {}
    " let g:deoplete#ignore_sources._ = ['buffer']
    let g:deoplete#ignore_sources.python = ['buffer']
    let g:deoplete#omni#input_patterns.go = '[^. \t0-9]\.\w*'
    " let g:deoplete#sources#go = 'vim-go'

else

    " neocompleteの有効化
    let g:neocomplete#enable_at_startup = 1
    " 大文字が入力されるまで大文字と小文字を区別しない
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    " 補完を開始する文字長
    let g:neocomplete#auto_completion_start_length = 1
    " 自動で補完されるのを防ぐ
    let g:neocomplete#enable_auto_select = 0

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
endif
" set cmdheight=2
let g:echodoc_enable_at_startup = 1

" ====================================================
" ====================================================
" Neosnippet.vim
" ====================================================

let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'

" ====================================================
" ====================================================
" jedi-vim
" ====================================================

augroup jedi_setting
    autocmd!
    autocmd FileType python setlocal omnifunc=jedi#completions
augroup END
" jedi の補完の無効化
let g:jedi#completions_enabled = 0
" jedi に vim の設定を任せない
let g:jedi#auto_vim_configuration = 0
" jedi を自動で初期化する
let g:jedi#auto_initialization = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
" Python 3 として実行
" let g:jedi#force_py_version = 3
" 補完の最初の項目を選択しない
" let g:jedi#popup_select_first = 0
" let g:jedi#popup_on_dot = 0

" ====================================================
" ====================================================
" syntastic
" ====================================================

" let g:syntastic_python_ckeckers = ['pyflakes', 'pep8']
" let g:syntastic_check_on_wq = 0



" ====================================================
" ====================================================
" quickrun
" ====================================================

" quickrun の更新速度
" watckdogs で flake8 を使う （設定しないと pyflakes ）
" watchdogs のフックを設定
" let g:quickrun_config = {
"             \   "_" : {
"             \   },
"             \   "python/watchdogs_checker" : {
"             \       "type" : "watchdogs_checker/pyflakes",
"             \   },
"             \   "go/watchdogs_checker" : {
"             \       "type" : "watchdogs_checker/golint",
"             \   },
"             \   'watchdogs_checker/_' : {
"             \       "runner" : "vimproc",
"             \       "runner/vimproc/updatetime" : 10,
"             \       'outputter/quickfix/open_cmd' : "",
"             \       'hook/qfsigns_update/enable_exit':   1,
"             \       'hook/qfsigns_update/priority_exit': 3,
"             \       'hook/qfstatusline_update/enable_exit' : 1,
"             \       'hook/qfstatusline_update/priority_exit' : 4,
"             \   },
"             \   'watchdogs_checker/flake8' : {
"             \       "cmdopt" : "--ignore=F403,E501",
"             \   },
"             \   'watchdogs_checker/pep8' : {
"             \       "command" : "pep8",
"             \       "cmdopt" : "--ignore=F403,E501",
"             \   },
"             \   'watchdogs_checker/golint' : {
"             \       "command" : "golint",
"             \   },
"             \   'watchdogs_checker/go' : {
"             \       "command" : "go",
"             \       "exec": "%c build %o"
"             \   },
"             \}


" ====================================================
" ====================================================
" watchdogs 関連
" ====================================================

" w で保存後に自動で構文解析
" let g:watchdogs_check_BufWritePost_enable = 1

" wq で終了する際に watchdogs が実行されないようにする
" let g:watchdogs_check_BufWritePost_enable_on_wq = 0

" 一定時間キー入力がなかった場合に構文解析
" let g:watchdogs_check_CursorHold_enable = 1

" let g:Qfstatusline#UpdateCmd = function('lightline#update')

" quickrun_config の設定以降に記載する必要あり
" call watchdogs#setup(g:quickrun_config)



" ====================================================
" ====================================================
" tagbar
" ====================================================

let g:tagbar_width = 35
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" ====================================================
" ====================================================
" vim-go
" ====================================================

" let g:go_fmt_autosave = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1

" ====================================================
" ====================================================
" indentLine
" ====================================================

let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#383C45'
let g:indentLine_color_term = 238
let g:indentLine_char = "¦"
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_leadingSpaceEnabled = 0
