function! s:GetName(array)
  return len(a:array) >= 1 ? a:array[0] : expand('<cword>')
endfunction

function! s:JumpToSemantics(...)
  let l:rule_name = s:GetName(a:000)

  let l:colon = ':'

  let l:regex = '\C\m\<' . l:rule_name . '\>\_s*' . l:colon
  let l:extension = '.js'
  let l:ret = s:JumpToRegex(l:regex, l:extension)

  if l:ret == 1
    echohl ErrorMsg | echo 'Make sure you have the sematic actions file opened in vim' | echohl NORMAL
  elseif l:ret == 2
    echohl ErrorMsg | echo 'Unable to find semantic action for:' l:rule_name | echohl NORMAL
  endif
endfunction

function! s:JumpToDef(...)
  let l:word = s:GetName(a:000)

  " TODO(nate): make this jump to specific '--' rules as well
  let l:rule_name = substitute(l:word, '_.*', '', '')

  let l:equal = '\(=\|:=\|+=\)'

  let l:regex = '\C\m\<' . l:rule_name . '\>\_s*' . l:equal
  let l:extension = '.ohm'
  let l:ret = s:JumpToRegex(l:regex, l:extension)

  if l:ret == 1
    echohl ErrorMsg | echo 'Unable to find ' . l:extension .' file' | echohl NORMAL
  elseif l:ret == 2
    echohl ErrorMsg | echo 'Unable to find rule for:' l:word | echohl NORMAL
  endif
endfunction

function! s:JumpToRegex(regex, extension)
  " Save state
  let l:old_search = getreg('/')
  let l:old_view = winsaveview()
  let l:old_buf = bufnr('%')

  " Move there
  try
    exe 'buffer' a:extension
  catch
    return 1
  endtry
  let l:result = search(a:regex, 'c')

  " Restore state
  call setreg('/', l:old_search)

  " In case of a failure
  if l:result == 0
    " Extra cleanup in the case of a failure
    silent exe 'buffer' l:old_buf
    call winrestview(l:old_view)
    return 2
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

""
" @usage [rule_name]
" Go to the semantic action for <rule_name>. If this is left blank, this instead
" uses the name under the cursor. If you're in your grammar file (and you also
" have the semantic action file open), this will jump across to the file.
command! -nargs=? OhmSem call <SID>JumpToSemantics(<f-args>)

if !exists('g:ohm#enable_mappings') || g:ohm#enable_mappings == 1
  nnoremap <buffer> <silent> <c-]> :OhmDef<CR>
endif

""
" @setting g:ohm#enable_mappings
" Set this to 0 in order to disable mappings
