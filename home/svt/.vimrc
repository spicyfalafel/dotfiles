let mapleader = " "

set number

" === Colemak Mod-DHM ===

"Colemak mnei(hjkl) t(i) <C-n>(f) <C-e>(e)
noremap s h|        "move Left
noremap n gj|       "move Down
noremap e gk|       "move Up
noremap t l|        "move Right
noremap E e|        "end of word      replaces (e)nd
noremap h n|        "next match       replaces (n)ext
noremap h N|        "previous match   replaces (N) prev
noremap <C-m> m|    "mark             replaces (m)ark

" noremap <C-n> <C-f>| "Page down
" noremap <C-e> <C-b>H| "Page up, cursor up

" below: not remapping, just fixing sequences:
" fix (i)nner and (t)ill, e.g. (c)hange (i)n (w)ord
nnoremap ci ci|
nnoremap di di|
nnoremap vi vi|
nnoremap yi yi|
nnoremap ct ct|
nnoremap dt dt|
nnoremap vt vt|
nnoremap yt yt|


