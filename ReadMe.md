# Nim bindings for WSTP

Nim bindings for working with Mathematica or the Wolfram language.

There is mainly two wrapper method for easy usage:

## launch

`launch` can be used to launch a standalone Mathematica/Wolfram kernel in the background
and communicate with the `WSTP` protocol as followos

```nim
import wstp/launch

let lp = launch()

lp.PutFunction("EvaluatePacket", 1)
lp.PutFunction("DateString", 0)
lp.EndPacket()

lp.waitReturn()

var s: cstring

lp.GetString(s.addr)

echo "result: ", s
lp.ReleaseString(s)
```

## run

`run` applications tipically would be used to add functionalities to Mathematica/Wolfram by
using `Install[path/to/executable]` to be started as an subprocess of `Mathematcia`. 

One example is as follows:
```nim
static:
  discard staticExec("wsprep -o addtwo.tm.c addtwo.tm")
{.compile:"addtwo.tm.c".}

import wstp/run

proc addtwo(i,j:int): int {.exportc.} =
  return i+j

run()
```
remeber this still requires `addtwo.tm`.

## see also

[Matlab/Simulink nim-mex](https://github.com/nim-lang/Nim/issues/8331#issuecomment-405224987)

[Are we scientists yet?](https://github.com/nim-lang/needed-libraries/issues/77)
