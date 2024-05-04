" =============================================================================
" FileName  /Users/insert/.local/share/nvim/site/pack/packer/start/lightline.vim/autoload/lightline/colorscheme/vulbyteTheme.vim
" Author: vulbyte
" Last Change: 2024/05/04.
" =============================================================================

" I HAVE NO IDEA WHAT THE NUMBERS AFTER THE HEX-CODES MEAN
" chatGPT said it was likely brightness? so i suppose i'll follow that pattern
"
" ############################################################
"                           colors
" ############################################################

" Original Colors 
let s:base03 =          [ '#242424', 235 ] " ~black
let s:base023 =         [ '#353535', 236 ] " ~dark gray 
let s:base02 =          [ '#444444', 238 ] " ~dark gray
let s:base01 =          [ '#585858', 240 ] " ~dark gray
let s:base00 =          [ '#666666', 242 ] " ~gray
let s:base0 =           [ '#808080', 244 ] " ~gray
let s:base1 =           [ '#969696', 247 ] " ~gray
let s:base2 =           [ '#a8a8a8', 248 ] " ~light gray
let s:base3 =           [ '#d0d0d0', 252 ] " ~light gray

let s:vulb =            [ '#ff0051', 120 ] " for focused tab bg

" REPLACE ≈ red
    " shifted to be a bit more pastel
let s:darkRed =         [ '#770000', 070 ] " 
let s:red =             [ '#ff7777', 203 ] " REPLACE
let s:lightRed =        [ '#ffaaaa', 240 ] "

" INACTIVE TABS ≈ orange
let s:darkOrange =      [ '#773300', 033 ] "
let s:orange =          [ '#ffaa55', 173 ] " INACTIVE TAB(S)
let s:lightOrange =     [ '#ffcc99', 033 ] "

let s:darkYellow =      [ '#aaaa00', 074 ] "
let s:yellow =          [ '#ffff55', 180 ] "
let s:lightYellow =     [ '#eeffcc', 233 ] "

" TERMINAL ≈ green
    " an omage to the old af days
    " a touch of blue to help make the colors seem a little nicer
let s:darkGreen =       [ '#005506', 090 ] " 
let s:green =           [ '#00dd60', 250 ] " TERMINAL
let s:lightGreen =      [ '#99ffaa', 200 ] " 

" VISUAL ≈ cyan
    " OFFSET THE NEUTRAL     COLORS TO BE EASIER ON THE EYES
let s:darkCyan =        [ '#226666', 062 ] "
let s:cyan =            [ '#55dddd', 118 ] " VISUAL 
let s:lightCyan =       [ '#bbffff', 201 ] "

" NORMAL ≈ navy
let s:darkBlue =        [ '#000066', 053 ] "
let s:blue =            [ '#7777FF', 117 ] " NORMAL
let s:lightBlue =       [ '#aaaaff', 187 ] "

" INSERT ≈ magenta
let s:darkMagenta =     [ '#770077', 215 ] "
let s:magenta =         [ '#bb33bb', 216 ] " INSERT
let s:lightMagenta =    [ '#ffccff', 222 ] "

" fillers
let s:black =           [ '#000000', 000 ] "
let s:darkGray =        [ '#232323', 100 ] "
let s:gray =            [ '#aaaaaa', 127 ] "
let s:lightGray =       [ '#dddddd', 240 ] "
let s:white=            [ '#ffffff', 255 ] "

" TO CREATE AN EZ LINK JUST DO: let s:cyan = s:blue

" ############################################################
"                   setting everything up
" ############################################################

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}}

"                                   text            background
"                                                                         text      background

" INACTIVE (window not in focus)
let s:p.inactive.left =         [ [ s:gray,         s:lightGray ],      [ s:gray,   s:gray ] ]
let s:p.inactive.middle =       [ [ s:lightGray,    s:darkGray ],       [ s:gray,   s:gray ] ]
let s:p.inactive.right =        [ [ s:gray,         s:lightGray ],      [ s:gray,   s:gray ] ]

" INSERT MODE ✅
let s:p.insert.left =           [ [ s:black,        s:lightMagenta ],   [ s:black,  s:magenta ] ]
let s:p.insert.middle =         [ [ s:lightMagenta, s:darkMagenta ],    [ s:black,  s:magenta ] ]
let s:p.insert.right =          [ [ s:black,        s:lightMagenta ],   [ s:black,  s:magenta ] ]

" NORMAL MODE ✅
let s:p.normal.left =           [ [ s:black,        s:lightBlue ],      [ s:black,  s:blue ] ]
let s:p.normal.middle =         [ [ s:lightBlue,    s:darkBlue ],       [ s:black,  s:blue ] ]
let s:p.normal.right =          [ [ s:black,        s:lightBlue ],      [ s:black,  s:blue ] ]
    let s:p.normal.error =      [ [ s:black,        s:red ] ]
    let s:p.normal.warning =    [ [ s:black,        s:yellow ] ]

" REPLACE MODE ✅
let s:p.replace.left =          [ [ s:black,        s:lightRed ],       [ s:black,  s:red ] ]
let s:p.replace.middle =        [ [ s:lightRed,     s:darkRed ],        [ s:black,  s:red ] ]
let s:p.replace.right =         [ [ s:black,        s:lightRed ],       [ s:black,  s:red ] ]

" TABS (gt/gT)
"                                   text            "inactive tab"
let s:p.tabline.left =          [ [ s:lightGray,    s:darkGray ] ]
"                                   text            "cur tab"
let s:p.tabline.tabsel =        [ [ s:white,        s:vulb ] ]
"                                   text            "fill"
let s:p.tabline.middle =        [ [ s:lightGray,    s:darkGray ] ]
"                                   text            "X"
let s:p.tabline.right =         [ [ s:darkGray,     s:lightGray ] ]

" TERMINAL MODE ✅
let s:p.terminal.left =         [ [ s:black,        s:lightGreen ],     [ s:black,  s:green ] ]
let s:p.terminal.middle =       [ [ s:lightGreen,   s:darkGreen ],      [ s:black,  s:green ] ]
let s:p.terminal.right =        [ [ s:black,        s:lightGreen ],     [ s:black,  s:green ] ]

" VISUAL MODE
let s:p.visual.left =           [ [ s:black,        s:lightCyan ],      [ s:black,  s:cyan ] ]
let s:p.visual.middle =         [ [ s:lightCyan,    s:darkCyan ],       [ s:black,  s:cyan ] ]
let s:p.visual.right =          [ [ s:black,        s:lightCyan ],      [ s:black,  s:cyan ] ]



let g:lightline#colorscheme#vulbytesTheme#palette = lightline#colorscheme#flatten(s:p)

