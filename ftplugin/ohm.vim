function! s:JumpToDef()
  let l:word = expand('<cword>')

  " TODO(nate): make this jump to specific '--' rules as well
  let l:rule_name = substitute(l:word, '_.*', '', '')

  let l:equal = '\(=\|:=\|+=\)'
  let l:regex = '\C\m\<' . l:rule_name . '\>\_s*' . l:equal

  " Save state
  let l:old_search = getreg('/')
  let l:old_view = winsaveview()
  let l:old_buf = bufnr('%')

  " Move there
  silent! buffer .ohm
  let l:result = search(l:regex, 'c')

  " Restore state
  call setreg('/', l:old_search)

  " In case of a failure
  if l:result == 0
    " Extra cleanup in the case of a failure
    silent exe 'buffer' l:old_buf
    call winrestview(l:old_view)
    echohl ErrorMsg | echo 'Unable to find rule for:' l:word | echohl NORMAL
  endif
endfunction

" Command definitions

""
" Goto definition for the rule under the cursor. If you're in a semantic action
" (and you also have the Ohm file open), this will jump across to the Ohm
" grammar.
command! OhmDef call <SID>JumpToDef()
