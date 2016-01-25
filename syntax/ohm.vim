" ---------------------------------------------------------------------------
" Name of the grammar
" ---------------------------------------------------------------------------
syntax match GrammarName '\v^\s*\w+(\_s*\{)@=' " no super grammar
syntax match GrammarName '\v^\s*\w+\_s*\<:\_s*\w+(\_s*\{)@=' " with a super grammar
highlight link GrammarName Keyword

" ---------------------------------------------------------------------------
" Comments
" ---------------------------------------------------------------------------
syntax region Comment start='\V\/*' end='\V*\/'
syntax region Comment start='\v(\a+\_s*)@<=\(' end='\v\)(\_s*\=)@='
syntax match Comment '\v//.*'

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
syntax match SyntacticRule '\v<\u\a*>(\_s{-}\([^)]*\_s{-}(\=|:\=|\+\=))@='

syntax match LexicalRule '\v<\U\a*>(\_s{-}(\=|:\=|\+\=))@='
syntax match LexicalRule '\v<\U\a*>(\_s{-}\([^)]*\)\_s{-}(\=|:\=|\+\=))@='
syntax match LexicalRule '\v<\U\a*>(\_s{-}\([^)]*\_s{-}(\=|:\=|\+\=))@='

" ---------------------------------------------------------------------------
" Specifying highlighting
" ---------------------------------------------------------------------------

highlight SyntacticRule term=bold cterm=bold ctermfg=lightblue gui=bold guifg=lightskyblue
highlight LexicalRule term=NONE cterm=NONE ctermfg=lightblue gui=NONE guifg=lightskyblue
