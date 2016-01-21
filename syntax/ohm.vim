" ---------------------------------------------------------------------------
" Name of the grammar
" ---------------------------------------------------------------------------
syntax match GrammarName '\v^\s*\w+(\s*\{)@=' " no super grammar
syntax match GrammarName '\v^\s*\w+\s*\<:\s*\w+(\s*\{)@=' " with a super grammar
highlight link GrammarName Keyword

" ---------------------------------------------------------------------------
" Comments
" ---------------------------------------------------------------------------
syntax match Comment '\m/\*\_.\{-}\*/'
syntax match Comment '\v\([^)]*\)\_s*\=@='
syntax match Comment '\v//.*'

" syntax match Comment '\m\(\a\+\s*\)\@=(\w\+)'
" ---------------------------------------------------------------------------
" Special name-mangling rule modifier
" ---------------------------------------------------------------------------
syntax match Special '\v--\s*\w+$'

" ---------------------------------------------------------------------------
" Strings
" ---------------------------------------------------------------------------
syntax region String start=/\v"/ skip=/\v\\./ end=/\v"/

" ---------------------------------------------------------------------------
" Operators
" ---------------------------------------------------------------------------
syntax match Operator '\v\='
syntax match Operator '\v:\='
syntax match Operator '\v\+\='

syntax match Operator '\v\|'

syntax match Operator '\v\+'
syntax match Operator '\v\*'
syntax match Operator '\v\?'
syntax match Operator '\v\~'
syntax match Operator '\v\&'
syntax match Operator '\v\.\.'

" Pairs of brackets highlight at the same time
syntax match Operator '\v\<(.*\>)@='
syntax match Operator '\v(\<.*)@<=\>'

" For Super Grammar
syntax match Operator '\v\<:'

" ---------------------------------------------------------------------------
" Grammar rules
" ---------------------------------------------------------------------------
syntax match SyntacticRule '\v<\u\a*>(\_s{-}(\=|:\=|\+\=))@='
syntax match SyntacticRule '\v<\u\a*>(\_s{-}\([^)]*\)\_s{-}(\=|:\=|\+\=))@='
highlight SyntacticRule term=bold cterm=bold ctermfg=lightblue gui=bold guifg=lightskyblue

syntax match LexicalRule '\v<\U\a*>(\_s{-}(\=|:\=|\+\=))@='
syntax match LexicalRule '\v<\U\a*>(\_s{-}\([^)]*\)\_s{-}(\=|:\=|\+\=))@='
highlight LexicalRule term=NONE cterm=NONE ctermfg=lightblue gui=NONE guifg=lightskyblue
