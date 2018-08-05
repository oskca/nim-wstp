##  To run this program use the command-line below:
##  Unix:           factor -linkname "math -wstp"
##  Mac or Windows: factor -linkmode launch
##  or factor directly

import wstp/launch, parseutils, strformat

proc showError*(lp: WSLink) =
  if hasError(lp):
    echo fmt"Error detected by WSTP: {lp.ErrorMessage()}"
  else:
    echo fmt"Error detected by this program"
  quit(3)

proc main*(): cint =
  var
    pkt: cint
    prime: cint
    expt: cint
  var
    llen: cint
    lenp: cint
    k: cint

  var lp = launch()

  echo("Integer to factor: ")

  var istr = stdin.readLine()
  var i = 0
  discard parseInt(istr, i)
  echo "integer:", i

  PutFunction(lp, "EvaluatePacket", 1)
  PutFunction(lp, "FactorInteger", 1)
  PutInteger(lp, i)
  EndPacket(lp)

  lp.waitReturn()

  if not testHead(lp, "List", addr(llen)): showError(lp)
  k = 1
  while k <= llen:
    if testHead(lp, "List", addr(lenp)) and 
       lenp == 2 and
       GetInteger(lp, addr(prime)) != 0 and 
       GetInteger(lp, addr(expt)) != 0:
        echo fmt"{prime} ^ {expt}"
    else:
      showError(lp)
    inc(k)

  PutFunction(lp, "Exit", 0)

  return 0

discard main()