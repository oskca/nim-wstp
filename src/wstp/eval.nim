##  To run this program use the command-line below:
##  Unix:           factor -wlname "math -wstp"
##  Mac or Windows: factor -wlmode launch
##  or factor directly

import launch, parseutils, strformat
import variant
import macros

type Symbol* = distinct string

proc `$`*(s: Symbol): string = string(s)

type Expression* = ref object of RootObj
  wl: WSLink

type StrExpr* = ref object of Expression
  str: string

type Function* = ref object of Expression
  head: string
  args: seq[Variant]

proc expr*(wl: WSLink, s: string): StrExpr =
  new(result)
  result.wl = wl
  result.str = s

proc fn*(wl: WSLink, head: string, args: varargs[Variant]): Function =
  new result
  result.wl = wl
  result.head = head
  for v in args:
    result.args.add v

macro fn*(wl: WSLink, head: string, args: varargs[untyped]): untyped = 
  result = newNimNode(nnkCall)
  result.add newIdentNode("fn")
  result.add wl
  result.add head
  for a in args:
    var nv = newNimNode(nnkCall)
    nv.add newIdentNode("newVariant")
    nv.add a
    result.add nv

method put*(e: Expression) {.base.} =
  quit "to override!"

proc showError*(wl: WSLink) =
  if hasError(wl):
    echo fmt"Error detected by WSTP: {wl.ErrorMessage()}"
  else:
    echo fmt"Error detected by this program"
  quit(3)

proc getResult(wl: WSLink): Variant =
  var 
    s: cstring
    i, n: cint
    r: float
  case GetNext(wl).char:
  of WSTKSYM:
    GetSymbol(wl, s.addr)
    result = newVariant(Symbol($s))
    ReleaseSymbol(wl, s)
  of WSTKSTR:
    GetString(wl, s.addr)
    result = newVariant($s)
    ReleaseString(wl, s)
  of WSTKINT:
    GetInteger(wl, i.addr)
    result = newVariant(i.int)
  of WSTKREAL:
    GetReal(wl, r.addr)
    result = newVariant(r.float)
  of WSTKFUNC:
    GetArgCount(wl, n.addr)
    var head = wl.getResult().get(Symbol)
    var args = newSeq[Variant]()
    for i in 1..n :
      args.add wl.getResult()
    result = newVariant(wl.fn(head.string, args))
  else:
    echo "error getting result"
    showError(wl)
    result = newVariant("error")

proc eval*(e: Expression): Variant {.discardable.} =
  e.put()
  EndPacket(e.wl)
  e.wl.waitReturn(RETURNPKT)
  e.wl.getResult()

method put*(e: StrExpr) =
  PutFunction(e.wl, "EvaluatePacket", 1)
  PutFunction(e.wl, "ToExpression", 1)
  PutString(e.wl, e.str)

proc putFunc(f:Function)

proc putVariant(wl: WSLink, arg: Variant) =
  variantMatch case arg as v
  of int:
    PutInteger(wl, cint v)
  of string:
    PutString(wl, cstring v)
  of float:
    PutReal(wl, cdouble v)
  of Symbol:
    PutSymbol(wl, cstring v)
  of Function:
    putFunc(v)
  of StrExpr:
    putVariant(wl, eval v)
  else:
    echo "dont know what v is", arg

proc `$`*(arg: Variant): string =
  variantMatch case arg as v
  of int:
    result = &"int:{v}"
  of string:
    result = &"str:{v}"
  of float:
    result = &"float:{v}"
  of Symbol:
    result = &"sym:{v}"
  of Function:
    result = &"{v.head}["
    for i, a in v.args:
      result.add $a
      if i != v.args.len - 1:
        result.add ", "
    result.add "]"
  of StrExpr:
    result = &"sexpr:{v.str}"
  else:
    result = ""

proc putFunc(f: Function) =
  PutFunction(f.wl, f.head, f.args.len)
  for arg in f.args:
    putVariant(f.wl, arg)

method put*(f: Function) =
  PutFunction(f.wl, "EvaluatePacket", 1)
  putFunc(f)

{.experimental: "dotOperators".}

macro `.()`*(wl:WSLink, head: untyped, args: varargs[untyped]): untyped =
  #fn 
  var f = newNimNode(nnkCall)
  f.add newIdentNode("fn")
  f.add wl
  f.add newStrLitNode head.strVal()
  for a in args:
    f.add a
  # ret
  result = f

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
  else:
    showError(wl)

proc main() =
  var
    ret: cint
    str: cstring
    e, e1, e2: Expression
    x = Symbol("x")

  var wl = launch()

  eval wl.expr("Table[Sin[x], {x,1,10}]")
  eval wl.expr("gf[x_]:=x*2; df[x_]:=x^2")
  e1 = wl.expr("Sin[x]")
  e2 = wl.expr("{x, 1, 10}")
  echo eval wl.expr("Sin[x]")
  echo eval wl.expr("{x, 1, 10}")

  echo eval wl.Table(eval e1, eval e2)
  echo eval wl.Table(eval wl.Log(x), eval wl.List(x, 1, 5))

  echo eval wl.N(wl.Table(eval e1, eval e2))
  echo eval wl.N(wl.Table(eval wl.Log(x), eval wl.List(x, 1, 5)))
  echo eval wl.gf(10)
  echo eval wl.df(10)


  return

when isMainModule:
  main()
