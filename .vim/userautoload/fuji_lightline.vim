" =============================================================================
" Filename: fuji_lightline.vim
" Author: fujinori
" License: MIT License
" Last Change: 2016/02/01 10:20:00.
" =============================================================================
"

let s:background = [ '#282C34', 235 ]
let s:white400 = [ '#CCCCD4', 254 ]
let s:white300 = [ '#777788', 253 ]
let s:yellow400 = [ '#ffee58', 253 ]
let s:red400 = [ '#ef5350', 204 ]
let s:blue400 = [ '#42a5f5', 39 ]
let s:lightblue400 = [ '#29b6f6', 253 ]
let s:green250 = [ '#98C379', 253 ]
let s:green400 = [ '#66bb6a', 253 ]
let s:greenA400 = [ '#00e676', 253 ]
let s:green = [ '#00e676', 253 ]
let s:teal300 = [ '#4db6ac', 113 ]
let s:teal400 = [ '#26a69a', 113 ]
let s:tealA400 = [ '#1de9b6', 113 ]
let s:tealA500 = [ '#0dc976', 113 ]
let s:tealA700 = [ '#00bf15', 113 ]
let s:lime400 = [ '#d4e157', 253 ]
let s:amber300 = [ '#ffd54f', 180 ]
let s:amber400 = [ '#ffc107', 180 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:blue400, s:background, 'bold' ], [ s:white400, s:background ] ]
let s:p.normal.right = [ [ s:amber400, s:background, 'bold' ], [ s:white400, s:background ] ]
let s:p.inactive.right = [ [ s:white400, s:background ], [ s:white400, s:background ] ]
let s:p.inactive.left =  [ [ s:white400, s:background ], [ s:white400, s:background ] ]
let s:p.insert.left = [ [ s:tealA500, s:background, 'bold' ], [ s:white400, s:background ] ]
let s:p.replace.left = [ [ s:red400, s:background, 'bold' ], [ s:white400, s:background ] ]
let s:p.visual.left = [ [ s:yellow400, s:background, 'bold' ], [ s:white400, s:background ] ]
let s:p.normal.middle = [ [ s:white400, s:background ] ]
let s:p.inactive.middle = [ [ s:white400, s:background ] ]
let s:p.tabline.left = [ [ s:white300, s:background ] ]
let s:p.tabline.tabsel = [ [ s:white400, s:background, 'bold' ] ]
let s:p.tabline.middle = [ [ s:white400, s:background ] ]
let s:p.tabline.right = [ [ s:white400, s:background, 'bold' ] ]
let s:p.normal.error = [ [ s:white400, s:background, 'bold' ] ]
let s:p.normal.warning = [ [ s:white400, s:background ] ]

let g:lightline#colorscheme#fuji_lightline#palette = lightline#colorscheme#flatten(s:p)

