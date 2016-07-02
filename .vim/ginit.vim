if has('gui_macvim')
    " set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    " set transparency=10 " 透明度を指定
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=e
    set guioptions-=m
    set antialias
    set guifont=Ricty_Diminished:h22
    " set guifont=Roboto_Mono_Light_for_Powerline:h19
    colorscheme fuji_onedark
endif

