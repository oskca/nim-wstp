##  To run this program use the command-line below:
##  Unix:           factor -wlname "math -wstp"
##  Mac or Windows: factor -wlmode launch
##  or factor directly

import launch, parseutils, strformat
import variant
import macros

type Expression* = ref object of RootObj

type StrExpr* = ref object of Expression
  str: string

type Function* = ref object of Expression
  head: string
  args: seq[Variant]

proc wlexpr*(s: string): StrExpr =
  new(result)
  result.str = s

proc newFunction*(head: string, args: varargs[Variant]): Function =
  new result
  result.head = head
  for v in args:
    result.args.add v

macro newFunction*(head: string, args: varargs[untyped]): untyped = 
  result = newNimNode(nnkCall)
  result.add newIdentNode("newFunction")
  result.add head
  for a in args:
    var nv = newNimNode(nnkCall)
    nv.add newIdentNode("newVariant")
    nv.add a
    result.add nv

{.experimental: "dotOperators".}

macro `.()`*(wl:WSLink, head: untyped, args: varargs[untyped]): untyped =
  # newFunction
  var f = newNimNode(nnkCall)
  f.add newIdentNode("newFunction")
  f.add newStrLitNode head.strVal()
  for a in args:
    var nv = newNimNode(nnkCall)
    nv.add newIdentNode("newVariant")
    nv.add a
    f.add nv
  # eval
  result = newNimNode(nnkCall)
  result.add newIdentNode("eval")
  result.add f
  result.add wl

dumpTree:
  wl.List(1,2,3)

method eval*(e: Expression, wl: WSLink) {.base.} =
  # override this base method
  quit "to override!"

method eval*(e: StrExpr, wl: WSLink) =
  PutFunction(wl, "EvaluatePacket", 1)
  PutFunction(wl, "ToExpression", 1)
  PutString(wl, e.str)
  EndPacket(wl)

method eval*(f: Function, wl: WSLink) =
  PutFunction(wl, "EvaluatePacket", 1)
  PutFunction(wl, f.head, f.args.len)
  for i in 0..<f.args.len:
    variantMatch case f.args[i] as v
    of int:
      PutInteger(wl, cint v)
    of string:
      PutString(wl, cstring v)
    of float:
      PutReal(wl, cdouble v)
    else:
        echo "dont know what v is"
  EndPacket(wl)


proc showError*(wl: WSLink) =
  if hasError(wl):
    echo fmt"Error detected by WSTP: {wl.ErrorMessage()}"
  else:
    echo fmt"Error detected by this program"
  quit(3)

proc printResult(wl: WSLink) =
  var 
    s: cstring
    i, n: cint
    r: float
  case GetNext(wl).char:
  of WSTKSYM:
    GetSymbol(wl, s.addr)
    echo &"sym:{s}"
    ReleaseSymbol(wl, s)
  of WSTKSTR:
    GetString(wl, s.addr)
    echo &"str:{s}"
    ReleaseString(wl, s)
  of WSTKINT:
    GetInteger(wl, i.addr)
    echo &"int:{i}"
  of WSTKREAL:
    GetReal(wl, r.addr)
    echo &"real:{r}"
  of WSTKFUNC:
    GetArgCount(wl, n.addr)
    printResult(wl)
    echo "["
    for i in 1..n :
      printResult(wl)
      if i != n: echo ", "
    echo "]"
  of WSTKERROR.char:
    showError(wl)
  else:
    showError(wl)

proc main() =
  var
    ret: cint
    str: cstring

  var wl = launch()
  var vl = newVariant(@[newVariant(1), newVariant(2)])
  echo vl

  # var istr = stdin.readLine()
  # var i = 0
  # discard parseInt(istr, i)
  # echo "integer:", i

  # var e: Expression
  # e = wlexpr "Range[10]"
  # e.eval(wl)
  # wl.waitReturn(RETURNPKT)
  # wl.printResult()

  # ReleaseString(wl, str)
  # e = newFunction("List", 3, "a str")
  # eval(e, wl)
  # eval(newFunction("List", 3, "a str"), wl)
  # e.eval(wl)
  # wl.waitReturn(RETURNPKT)
  # wl.printResult()

  # wl.List(1,2,3, "good", 2*3)
  wl.Range(0,10,2)
  # e.eval(wl)
  wl.waitReturn(RETURNPKT)
  wl.printResult()
  # wl.waitReturn(RETURNPKT)
  # wl.printResult()
  # wl.waitReturn(RETURNPKT)
  # wl.printResult()

  PutFunction(wl, "Exit", 0)
  EndPacket(wl)

  return

when isMainModule:
  main()