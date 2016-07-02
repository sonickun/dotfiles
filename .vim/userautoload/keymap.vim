

" ====================================================
" 基本的なキーマップ
" ====================================================

let mapleader = "\<Space>"

" ノーマルモード ==============================

" マクロに使用するキー
nmap ` @
nmap <F2> <ESC>qz
nmap <F3> @z

" nmap q :q<CR>
nmap <Leader>w :w<CR>

nmap ; $
vmap ; $
nnoremap Y y$

nnoremap <BS> i<BS><ESC>

" 通常の検索で very magic を使う
" nnoremap / /\v
" 上下移動に関する設定（表示上の次行か改行コードを意識した次行か）
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

" tags ファイルを使って定義元へジャンプ
nnoremap <C-]> :exe("tjump ".expand('<cword>'))<CR>

" 保存して閉じると保存せずに閉じるの無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" Ex モードの起動の無効化
nnoremap Q <Nop>

" エンターで次行挿入
nnoremap <CR> o<Esc>

nnoremap <Space><CR> O<Esc>

" ヘルプを呼び出しやすくする
nnoremap <f1> :<C-u>help<Space>
inoremap <f1> <Esc>:<C-u>help<Space>

" 検索結果を画面中央に表示
nnoremap n nzz
nnoremap N Nzz

nnoremap <silent> <Space>v :VimShell<CR>

inoremap <silent> <C-e> <ESC>
noremap <silent> <C-e> <ESC>

noremap <silent> <Leader>s :Switch<CR>

noremap <silent> <Leader>e :FyntaxToggle<CR>

" インサートモード ============================
"
inoremap {<CR> {}<Left><CR><ESC><S-o>
inoremap [<CR> []<Left><CR><ESC><S-o>
inoremap (<CR> ()<Left><CR><ESC><S-o>

" <C-e> で次行の内容をそのまま入力できる
" <C-r> 後に " や / を入力するとノーマルモードに戻らなくてもレジスタの内容を貼り付けられる


" ビジュアルモード ============================
vnoremap < <gv
vnoremap > >gv

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" 選択箇所にペーストする際にバッファを上書きしないようにする
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()


" コマンドモード ==============================
"
" 現在編集中のファイルのパスが展開される
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" ポップアップ表示時のキーマップ
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
if has('nvim')
    inoremap <expr><C-h>  deoplete#smart_close_popup()."\<C-h>"
else
    inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
endif

imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
xmap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

" Quickfix を q で閉じれるようにする
au FileType qf nnoremap <silent><buffer>q :quit<CR>

" ターミナルモード ============================

" tnoremap <C-w>h <C-><C-n><C-w>h
" tnoremap <C-w>j <C-><C-n><C-w>j
" tnoremap <C-w>k <C-><C-n><C-w>k
" tnoremap <C-w>l <C-><C-n><C-w>l

" ====================================================
" ====================================================
" タブ操作に関するキーマップ
" ====================================================

nnoremap [Tag] <Nop>
nmap c [Tag]
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]' .n ':<C-u>tabnext' .n '<CR>'
endfor

" 最後尾に新規タブの作成
map <silent> [Tag]M :<C-u>tablast <bar> tabnew<CR>
" 新規タブの作成
map <silent> [Tag]m :<C-u>tabnew<CR>

" タブの移動
map <silent> [Tag]n :<C-u>tabnext<CR>
map <silent> [Tag]p :<C-u>tabprevious<CR>

" 全タブの保存
map <silent> [Tag]ww :<C-u>tabdo w<CR>
" 全タブを保存して終了
map <silent> [Tag]wq :<C-u>tabdo wq<CR>
" 全タブを保存せずに終了
map <silent> [Tag]qq :<C-u>tabdo q!<CR>


" ペインの分割
map <silent> ,s :<C-u>split<CR>
map <silent> ,v :<C-u>vsplit<CR>

" ペイン関連の keymap は Alt + 各キー
" map ˚ <C-w>k    -->    <Alt-k>
"
" ペインの移動
map ˚ <C-w>k
map ¬ <C-w>l
map ˙ <C-w>h
map ∆ <C-w>j

" ペインのサイズを揃える
map ± <C-w>=

" ペインのサイズを変更する
map ≠ <C-w>+
map – <C-w>-
map ≥ <C-w>>
map ≤ <C-w><


" ====================================================
" ====================================================
" Unite.vim
" ====================================================

nnoremap [unite] <Nop>
nmap <Leader> [unite]
nnoremap <silent> [unite]b :<C-u>Unite buffer -ignorecase -smartcase<CR>
nnoremap <silent> [unite]f :<C-u>Unite file -ignorecase -smartcase<CR>
nnoremap <silent> [unite]d :<C-u>Unite neomru/file -ignorecase -smartcase<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark -ignorecase -smartcase<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" nnoremap <silent> [unite]t :<C-u>Unite tab<CR>

nnoremap <silent> [unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>

" 通常の検索の代わりに使う
nnoremap <silent> [unite]/ :lcd %:p:h<CR>:<C-u>Unite grep:% -buffer-name=search-buffer<CR>

" ====================================================
" ====================================================
" vimfiler.vim
" ====================================================
"
nnoremap <silent> [unite]i :<C-u>VimFilerBufferDir -split -simple -winwidth=28 -force-hide<CR>
nnoremap <silent> [unite]o :<C-u>VimFilerBufferDir -quit<CR>
"

" ====================================================
" ====================================================
" undotree.vim
" ====================================================

nnoremap <silent> [unite]u :<C-u>UndotreeToggle<CR>


" ====================================================
" ====================================================
" easymotion.vim
" ====================================================
"
" デフォルトのキーマップを無効化
let g:EasyMotion_do_mapping = 0
nmap ' <Plug>(easymotion-s2)


" ====================================================
" ====================================================
" vim-easy-align.vim
" ====================================================

vmap <CR> <Plug>(EasyAlign)

" ====================================================
" ====================================================
" vim-over
" ====================================================

nnoremap <silent> ,m :OverCommandLine<CR>%s/

" ====================================================
" ====================================================
" quickrun
" ====================================================

" デフォルトのキーマップを無効化
let g:quickrun_no_default_key_mappings=1

" 保存してから quickrun を実行
nnoremap ,r :write<CR>:QuickRun -mode n<CR>        
xnoremap ,r :<C-U>write<CR>gv:QuickRun -mode v<CR> 

" <C-c> で quickrun を停止
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" ====================================================
" ====================================================
" caw
" ====================================================

" ,, でコメントアウトの切り替え
nmap ,, <Plug>(caw:i:toggle)
vmap ,, <Plug>(caw:i:toggle)


" ====================================================
" ====================================================
" tabbar
" ====================================================

nmap <silent> [unite]l :TagbarToggle<CR>

" ====================================================
" ====================================================
" table-mode
" ====================================================

let g:table_mode_disable_mappings = 1
nmap <silent> tm :TableModeToggle<CR>
nmap <Leader>t <Plug>(table-mode-tableize)
xmap <Leader>t <Plug>(table-mode-tableize)

