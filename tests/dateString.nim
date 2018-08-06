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
