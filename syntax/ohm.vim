if exists('b:current_syntax')
  finish
endif

" ---------------------------------------------------------------------------
" Major regions
" ---------------------------------------------------------------------------
syntax cluster OhmFile contains=GrammarName,OhmGrammar
syntax region OhmGrammar start='\V{' end='\V}'
    \ contains=OhmComment,SyntacticRule,LexicalRule,CaseName,RuleDescription,OhmOperator,OhmString,OhmKeyword,RuleModifer

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
syntax region CaseName start='\v--\s*\a' end='\v(\/\/|\/\*|\s)' keepend

" ---------------------------------------------------------------------------
" Strings
" ---------------------------------------------------------------------------
syntax region OhmString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=OhmEscapeSequence
syntax match OhmEscapeSequence '\v\\.' contained

" ---------------------------------------------------------------------------
" Operators
" ---------------------------------------------------------------------------

" For normal rules
syntax match OhmOperator '\v(\=|:\=|\+\=)'
syntax match OhmOperator '\v\|'
syntax match OhmOperator '\v(\+|\*|\~|\&|\.\.|\?)'
syntax match OhmOperator '\v#(\()@='

" Pairs of brackets highlight at the same time
syntax match OhmOperator '\v\<(.*\>)@='
syntax match OhmOperator '\v(\<.*)@<=\>'
syntax match OhmOperator '\v(\<.*)@<=,(.*\>)@='

" For Super Grammar
syntax match OhmOperator '\v\<:'

" ---------------------------------------------------------------------------
" Keywords
" ---------------------------------------------------------------------------

syntax keyword OhmKeyword ListOf EmptyListOf NonemptyListOf
syntax keyword OhmKeyword listOf emptyListOf nonemptyListOf
syntax keyword OhmKeyword any letter lower upper digit hexDigit alnum space end

" ---------------------------------------------------------------------------
" Grammar rules
" ---------------------------------------------------------------------------
let s:pref = '\v<\'
let s:syn  = 'u'
let s:lex  = 'U'
let s:name = '\w*>('
let s:mod  = '(\<\w+\>)?\_s{-}'
let s:desc = '\([^)]*\)?\_s{-}'
let s:op   = '(\=|:\=|\+\=))@='

exe "syntax match SyntacticRule '" . s:pref . s:syn . s:name . s:op . "'"
exe "syntax match SyntacticRule '" . s:pref . s:syn . s:name . s:mod . s:op . "'"
exe "syntax match SyntacticRule '" . s:pref . s:syn . s:name . s:desc . s:op . "'"
exe "syntax match SyntacticRule '" . s:pref . s:syn . s:name . s:mod . s:desc . s:op . "'"

exe "syntax match LexicalRule '" . s:pref . s:lex . s:name . s:op . "'"
exe "syntax match LexicalRule '" . s:pref . s:lex . s:name . s:mod . s:op . "'"
exe "syntax match LexicalRule '" . s:pref . s:lex . s:name . s:desc . s:op . "'"
exe "syntax match LexicalRule '" . s:pref . s:lex . s:name . s:mod . s:desc . s:op . "'"

" ---------------------------------------------------------------------------
" Specifying highlighting
" ---------------------------------------------------------------------------

highlight default link GrammarName Keyword
highlight default link OhmComment Comment
highlight default link RuleDescription Comment
highlight default link CaseName Special
highlight default link OhmString String
highlight default link OhmEscapeSequence Special
highlight default link OhmOperator Operator
highlight default link OhmKeyword Type

highlight default SyntacticRule term=bold cterm=bold ctermfg=lightblue gui=bold guifg=lightskyblue
highlight default LexicalRule term=NONE cterm=NONE ctermfg=lightblue gui=NONE guifg=lightskyblue

let b:current_syntax = "ohm"
