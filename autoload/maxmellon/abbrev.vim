vim9script

def maxmellon#abbrev#func(mode: string, before: string, after: string): void
  execute(mode .. 'abbrev ' .. before .. ' ' .. after)
enddef
