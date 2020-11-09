vim9script

const is_windows: bool = has('win32') || has('win64')
const is_cygwin: bool = has('win32unix')
const has_any_mac: bool = has('mac') || has('macunix') || has('gui_macvim')

def maxmellon#os#is_mac(): bool
  return !is_windows && !is_cygwin && has_any_mac
enddef

def maxmellon#os#is_linux(): bool
  return !(is_windows || is_cygwin || has_any_mac)
enddef

def maxmellon#os#is_windows(): bool
  return is_windows
enddef

def maxmellon#os#is_cygwin(): bool
  return is_cygwin
enddef
