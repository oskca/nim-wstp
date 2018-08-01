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

  hdrPrefix = """
{.passC:"-I/usr/local/Wolfram/Mathematica/11.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions".}
{.passL:"/usr/local/Wolfram/Mathematica/11.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.a".}
const
  wstphdr = "wstp.h"
"""

proc replace(fn: string) =
  var s = staticRead(fn)
  s = s.replace(t1, r1)
  s = s.replace(t2, r2)
  s = s.replace(t3, r3)
  writeFile(fn, s)

proc appendPrefix(fn: string) =
  var s = staticRead(fn)
  s = s.replace("__", "_")
  s = hdrPrefix & s
  writeFile(fn, s)

task gen, "Generate wstp.nim":
  exec "gcc -E headers/wstp.h > wstpE.h"
  replace "wstpE.h"
  exec "c2nim --prefix:_ --suffix:_ --o:src/wstp.nim --header:wstphdr wstpE.h"
  exec "rm -rf wstpE.h"
  appendPrefix "src/wstp.nim"
