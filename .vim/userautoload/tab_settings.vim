
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]
        let no = i
        let mod = getbufvar(bufnr, '&modified') ? '+ ' : '  '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = strlen(title) ? ' ' . title . ' ' : ' Untitled '
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLineSel2') . '#'
        let s .= ' ' . no . ' ' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction

let &tabline = '%!' . s:SID_PREFIX() . 'my_tabline()'

