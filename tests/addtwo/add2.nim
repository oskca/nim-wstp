static:
  discard staticExec("wsprep -o addtwo.tm.c addtwo.tm")
{.compile:"addtwo.tm.c".}

import wstp/run

proc addtwo(i,j:int): int {.exportc.} =
  return i+j

run()
