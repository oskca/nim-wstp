static:
  discard staticExec("wsprep -o addtwo.tm.c addtwo.tm")
{.compile:"addtwo.tm.c".}

import wstp/utils

proc addtwo(i,j:int): int {.exportc.} =
  return i+j+2

runWSTP()