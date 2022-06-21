"
" I used the provided dark theme from vim-airline where it is explained how to
" create a colour scheme.
"
" So for more information please see the following URL:
" https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/themes/dark.vim
"

scriptencoding utf-8


" Airline themes are specified as a global viml dictionary
let g:airline#themes#crydetaan#palette = {}

" Keys in the dictionary are composed of the mode, and if specified the
" override.  For example:
"   * g:airline#themes#dark#palette.normal
"       * the colors for a statusline while in normal mode

" Values for each dictionary key is an array of color values that should be
" familiar for colorscheme designers:
"   * [guifg, guibg, ctermfg, ctermbg, opts]

" ---------- NORMAL ---------- "
let s:airline_a_normal   = [ '#bcbcbc' , '#121212' , 250 , 233 ]
let s:airline_b_normal   = [ '#585858' , '#121212' , 240 , 233 ]
let s:airline_c_normal   = [ '#8a8a8a' , '#121212' , 245 , 233 ]

" A convenience function, airline#themes#generate_color_map() exists to
" mirror airline_a/b/c to airline_x/y/z, respectively.
let g:airline#themes#crydetaan#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)

" Override the map that causes the z-section not to be equal to section-a.
let g:airline#themes#crydetaan#palette.normal.airline_z = [ '#585858' , '#121212' , 240 , 233 ]

" I am leaving this just to remind myself that the palettes can be extended
" using the <...>_modified dictionary
" let g:airline#themes#crydetaan#palette.normal_modified = {
"       \ 'airline_c': [ '#8a8a8a' , '#121212' , 245 , 233 ] ,
"       \ }

" ---------- INSERT ---------- "
let s:airline_a_insert = [ '#00d7ff' , '#121212' , 45  , 233 ]
let s:airline_b_insert = [ '#585858' , '#121212' , 240 , 233 ]
let s:airline_c_insert = [ '#8a8a8a' , '#121212' , 245 , 233 ]
let g:airline#themes#crydetaan#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

" Override the map that causes the z-section not to be equal to section-a.
let g:airline#themes#crydetaan#palette.insert.airline_z = [ '#585858' , '#121212' , 240 , 233 ]

let g:airline#themes#crydetaan#palette.insert_paste = {
      \ 'airline_a': [ s:airline_a_insert[0]   , '#d78700' , s:airline_a_insert[2] , 172     , ''     ] ,
      \ }


" ---------- REPLACE ---------- "
let g:airline#themes#crydetaan#palette.replace = copy(g:airline#themes#crydetaan#palette.insert)
let g:airline#themes#crydetaan#palette.replace.airline_a = [  '#af0000'  , s:airline_b_insert[1] , 124 , s:airline_b_insert[3]     , ''     ]
" let g:airline#themes#crydetaan#palette.replace.airline_a = [ s:airline_b_insert[0]   , '#af0000' , s:airline_b_insert[2] , 124     , ''     ]


" ---------- VISUAL ---------- "
let s:airline_a_visual = [ '#005f5f' , '#121212' , 23  , 233 ]
let s:airline_b_visual = [ '#585858' , '#121212' , 240 , 233 ]
let s:airline_c_visual = [ '#8a8a8a' , '#121212' , 245 , 233 ]
let g:airline#themes#crydetaan#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)

" Override the map that causes the z-section not to be equal to section-a.
let g:airline#themes#crydetaan#palette.visual.airline_z = [ '#585858' , '#121212' , 240 , 233 ]

" ---------- INACTIVE ---------- "
let s:airline_a_inactive = [ '#4e4e4e' , '#1c1c1c' , 239 , 234 , '' ]
let s:airline_b_inactive = [ '#4e4e4e' , '#262626' , 239 , 235 , '' ]
let s:airline_c_inactive = [ '#4e4e4e' , '#303030' , 239 , 236 , '' ]
let g:airline#themes#crydetaan#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)


" ---------- COMMANDLINE ---------- "
" For commandline mode, we use the colors from normal mode, except the mode
" indicator should be colored differently, e.g. blue on light green
let s:airline_a_commandline = [ '#0000ff' , '#0cff00' , 63  , 40 ]
let s:airline_b_commandline = [ '#ffffff' , '#444444' , 255 , 238 ]
let s:airline_c_commandline = [ '#9cffd3' , '#202020' , 85  , 234 ]
let g:airline#themes#crydetaan#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)


" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#crydetaan#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ]
      \ }


" NOTE: Not yet sure if this is needed.
" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
" if get(g:, 'loaded_ctrlp', 0)
"   let g:airline#themes#crydetaan#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
"         \ [ '#d7d7ff' , '#5f00af' , 189 , 55  , ''     ],
"         \ [ '#ffffff' , '#875fd7' , 231 , 98  , ''     ],
"         \ [ '#5f00af' , '#ffffff' , 55  , 231 , 'bold' ])
" endif
