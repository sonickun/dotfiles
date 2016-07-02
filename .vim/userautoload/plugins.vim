
" call neobundle#begin(expand('~/.config/nvim/bundle/'))

" if neobundle#load_cache()
    " 機能に関するプラグイン ==============================
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }

" vim で使用できる shell
NeoBundle 'Shougo/vimshell.vim'

" いろいろできるやつ
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'

" ファイラー
NeoBundle 'Shougo/vimfiler'

" 補完関連
" if has('nvim')
"     NeoBundleLazy 'Shougo/deoplete.nvim', {
"         \   'autoload': {'insert': 1}}
" else
"     NeoBundleLazy 'Shougo/neocomplete.vim', {
"         \   'autoload': {'insert': 1}}
" endif
if has('nvim')
    NeoBundle 'Shougo/deoplete.nvim'
else
    NeoBundle 'Shougo/neocomplete.vim'
endif
" NeoBundle 'zchee/deoplete-go'

" NeoBundle 'Shougo/echodoc', '', 'default'
" call neobundle#config('echodoc', {
"       \ 'lazy' : 1,
"       \ 'autoload' : {
"       \ 'insert' : 1,
"       \ }})


" スニペット一覧
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'


" 各ヘルプの日本語ドキュメントを追加
NeoBundle 'vim-jp/vimdoc-ja'

" ag で検索可能にする
NeoBundle 'rking/ag.vim'

" undo redo の履歴を視覚化する
NeoBundle 'mbbill/undotree'

" 入力した２文字が存在する場所へのリンクを表示
NeoBundle 'Lokaltog/vim-easymotion'

" cs'" ''で囲まれたものを "" に変換
" yss' で列全体を '' で囲う
" ysiw' でカーソル上の単語を '' で囲う
NeoBundle 'tpope/vim-surround'

" csv 整形したり，プログラム中の式を '=' を基準にして左揃えするとか
NeoBundle 'junegunn/vim-easy-align'
" NeoBundle 'Align'

" 構文解析してエラーとか表示してくれる
" NeoBundle 'scrooloose/syntastic'

" 一斉置換用プラグイン
NeoBundle 'osyo-manga/vim-over'


" 特定の単語を変換出来る 
" True <--> False
NeoBundle 'AndrewRadev/switch.vim'

" Migemo (ローマ字のまま日本語をインクリメンタル検索できる) を使用するためのもの
" NeoBundle 'osyo-manga/vim-vigemo'

" Vim の多重起動を回避する (neovim では使えない)
" NeoBundle 'thinca/vim-singleton'
"
" スクリプトを実行する
NeoBundle 'thinca/vim-quickrun'

" Vim のバイナリエディタ化 (cuiでの使用は非推奨)
NeoBundleLazy 'Shougo/vinarise', {
    \ 'autoload': {
        \ 'commands': ['Vinarise'],},
\}
" NeoBundle 'Shougo/vinarise'

" コメントアウト簡易化用
NeoBundle 'tyru/caw.vim'

" 構文解析用 非同期
" NeoBundle 'osyo-manga/shabadou.vim'
" NeoBundle 'osyo-manga/vim-watchdogs'

" 構文解析の結果をコマンドラインに表示
" NeoBundle 'dannyob/quickfixstatus'

" NeoBundle 'KazuakiM/vim-qfstatusline'
" NeoBundle 'KazuakiM/vim-qfsigns'

" NeoBundle 'cohama/vim-hier'

" tag のリストを表示するプラグイン
NeoBundle 'majutsushi/tagbar'

" table-mode を使用可能にするプラグイン
NeoBundle 'dhruvasagar/vim-table-mode'

" git 用便利プラグイン
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'thinca/vim-ref'

NeoBundle 'terryma/vim-expand-region'

" =====================================================
" =====================================================
" Python 関連 =========================================
"
" Python の補完をしてくれる
" NeoBundleLazy 'davidhalter/jedi-vim', {
"     \ 'autoload': {'filetypes': ['python', 'python3'],},
" \}
NeoBundle 'davidhalter/jedi-vim'

" pep8 に従った書式に修正してくれる
" NeoBundleLazy 'tell-k/vim-autopep8', {
"     \ 'autoload': {'filetypes': ['python', 'python3'],},
" \}
" NeoBundle 'tell-k/vim-autopep8'
NeoBundleLazy 'tell-k/vim-autopep8', {
    \ 'autoload': {
        \ 'commands': ['Autopep8'],},
\}

" =====================================================
" =====================================================

" =====================================================
" =====================================================
" Go 関連 =========================================

" NeoBundle 'garyburd/vigor'
" GO 言語用のプラグイン
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'nsf/gocode', {'rtp': 'nvim'}
" NeoBundle 'fatih/vim-go'

" =====================================================
" =====================================================


" 見た目に関するプラグイン ============================

" cterm 用のカラーマップを確認できる
" XtermColorTable
NeoBundle 'guns/xterm-color-table.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'jscappini/material.vim'
" NeoBundle 'Konstruktionist/vim'
" NeoBundle 'mhartington/oceanic-next'

" カラースキーム
" NeoBundle 'joshdick/onedark.vim'
" NeoBundle 'mkarmona/colorsbox'

" インデントガイドを表示
" NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'

" ステータスラインをかっこ良くする
NeoBundle 'itchyny/lightline.vim'

" json 用のカラースキーム
NeoBundle 'elzr/vim-json'

" ミニマップ表示 (使いものにならない) 
" NeoBundle 'severin-lemaignan/vim-minimap'
" NeoBundle 'koron/minimap-vim'

" =====================================================
" =====================================================

"     NeoBundleSaveCache
" endif

" call neobundle#end()
