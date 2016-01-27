" ---------------------------------------------------------------------------
" Major regions
" ---------------------------------------------------------------------------
syntax cluster OhmFile contains=GrammarName,OhmGrammar
syntax region OhmGrammar start='\V{' end='\V}' contains=OhmComment,SyntacticRule,LexicalRule,CaseName,RuleDescription,OhmOperator,OhmString

" ---------------------------------------------------------------------------
" Name of the grammar
" ---------------------------------------------------------------------------
syntax match GrammarName '\v^\s*\w+(\_s*\{)@=' " no super grammar
syntax match GrammarName '\v^\s*\w+\_s*\<:\_s*\w+(\_s*\{)@=' " with a super grammar
" ---------------------------------------------------------------------------
" Comments
" ---------------------------------------------------------------------------
syntax region OhmComment start='\V\/*' end='\V*\/' contains=@Spell
syntax region OhmComment start='\v//' end='\v$' contains=@Spell
syntax match RuleDescription '\v(\a+\_s*)@<=\([^)]*\)(\_s*\=)@=' contains=@Spell

" ---------------------------------------------------------------------------
" Special name-mangling rule modifier
" ---------------------------------------------------------------------------
syntax region CaseName start='\v--\s*' end='\v$' keepend

" ---------------------------------------------------------------------------
" Strings
" ---------------------------------------------------------------------------
syntax region OhmString start=/\v"/ skip=/\v\\./ end=/\v"/

" ---------------------------------------------------------------------------
" Operators
" ---------------------------------------------------------------------------
syntax match OhmOperator '\v\='
syntax match OhmOperator '\v:\='
syntax match OhmOperator '\v\+\='

syntax match OhmOperator '\v\|'

syntax match OhmOperator '\v\+'
syntax match OhmOperator '\v\*'
syntax match OhmOperator '\v\?'
syntax match OhmOperator '\v\~'
syntax match OhmOperator '\v\&'
syntax match OhmOperator '\v\.\.'

" Pairs of brackets highlight at the same time
syntax match OhmOperator '\v\<(.*\>)@='
syntax match OhmOperator '\v(\<.*)@<=\>'

" For Super Grammar
syntax match OhmOperator '\v\<:'

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

highlight default link GrammarName Keyword

highlight default link OhmComment Comment
highlight default link RuleDescription Comment

highlight default link CaseName Special

highlight default link OhmString String

highlight default link OhmOperator Operator

highlight default SyntacticRule term=bold cterm=bold ctermfg=lightblue gui=bold guifg=lightskyblue
highlight default LexicalRule term=NONE cterm=NONE ctermfg=lightblue gui=NONE guifg=lightskyblue

let b:current_syntax = 'ohm'
