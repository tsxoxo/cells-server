let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/web/7guis/cells/server
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 app.js
argglobal
%argdel
$argadd .
edit app.js
argglobal
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer>  D <Cmd>Telescope diagnostics bufnr=0
xnoremap <buffer> <silent> =r <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.rhs','textobjects','x')
onoremap <buffer> <silent> =r <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.rhs','textobjects','o')
xnoremap <buffer> <silent> =a <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.outer','textobjects','x')
onoremap <buffer> <silent> =a <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.outer','textobjects','o')
xnoremap <buffer> <silent> =i <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.inner','textobjects','x')
onoremap <buffer> <silent> =i <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.inner','textobjects','o')
xnoremap <buffer> <silent> =l <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.lhs','textobjects','x')
onoremap <buffer> <silent> =l <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@assignment.lhs','textobjects','o')
xnoremap <buffer> <silent> ac <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer','textobjects','x')
onoremap <buffer> <silent> ac <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer','textobjects','o')
xnoremap <buffer> <silent> am <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer','textobjects','x')
onoremap <buffer> <silent> am <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer','textobjects','o')
xnoremap <buffer> <silent> af <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@call.outer','textobjects','x')
onoremap <buffer> <silent> af <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@call.outer','textobjects','o')
xnoremap <buffer> <silent> aa <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.outer','textobjects','x')
onoremap <buffer> <silent> aa <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.outer','textobjects','o')
xnoremap <buffer> <silent> al <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.outer','textobjects','x')
onoremap <buffer> <silent> al <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.outer','textobjects','o')
xnoremap <buffer> <silent> ai <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@conditional.outer','textobjects','x')
onoremap <buffer> <silent> ai <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@conditional.outer','textobjects','o')
xnoremap <buffer> <silent> ic <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner','textobjects','x')
onoremap <buffer> <silent> ic <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner','textobjects','o')
xnoremap <buffer> <silent> il <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.inner','textobjects','x')
onoremap <buffer> <silent> il <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.inner','textobjects','o')
xnoremap <buffer> <silent> ia <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.inner','textobjects','x')
onoremap <buffer> <silent> ia <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.inner','textobjects','o')
xnoremap <buffer> <silent> im <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner','textobjects','x')
onoremap <buffer> <silent> im <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner','textobjects','o')
xnoremap <buffer> <silent> ii <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@conditional.inner','textobjects','x')
onoremap <buffer> <silent> ii <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@conditional.inner','textobjects','o')
xnoremap <buffer> <silent> if <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@call.inner','textobjects','x')
onoremap <buffer> <silent> if <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@call.inner','textobjects','o')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal completeslash=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=\\(^\\s*(*async\\s\\+function\\|(*function\\)\\|^\\s*\\(\\*\\|static\\|async\\|get\\|set\\|\\i\\+\\.\\)\\|^\\s*\\(\\ze\\i\\+\\)\\(([^)]*).*{$\\|\\s*[:=,]\\)\\|^\\s*\\(export\\s\\+\\|export\\s\\+default\\s\\+\\)*\\(var\\|let\\|const\\|function\\|class\\)\\|\\<as\\>
setlocal nodiff
setlocal eventignorewin=
setlocal expandtab
if &filetype != 'javascript'
setlocal filetype=javascript
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=jcroql
setlocal iminsert=0
setlocal imsearch=-1
setlocal includeexpr=
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0],0)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal list
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal path=.,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal shiftwidth=2
setlocal signcolumn=yes
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_transitional_lualine_a_command_to_lualine_b_command#%#lualine_b_command#\ \ main\ %#lualine_b_diff_removed_command#\ -5\ %#lualine_b_command#%#lualine_b_diagnostics_hint_command#\ 󰌶\ 3\ %#lualine_transitional_lualine_b_diagnostics_hint_command_to_lualine_c_normal#%<%#lualine_c_normal#\ app.js\ %#lualine_c_normal#%=%#lualine_transitional_lualine_b_command_to_lualine_c_normal#%#lualine_b_command#\ 78%%\ %#lualine_transitional_lualine_a_command_to_lualine_b_command#%#lualine_a_command#\ \ 25:1\ \ 
setlocal suffixesadd=.js,.jsx,.es,.es6,.cjs,.mjs,.jsm,.vue,.json
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal textwidth=0
setlocal undofile
setlocal varsofttabstop=
setlocal vartabstop=
setlocal winblend=0
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 25 - ((24 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 25
normal! 0
lcd ~/dev/web/7guis/cells/server
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
