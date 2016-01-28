if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

" Try to add ohm highlighting
syntax include @OHM syntax/ohm.vim
syntax region textSnipOHM start="\m<script \+type=[\"']text/ohm-js[\"']>" end="\V<\/script>" contains=@OHM


if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
  unlet s:current_syntax
else
  unlet b:current_syntax
endif

" syntax sync fromstart
