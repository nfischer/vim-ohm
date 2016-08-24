function! s:JumpToDef(...)
  if a:0 >= 1
    let l:word = a:1
  else
    let l:word = expand('<cword>')
  endif

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
" @usage [rule_name]
" Go to the definition for <rule_name>. If this is left blank, this instead uses
" the name under the cursor. If you're in your semantic action file (and you
" also have the .ohm file open), this will jump across to the Ohm grammar. By
" default, this is also mapped to <CTRL-]>
command! -nargs=? OhmDef call <SID>JumpToDef(<f-args>)

if !exists('g:ohm#enable_mappings') || g:ohm#enable_mappings == 1
  nnoremap <buffer> <silent> <c-]> :OhmDef<CR>
endif

""
" @setting g:ohm#enable_mappings
" Set this to 0 in order to disable mappings
