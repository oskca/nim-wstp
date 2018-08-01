# Package

version       = "0.1.0"
author        = "oskca"
description   = "Nim bindings for WSTP"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 0.18.0"
requires "c2nim"

import strutils

const
  t1 = """typedef struct MLYieldData{
 union {long l; double d; void * p;} private_data[8];
} * MLYieldDataPointer;
"""
  r1 = """struct MLYieldData{
 union {long l; double d; void * p;} private_data[8];
};
typedef struct MLYieldData * MLYieldDataPointer;
  """

  t2 = """typedef WSYielderProcPtr MLYielderUPP, MLDeviceYielderUPP;"""
  r2 = """typedef WSYielderProcPtr MLYielderUPP; typedef WSYielderProcPtr MLDeviceYielderUPP;"""

  t3 = """typedef WSHandlerProcPtr MLHandlerUPP, MLDeviceHandlerUPP;"""
  r3 = """typedef WSHandlerProcPtr MLHandlerUPP; typedef MLHandlerUPP MLDeviceHandlerUPP;"""

proc replace(fn: string) =
  var s = staticRead(fn)
  s = s.replace(t1, r1)
  s = s.replace(t2, r2)
  s = s.replace(t3, r3)
  writeFile(fn, s)

before build:
  exec "gcc -E headers/wstp.h > wstpE.h"
  replace "wstpE.h"
  exec "c2nim -o:src/wstp.nim --header:wstphdr wstpE.h"
  exec "rm -rf wstpE.h"
