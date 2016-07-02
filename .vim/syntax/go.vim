
syn case match

syn keyword     goErr         err
hi def link     goErr         Special2
" vim-go のコピペ
syn keyword     goDirective         package import
syn keyword     goDeclaration       var const type
syn keyword     goDeclType          struct interface

hi def link     goDirective         Statement
hi def link     goDeclaration       Keyword
hi def link     goDeclType          Keyword

" Keywords within functions
syn keyword     goStatement         defer go goto return break continue fallthrough
syn keyword     goConditional       if else switch select
syn keyword     goLabel             case default
syn keyword     goRepeat            for range

hi def link     goStatement         Statement
hi def link     goConditional       Conditional
hi def link     goLabel             Label
hi def link     goRepeat            Repeat

" Predefined types
syn keyword     goType              chan map bool string error
syn keyword     goSignedInts        int int8 int16 int32 int64 rune
syn keyword     goUnsignedInts      byte uint uint8 uint16 uint32 uint64 uintptr
syn keyword     goFloats            float32 float64
syn keyword     goComplexes         complex64 complex128

hi def link     goType              Type
hi def link     goSignedInts        Type
hi def link     goUnsignedInts      Type
hi def link     goFloats            Type
hi def link     goComplexes         Type

" Treat func specially: it's a declaration at the start of a line, but a type
" elsewhere. Order matters here.
syn match       goDeclaration       /\<func\>/


" Predefined functions and values
syn match       goBuiltins          /\<\v(append|cap|close|complex|copy|delete|imag|len)\ze\(/
syn match       goBuiltins          /\<\v(make|new|panic|print|println|real|recover)\ze\(/
syn keyword     goBoolean           iota true false nil

hi def link     goBuiltins          Keyword
hi def link     goBoolean           Boolean

" Comments; their contents
syn keyword     goTodo              contained TODO FIXME XXX BUG
syn cluster     goCommentGroup      contains=goTodo
syn region      goComment           start="/\*" end="\*/" contains=@goCommentGroup,@Spell
syn region      goComment           start="//" end="$" contains=@goCommentGroup,@Spell

hi def link     goComment           Comment
hi def link     goTodo              Todo

" Go escapes
syn match       goEscapeOctal       display contained "\\[0-7]\{3}"
syn match       goEscapeC           display contained +\\[abfnrtv\\'"]+
syn match       goEscapeX           display contained "\\x\x\{2}"
syn match       goEscapeU           display contained "\\u\x\{4}"
syn match       goEscapeBigU        display contained "\\U\x\{8}"
syn match       goEscapeError       display contained +\\[^0-7xuUabfnrtv\\'"]+

hi def link     goEscapeOctal       goSpecialString
hi def link     goEscapeC           goSpecialString
hi def link     goEscapeX           goSpecialString
hi def link     goEscapeU           goSpecialString
hi def link     goEscapeBigU        goSpecialString
hi def link     goSpecialString     Special
hi def link     goEscapeError       Error

" Strings and their contents
syn cluster     goStringGroup       contains=goEscapeOctal,goEscapeC,goEscapeX,goEscapeU,goEscapeBigU,goEscapeError
syn region      goString            start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@goStringGroup,@Spell
syn region      goRawString         start=+`+ end=+`+ contains=@Spell
syn match       goFormatSpecifier   /%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)*[vTtbcdoqxXUeEfgGsp]/ contained containedin=goString

hi def link     goString            String
hi def link     goRawString         String
hi def link     goFormatSpecifier   goSpecialString

" Characters; their contents
syn cluster     goCharacterGroup    contains=goEscapeOctal,goEscapeC,goEscapeX,goEscapeU,goEscapeBigU
syn region      goCharacter         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@goCharacterGroup

hi def link     goCharacter         Character

" Regions
syn region      goBlock             start="{" end="}" transparent fold
syn region      goParen             start='(' end=')' transparent

" Integers
syn match       goDecimalInt        "\<\d\+\([Ee]\d\+\)\?\>"
syn match       goHexadecimalInt    "\<0x\x\+\>"
syn match       goOctalInt          "\<0\o\+\>"
syn match       goOctalError        "\<0\o*[89]\d*\>"

hi def link     goDecimalInt        Integer
hi def link     goHexadecimalInt    Integer
hi def link     goOctalInt          Integer
hi def link     Integer             Number

" Floating point
syn match       goFloat             "\<\d\+\.\d*\([Ee][-+]\d\+\)\?\>"
syn match       goFloat             "\<\.\d\+\([Ee][-+]\d\+\)\?\>"
syn match       goFloat             "\<\d\+[Ee][-+]\d\+\>"

hi def link     goFloat             Float

" Imaginary literals
syn match       goImaginary         "\<\d\+i\>"
syn match       goImaginary         "\<\d\+\.\d*\([Ee][-+]\d\+\)\?i\>"
syn match       goImaginary         "\<\.\d\+\([Ee][-+]\d\+\)\?i\>"
syn match       goImaginary         "\<\d\+[Ee][-+]\d\+i\>"

hi def link     goImaginary         Number

" included from: https://github.com/athom/more-colorful.vim/blob/master/after/syntax/go.vim
"
" Comments; their contents
syn keyword     goTodo              contained NOTE
hi def link     goTodo              Todo


" Operators;
  " match single-char operators:          - + % < > ! & | ^ * =
  " and corresponding two-char operators: -= += %= <= >= != &= |= ^= *= ==
syn match goOperator /[-+%<>!&|^*=]=\?/
" match / and /=
syn match goOperator /\/\%(=\|\ze[^/*]\)/
" match two-char operators:               << >> &^
" and corresponding three-char operators: <<= >>= &^=
syn match goOperator /\%(<<\|>>\|&^\)=\?/
" match remaining two-char operators: := && || <- ++ --
syn match goOperator /:=\|||\|<-\|++\|--/
" match ...
syn match goOperator /\.\.\./
hi def link     goOperator          Operator

" Functions;
syn match goFunction              /\(func\s\+\)\@<=\w\+\((\)\@=/
syn match goFunction              /\()\s\+\)\@<=\w\+\((\)\@=/
hi def link     goFunction          Function

" Methods;
syn match goMethod                /\(\.\)\@<=\w\+\((\)\@=/
hi def link     goMethod            Method

" Structs;
syn match goStruct                /\(.\)\@<=\w\+\({\)\@=/
syn match goStructDef             /\(type\s\+\)\@<=\w\+\(\s\+struct\s\+{\)\@=/
hi def link     goStruct            Function
hi def link     goStructDef         Function

" Interfaces;
syn match goInterface             /\(.\)\@<=\w\+\({\)\@=/
syn match goInterfaceDef          /\(type\s\+\)\@<=\w\+\(\s\+interface\s\+{\)\@=/
hi def link     goInterface         Function
hi def link     goInterfaceDef      Function
