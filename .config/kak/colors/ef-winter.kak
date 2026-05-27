# Ef-Winter theme for Kakoune

# Color palette
# declare-option str black default
declare-option str bg_main 'rgb:0f0b15'
declare-option str fg_main 'rgb:b8c6d5'
declare-option str bg_dim 'rgb:1d202f'
declare-option str fg_dim 'rgb:807c9f'
declare-option str bg_alt 'rgb:2a2f42'
declare-option str fg_alt 'rgb:bf8f8f'
declare-option str bg_active 'rgb:4a4f62'
declare-option str bg_inactive 'rgb:19181f'
declare-option str red 'rgb:f47359'
declare-option str red_bright 'rgb:ff6a7a'
declare-option str green 'rgb:29a444'
declare-option str green_bright 'rgb:00a392'
declare-option str yellow 'rgb:b58a52'
declare-option str yellow_bright 'rgb:df9080'
declare-option str blue 'rgb:3f95f6'
declare-option str blue_bright 'rgb:029fff'
declare-option str purple 'rgb:d369af'
declare-option str purple_bright 'rgb:af85ea'
declare-option str bg_mode_line 'rgb:5f1f5f'
declare-option str fg_mode_line 'rgb:dedeff'
declare-option str cursor 'rgb:ff6ff0'
declare-option str bg_hl_line 'rgb:003045'
declare-option str fg_space 'rgb:4a4955'

declare-option str psel 'rgb:342464'
declare-option str ssel 'rgb:003045'

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value 'rgb:b8c6d5'
set-face global type 'rgb:4fbaef'
set-face global variable 'rgb:6a9fff'
set-face global keyword 'rgb:af85ea'
set-face global module 'rgb:b8c6d5'
set-face global function 'rgb:35afbf'
set-face global string 'rgb:df9080'
set-face global builtin 'rgb:e580e0'
set-face global constant 'rgb:d369af'
set-face global comment 'rgb:c0a38a'
set-face global meta 'rgb:ff6a7a'

set-face global operator 'rgb:b8c6d5'
set-face global comma 'rgb:b8c6d5'
set-face global bracket 'rgb:2f608e'

# For markup
set-face global title "%opt{purple}"
set-face global header "%opt{yellow_bright}"
set-face global bold "%opt{purple}"
set-face global italic "%opt{purple_bright}"
set-face global mono "%opt{green}"
set-face global block "%opt{blue_bright}"
set-face global link "%opt{green}"
set-face global bullet "%opt{green}"
set-face global list "%opt{fg_main}"

# Builtin faces
set-face global Default "%opt{fg_main},%opt{bg_main}"
set-face global PrimarySelection "default,%opt{psel}"
set-face global SecondarySelection "default,%opt{ssel}"
set-face global PrimaryCursor "%opt{bg_main},%opt{cursor}"
set-face global SecondaryCursor "%opt{bg_main},%opt{fg_alt}"
set-face global PrimaryCursorEol "%opt{bg_main},%opt{red_bright}"
set-face global SecondaryCursorEol "%opt{bg_main},%opt{blue}"
set-face global LineNumbers "%opt{fg_dim},%opt{bg_main}"
set-face global LineNumberCursor "%opt{fg_alt},%opt{bg_main}+b"
set-face global LineNumbersWrapped "%opt{bg_dim},%opt{bg_main}+i"
set-face global MenuForeground "%opt{bg_main},%opt{fg_main}+b"
set-face global MenuBackground "%opt{fg_main},%opt{bg_alt}"
set-face global MenuInfo "%opt{fg_alt},%opt{bg_alt}"
set-face global Information "%opt{fg_mode_line},%opt{bg_mode_line}"
set-face global Error "%opt{red},%opt{bg_mode_line}"
set-face global StatusLine "%opt{fg_mode_line},%opt{bg_mode_line}"
set-face global StatusLineMode "%opt{fg_mode_line},%opt{bg_mode_line}"
set-face global StatusLineInfo "%opt{fg_mode_line},%opt{bg_mode_line}"
set-face global StatusLineValue "%opt{fg_mode_line},%opt{bg_mode_line}"
set-face global StatusCursor "%opt{fg_main},%opt{blue}"
set-face global Prompt "%opt{fg_mode_line},%opt{bg_mode_line}"
set-face global MatchingChar "%opt{blue},%opt{bg_main}"
set-face global Whitespace "%opt{fg_space},%opt{bg_main}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{bg_main},%opt{bg_main}"
