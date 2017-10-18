function! LoadSession()
   if filereadable("./.session.vim")
       source ./.session.vim
   endif
endfunction
