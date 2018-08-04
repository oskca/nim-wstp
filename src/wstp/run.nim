import wstp/utils
export utils

## run a background WSTP server 
## that cat be Installed by MMA

proc run*(): int {.discardable.} =
  ## run a background WSTP server 
  ## that cat be Installed by MMA
  let (argc, argv) = argcv()
  return WSMain((argc+1).cint, argv)
