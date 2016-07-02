if 0 | endif


" これを設定するだけで爆速になった

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

runtime! userautoload/plugins.vim
" Required:
call neobundle#end()

NeoBundleCheck


runtime! userautoload/settings.vim
runtime! userautoload/keymap.vim
runtime! userautoload/tab_settings.vim
runtime! userautoload/lightline.vim
filetype plugin indent on
runtime! userautoload/plugins_settings.vim

" runtime! userautoload/*.vim
" ファイルの最後に書く
" 途中に書くと結果的に indent が off になる可能性が高い
" そうなるとインデントがうまくされなくてイライラすることになる
