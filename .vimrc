" 基本設定


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
  
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
   
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
		\ 'colorscheme': 'solarized',
		\ }
NeoBundle 'davidhalter/jedi-vim'

call neobundle#end()
	 
" Required:
filetype plugin indent on
	  
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
 " 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
	   
"-------------------------
" End Neobundle Settings.
"-------------------------

" =================================================================
" 見た目に関する設定
" =================================================================

" True color を有効にする
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" シンタックスハイライトをオンにする
syntax enable
set laststatus=2
"
" コマンド（の一部）を画面の最下行に表示する
" set showcmd

" 不可視文字の表示に関する設定
set list
"let &listchars="trail:-,extends:>,precedes:<,nbsp:%,eol:\u00ac,tab:| "
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
let &fillchars="vert:\uffdc,fold:-,diff:="

set t_Co=256
"colorscheme elflord
"colorscheme koehler
"colorscheme molokai
colorscheme hybrid
set background=dark

"set laststatus=r
"NeoBundle 'itchyny/lightline.vim'
"set statusline=%<%f\ %m%r%h%w
"set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
"set statusline+=%=%l/%L,%c%V%8
" ヤンクしたテキストをそのままクリップボードにコピー
set clipboard=unnamed

" タブページを常に表示
set showtabline=2

" カーソル行を強調表示する
set cursorline
" カーソル列を強調表示する
" set cursorcolumn

" 検索結果をハイライト
set hlsearch

set previewheight=5

" longest を設定しないと，popup で最初の要素が選択されてしまう
set completeopt=menu,longest

" プレビューウィンドウを下に表示する
" augroup PreviewOnBottom
"     autocmd InsertEnter * set splitbelow
"     autocmd InsertLeave * set splitbelow!
" augroup END

" 80列目に印をつける
" set colorcolumn=80

set cmdheight=1
" コマンドラインに  -- INSERT --などを表示させない
set noshowmode

" =================================================================
" =================================================================
" 言語に関する設定
" =================================================================
"

" au BufNewFile,BufRead *.py setf py3

" 直接パスを指定しないと pyenv で global が 3 のみの時に動かなくなる
"if has('nvim')
"    let g:python3_host_prog = '/Users/akinori/.pyenv/versions/3.5.1/bin/python3'
"    let g:python_host_prog = '/Users/akinori/.pyenv/versions/2.7.11/bin/python'
"endif

" libpython3.5m.dylib が保存されている場所を指定する
" let $PYTHON3_DLL='/Users/akinori/.pyenv/versions/3.4.3/lib'
" let $PYTHON3_DLL='/Users/akinori/.pyenv/versions/3.5.1/lib'
" let $PYTHON3_DLL='/usr/local/Cellar/python3/3.5.1/Frameworks/Python.framework/Versions/3.5/Python'

" jediを補完に使用する
" autocmd FileType python setlocal omnifunc=jedi#completions

" =================================================================
" =================================================================
" 挙動に関する設定
" =================================================================

if has('vim_starting')
    set encoding=utf-8
    if has("multi_byte")
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        set encoding=utf-8
        setglobal fileencoding=utf-8
        "setglobal bomb
        set fileencodings=ucs-bom,utf-8,latin1
    endif
    scriptencoding utf-8
endif

" 開いたファイルのディレクトリに自動で移動する
" set autochdir だと以下の様な問題がある
" vimshell が動かなくなる
" vimfiler が動かなくなる
" autocmd BufEnter * lcd %:p:h

" スワップファイル用のDirectory
"set directory=~/.config/nvim/swap

" バックスペースの働きについて
" indent    autoindent を超えてバックスペースを働かせる
" eol       改行を超えてバックスペースを働かせる (行を連結する)
" start     挿入区間の始めでバックスペースを働かせるが CTRL-W と CTRL-U は挿入区間の始めでいったん止まる
set backspace=indent,eol,start

" カーソルを左右するときに行頭/末にあるときに前/次行に移動を許可するキーの設定
set whichwrap=b,s,h,l,<,>,[,]

" マウスを有効にする
set mouse=a
set ttymouse=xterm2

" 検索コマンドで入力途中の文字列ににマッチしているものを表示する
set incsearch

" 行番号を表示する
set number

" コマンドを入力する際の補完に関する設定
set wildmenu wildmode=list:full


" インデントに関する設定
set autoindent
set smartindent
" set cindent
" 前回の検索パターンに一致するテキストを強調表示する
set nohlsearch

set clipboard=unnamed

" タブを挿入するとき、代わりに空白を使う
set expandtab
" <Tab> が対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=0
" インデントの各段階に使われる空白の数
set shiftwidth=4
 
" > < でシフトするときに shiftwidth の倍数に調節してくれる
set shiftround

" 対応する括弧をハイライトする
set showmatch
" 対応する括弧に <> を追加
set matchpairs& matchpairs+=<:>

" Swapファイル，Backupファイルを無効化する
set nowritebackup
set nobackup
set noswapfile

" 設定ファイルのリロード
if has('vim_starting')
    function s:reload_vimrc() abort
        execute printf('source %s', $MYVIMRC)
        if has('nvim') == 0 && has('gui_running')
            execute printf('source %s', $MYGVIMRC)
        endif
        redraw
        echo printf('.vimrc/.gvimrc has reloaded (%s).', strftime('%c'))
    endfunction
endif
0
nmap <Leader><Leader>r <Plug>(my-reload-vimrc)


if has("persistent_undo")
    set undodir=~/.config/nvim/.undodir
    set undofile
endif

" カッコ・クオーテーションの補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

" インサートモードでのカーソル移動
imap <c-h> <Left>
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-l> <Right>
