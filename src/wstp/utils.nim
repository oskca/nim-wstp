import wstp, os, wstp/defs
export defs

proc argcv*(): tuple[argc:cint, argv:cStringArray] =
  ## return argc,argv for c interop with 
  let argc = cint(paramCount()+1)
  var args = commandLineParams()
  args.insert(getAppFilename())
  let argv = allocCStringArray(args)
  return (argc, argv)

proc defaultArgv(): cStringArray =
  var argv = @[getAppFilename(), "-linkname", "math -wstp"]
  when defined(windo):
    argv = @[getAppFilename(), "-linkmode", "launch"]
  return allocCStringArray(argv)

proc runWSTP*(): int {.discardable.} =
  ## run a background WSTP server 
  ## that cat be Installed by MMA
  let (argc, argv) = argcv()
  return WSMain((argc+1).cint, argv)

proc launchLink*(): WSLink =
  ## launch a new/sub process/standalone WSTP(math or wolfram) link 
  ## if no *CMDLINE* arg is specified, 
  ## defautl args(starts a sub process) for each platform will be used
  var (argc, argv) = argcv()
  # for easy usage
  if argc <= 1: 
    argv = defaultArgv()
    argc = 3
  defer: deallocCStringArray(argv)
  # open TP link
  var ep = Initialize(nil)
  if ep == nil:
    return nil
  var err: cint
  var argend: cStringArray
  {.emit:[argend, "=argv+argc;"].}
  return OpenArgv(ep, argv, argend, err.addr)

proc waitReturn*(lp: WSLink) =
  ## skip any packets before the first ReturnPacket
  var pkg = lp.NextPacket()
  while pkg != 0 and pkg != RETURNPKT:
    lp.NewPacket()
    pkg = lp.NextPacket()

when isMainModule:
  import ospaths
  let lp = launchLink()
  if lp == nil:
    echo "lp:", lp.repr
    echo osErrorMsg(osLastError())
    quit()
  var m = 2
  var n = 3
  PutFunction(lp, "EvaluatePacket", 1)
  PutFunction(lp, "Power", 2)
  PutInteger(lp, 2)
  PutInteger(lp, 3)
  waitReturn(lp)
  var r:cint = 0
  lp.GetInteger(r.addr)
  echo "result:", r
  lp.EndPacket()
