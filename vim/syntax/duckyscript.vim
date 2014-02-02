" Vim syntax file
" Language: Ducky script
" Maintainer: Rasmus Mattsson (R4zzM)
" Latest Revision: 02 October 2013

" NOTE: The reference for this file is this ducky script resource:
" https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Duckyscript

if("b:current_syntax")
  finish
endif
let b:current_syntax = "duckyscript"

" Programmatic commands
syn keyword dsString STRING nextgroup=dsCharSequence
syn keyword dsComment REM nextgroup=dsCommentArg 
syn keyword dsDelay DELAY DEFAULT_DELAY DEFAULTDELAY nextgroup=dsDelayArg skipwhite

" Keys or groups of keys 
syn keyword dsWindowsKey GUI WINDOWS nextgroup=dsChar skipwhite
syn keyword dsEnterKey ENTER nextgroup=dsNothing
syn keyword dsMenuKey APP MENU nextgroup=dsNothing
syn keyword dsArrowKeys RIGHT RIGHTARROW LEFT LEFTARROW UP UPARROW DOWN DOWNARROW nextgroup=dsNothing
syn keyword dsExtendedKeys BREAK PAUSE DELETE END ESC ESCAPE HOME INSERT PAGEUP PAGEDOWN PRINTSCREEN SPACE TAB CAPSLOCK NUMLOCK SCROLLLOCK nextgroup=dsNothing
syn keyword dsControlKey CTRL CONTROL nextgroup=dsCtrlArg skipwhite
syn keyword dsAltKey ALT nextgroup=dsAltArg skipwhite
syn keyword dsShiftKey SHIFT nextgroup=dsShiftArg skipwhite
 
" Matches
syn   match   dsChar          '\v[A-Za-z]\s*$'
syn   match   dsCharSequence  '\v.*$'
syn   match   dsCommentArg    '\v.*$'
syn   match   dsDelayArg      '\v\d+$'
syn   match   dsAltArg        '\v(.=|ESC|ESCAPE|END|SPACE|TAB|F[1-12])\s*$'
syn   match   dsShiftArg      '\v(DELETE|HOME|INSERT|PAGEUP|PAGEDOWN|WINDOWS|GUI|UPARROW|DOWNARROW|LEFTARROW|RIGHTARROW|TAB)\s*$'
syn   match   dsCtrlArg       '\v(.=|BREAK|PAUSE|F[1-12]|ESCAPE|ESC|)\s*$'
syn   match   dsNothing       '\v.*$'

" Comment highlighting: Comments
hi   def   link   dsComment      Comment
hi   def   link   dsCommentArg   Comment

" Statement highlighting: Programmatic commands except comments
hi   def   link   dsString     Statement
hi   def   link   dsDelay      Statement
hi   def   link   dsDelayArg   Statement

" Constanst highlighting: Everything that is a keypress
hi   def   link   dsChar           Constant
hi   def   link   dsCharSequence   Constant
hi   def   link   dsWindowsKey     Constant
hi   def   link   dsEnterKey       Constant
hi   def   link   dsMenuKey        Constant
hi   def   link   dsArrowKeys      Constant
hi   def   link   dsExtendedKeys   Constant
hi   def   link   dsControlKey     Constant
hi   def   link   dsAltKey         Constant
hi   def   link   dsShiftKey       Constant
hi   def   link   dsAltArg         Constant
hi   def   link   dsShiftArg       Constant
hi   def   link   dsCtrlArg        Constant

" Normal text highlighting: Non-valid text
hi   def   link   dsNothing        Normal
