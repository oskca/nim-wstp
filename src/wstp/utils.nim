import wstp, os, wstp/defs
export defs, wstp

proc argcv*(): tuple[argc:cint, argv:cStringArray] =
  ## return argc,argv for c interop with 
  let argc = cint(paramCount()+1)
  var args = commandLineParams()
  args.insert(getAppFilename())
  let argv = allocCStringArray(args)
  return (argc, argv)

proc hasError*(lp: WSLink): bool =
  return lp.Error() != 0

proc testHead*(mlp: WSLINK; s: cstring; countp: ptr cint): bool =
  return TestHead(mlp, s, countp) != 0

converter tocint*(x: int): cint = x.cint
converter tocStringArray*(s:ptr cstring): cStringArray = cast[cStringArray](s)
converter tocfloat*(x: float): cfloat = x.cfloat
