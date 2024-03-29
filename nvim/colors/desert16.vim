" Name:         desert16
" Description:  Forced 16 bit version of the desert scheme
" Author:       Theodoros Dimakopoulos <dimakopt732@gmail.com>
" Maintainer:   God bless
" Website:      None
" License:      MIT found at the bottom of the file
" Last Updated: Tue Oct  3 18:59:30 EEST 2023

set background=dark

hi clear
let g:colors_name = 'desert16'

let s:t_Co = &t_Co

if (has('termguicolors') && &termguicolors) || has('gui_running')
  " let g:terminal_ansi_colors = ['#7f7f8c', '#cd5c5c', '#9acd32', '#bdb76b', '#75a0ff', '#eeee00', '#cd853f', '#666666', '#8a7f7f', '#ff0000', '#89fb98', '#f0e68c', '#6dceeb', '#ffde9b', '#ffa0a0', '#c2bfa5']
  " Nvim uses g:terminal_color_{0-15} instead
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif
hi! link Terminal Normal
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link EndOfBuffer NonText
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo

hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=darkblue ctermbg=NONE cterm=reverse
hi StatusLineNC ctermfg=NONE ctermbg=NONE cterm=reverse
hi StatusLineTerm ctermfg=NONE ctermbg=NONE cterm=bold,reverse
hi StatusLineTermNC ctermfg=NONE ctermbg=NONE cterm=reverse
hi VertSplit ctermfg=NONE ctermbg=NONE cterm=reverse
hi Pmenu ctermfg=NONE ctermbg=black cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=grey cterm=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuThumb ctermfg=NONE ctermbg=grey cterm=NONE
hi TabLine ctermfg=black ctermbg=grey cterm=NONE
hi TabLineFill ctermfg=NONE ctermbg=grey cterm=NONE
hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=NONE
hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=bold,reverse
hi NonText ctermfg=darkgreen ctermbg=NONE cterm=bold
hi SpecialKey ctermfg=darkyellow ctermbg=NONE cterm=NONE
hi Folded ctermfg=darkgreen ctermbg=NONE cterm=NONE
hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=underline
hi LineNr ctermfg=darkblue ctermbg=NONE cterm=NONE
hi FoldColumn ctermfg=darkblue ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=black ctermbg=darkblue cterm=NONE
hi CursorColumn ctermfg=black ctermbg=darkblue cterm=NONE
hi CursorLineNr ctermfg=darkblue ctermbg=NONE cterm=bold
hi QuickFixLine ctermfg=black ctermbg=darkblue cterm=NONE
hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
hi Error ctermfg=darkred ctermbg=grey cterm=reverse
hi ErrorMsg ctermfg=darkred ctermbg=grey cterm=reverse
hi ModeMsg ctermfg=darkmagenta ctermbg=NONE cterm=bold
hi WarningMsg ctermfg=darkred ctermbg=NONE cterm=bold
hi MoreMsg ctermfg=darkyellow ctermbg=NONE cterm=bold
hi Question ctermfg=darkyellow ctermbg=NONE cterm=bold
hi Todo ctermfg=darkred ctermbg=darkmagenta cterm=NONE
hi MatchParen ctermfg=white ctermbg=black cterm=NONE
hi Search ctermfg=black ctermbg=darkyellow cterm=NONE
hi IncSearch ctermfg=NONE ctermbg=NONE cterm=reverse
hi WildMenu ctermfg=black ctermbg=darkmagenta cterm=NONE
hi ColorColumn ctermfg=white ctermbg=darkred cterm=NONE
hi debugPC ctermfg=white ctermbg=NONE cterm=reverse
hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
hi SpellBad ctermfg=darkred ctermbg=darkblue cterm=reverse
hi SpellCap ctermfg=darkgreen ctermbg=grey cterm=reverse
hi SpellLocal ctermfg=darkblue ctermbg=NONE cterm=reverse
hi SpellRare ctermfg=darkyellow ctermbg=NONE cterm=reverse
hi Comment ctermfg=darkred ctermbg=NONE cterm=bold
hi Identifier ctermfg=darkcyan ctermbg=NONE cterm=NONE
hi Statement ctermfg=darkgreen ctermbg=NONE cterm=bold
hi Constant ctermfg=darkyellow ctermbg=NONE cterm=NONE
hi PreProc ctermfg=darkred ctermbg=NONE cterm=NONE
hi Type ctermfg=darkblue ctermbg=NONE cterm=bold
hi Special ctermfg=darkmagenta ctermbg=NONE cterm=bold
hi Directory ctermfg=darkgreen ctermbg=NONE cterm=bold
hi Conceal ctermfg=white ctermbg=NONE cterm=NONE
hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
hi Title ctermfg=darkred ctermbg=NONE cterm=bold
hi DiffAdd ctermfg=darkgreen ctermbg=NONE cterm=NONE
hi DiffChange ctermfg=darkyellow ctermbg=NONE cterm=NONE
hi DiffText ctermfg=grey ctermbg=NONE cterm=NONE
hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
unlet s:t_Co
finish


" Copyright (c) 2023 Dimakopoulos Theodoros
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" vim: et ts=2 sw=2
