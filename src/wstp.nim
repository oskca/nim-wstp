{.passC:"-m64 -I/usr/local/Wolfram/Mathematica/11.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions".}
# {.passL:"-L/usr/local/Wolfram/Mathematica/11.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions -static -lWSTP64i4".}
{.passL:"/usr/local/Wolfram/Mathematica/11.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.a -lm -lpthread -lrt -lstdc++ -ldl -luuid".}
const
  wstphdr = "wstp.h"
type
  wint* = cuint
  wint64* {.importc: "wint64", header: wstphdr, bycopy.} = object
    low* {.importc: "low".}: wint
    hi* {.importc: "hi".}: wint

  mllong32* = cint
  wslong32* = cint
  mlulong32* = cuint
  wsulong32* = cuint
  wsint64* = clong
  mluint64* = culong
  wsuint64* = culong
  mlbigint* = wsint64
  mlbiguint* = mluint64
  uchar_ct* = cuchar
  ucharp_ct* = ptr uchar_ct
  ucharpp_ct* = ptr ucharp_ct
  ucharppp_ct* = ptr ucharpp_ct
  ushort_ct* = cushort
  ushortp_ct* = ptr ushort_ct
  ushortpp_ct* = ptr ushortp_ct
  ushortppp_ct* = ptr ushortpp_ct
  uint_ct* = cuint
  uintp_ct* = ptr cuint
  uintpp_ct* = ptr uintp_ct
  int_ct* = cint
  voidp_ct* = pointer
  voidpp_ct* = ptr voidp_ct
  charp_ct* = cstring
  charpp_ct* = ptr charp_ct
  charppp_ct* = ptr charpp_ct
  long_ct* = clong
  longp_ct* = ptr long_ct
  longpp_ct* = ptr longp_ct
  ulong_ct* = culong
  ulongp_ct* = ptr ulong_ct
  kushortp_ct* = ptr cushort
  kushortpp_ct* = ptr ptr cushort
  kuintp_ct* = ptr cuint
  kuintpp_ct* = ptr ptr cuint
  kucharp_ct* = ptr cuchar
  kucharpp_ct* = ptr ptr cuchar
  kcharp_ct* = cstring
  kcharpp_ct* = cstringArray
  kvoidp_ct* = pointer
  WSPointer* = pointer
  MLENVPARAM* = pointer
  WSEnvironmentParameter* = MLENVPARAM
  WSENV* = pointer
  WSEnvironment* = WSENV
  WSLINK* = pointer
  WSMARK* = pointer
  MLINKMark* = WSMARK
  mlapi_token* = culong
  mlapi_tokenp* = ptr mlapi_token
  wsapi_packet* = int_ct
  mlapi_error* = clong
  long_st* = clong
  longp_st* = longp_ct
  longpp_st* = ptr longp_st
  long_et* = clong
  mlapi_result* = int_ct
  MLProcPtr* = proc (): clong
  dev_voidp* = pointer
  dev_type* = dev_voidp
  dev_typep* = ptr dev_type
  devproc_error* = clong
  devproc_selector* = culong
  read_buf* {.importc: "read_buf", header: wstphdr, bycopy.} = object
    length* {.importc: "length".}: cushort
    `ptr`* {.importc: "ptr".}: ptr cuchar

  read_bufp* = ptr read_buf
  read_bufpp* = ptr read_bufp
  MLDeviceProcPtr* = proc (dev: dev_type; selector: devproc_selector; p1: dev_voidp;
                        p2: dev_voidp): devproc_error

proc MLDeviceMain*(dev: dev_type; selector: devproc_selector; p1: dev_voidp;
                  p2: dev_voidp): devproc_error {.importc: "MLDeviceMain", discardable, header: wstphdr.}
type
  MLDeviceUPP* = MLDeviceProcPtr
  dev_main_type* = MLDeviceUPP
  dev_main_typep* = ptr dev_main_type
  WSAllocatorProcPtr* = proc (a2: culong): pointer
  MLAllocatorUPP* = WSAllocatorProcPtr
  WSDeallocatorProcPtr* = proc (a2: pointer)
  MLDeallocatorUPP* = WSDeallocatorProcPtr

proc AllocatorCast*(f: WSAllocatorProcPtr): MLProcPtr {.
    importc: "WSAllocatorCast", discardable, header: wstphdr.}
proc DeallocatorCast*(f: WSDeallocatorProcPtr): MLProcPtr {.
    importc: "WSDeallocatorCast", discardable, header: wstphdr.}
type
  WSAllocator* = MLAllocatorUPP
  WSAllocatorp* = ptr WSAllocator
  WSDeallocator* = MLDeallocatorUPP
  WSDeallocatorp* = ptr WSDeallocator
  uint32_nt* = cuint
  sint32_nt* = cint
  uchar_nt* = cuchar
  ucharp_nt* = ptr uchar_nt
  ucharpp_nt* = ptr ucharp_nt
  short_nt* = cshort
  shortp_nt* = ptr short_nt
  shortpp_nt* = ptr shortp_nt
  int_nt* = cint
  intp_nt* = ptr int_nt
  intpp_nt* = ptr intp_nt
  long_nt* = clong
  longp_nt* = ptr long_nt
  longpp_nt* = ptr longp_nt
  int64_nt* = wsint64
  int64p_nt* = ptr int64_nt
  int64pp_nt* = ptr int64p_nt
  float_nt* = cfloat
  floatp_nt* = ptr float_nt
  floatpp_nt* = ptr floatp_nt
  double_nt* = cdouble
  doublep_nt* = ptr double_nt
  doublepp_nt* = ptr doublep_nt
  i87extended_nt* {.importc: "_i87extended_nt", header: wstphdr, bycopy.} = object
    w* {.importc: "w".}: array[5, cushort]

  wsextended_double* = clongdouble
  extended_nt* = clongdouble
  extendedp_nt* = ptr extended_nt
  extendedpp_nt* = ptr extendedp_nt
  dev_world* = pointer
  dev_cookie* = WSLINK
  dev_worldp* = ptr dev_world
  dev_cookiep* = ptr dev_cookie
  dev_allocator* = MLAllocatorUPP
  dev_deallocator* = MLDeallocatorUPP
  world_main_type* = dev_main_type
  dev_mode* = culong
  dev_modep* = ptr dev_mode
  dev_options* = culong
  devyield_result* = clong
  devyield_place* = clong
  devyield_count* = clong
  devyield_sleep* = culong
  WSYieldParameters* = pointer
  INNER_C_UNION_2473458821* {.importc: "no_name", header: wstphdr, bycopy.} = object {.
      union.}
    l* {.importc: "l".}: clong
    d* {.importc: "d".}: cdouble
    p* {.importc: "p".}: pointer

  MLYieldData* {.importc: "MLYieldData", header: wstphdr, bycopy.} = object
    private_data* {.importc: "private_data".}: array[8, INNER_C_UNION_2473458821]

  MLYieldDataPointer* = ptr MLYieldData

proc MLNewYieldData*(ydp: MLYieldDataPointer) {.importc: "MLNewYieldData", discardable, header: wstphdr.}
proc MLFreeYieldData*(ydp: MLYieldDataPointer) {.importc: "MLFreeYieldData", discardable, header: wstphdr.}
proc MLResetYieldData*(ydp: MLYieldDataPointer; func_id: devyield_place): WSYieldParameters {.
    importc: "MLResetYieldData", discardable, header: wstphdr.}
proc MLSetYieldParameter*(yp: WSYieldParameters; selector: culong; data: pointer;
                         len: ptr culong): cint {.importc: "MLSetYieldParameter", discardable, header: wstphdr.}
proc MLYieldParameter*(yp: WSYieldParameters; selector: culong; data: pointer;
                      len: ptr culong): cint {.importc: "MLYieldParameter", discardable, header: wstphdr.}
proc MLSetSleepYP*(yp: WSYieldParameters; sleep: devyield_sleep): devyield_sleep {.
    importc: "MLSetSleepYP", discardable, header: wstphdr.}
proc MLSetCountYP*(yp: WSYieldParameters; count: devyield_count): devyield_count {.
    importc: "MLSetCountYP", discardable, header: wstphdr.}
const
  MLSleepParameter* = 1
  MLCountParameter* = 2
  MLPlaceParameter* = 3

type
  WSYielderProcPtr* = proc (mlp: WSLINK; yp: WSYieldParameters): cint
  MLDeviceYielderProcPtr* = WSYielderProcPtr
  MLYielderUPP* = WSYielderProcPtr
  MLDeviceYielderUPP* = WSYielderProcPtr
  WSYieldFunctionType* = MLYielderUPP
  WSYieldFunctionObject* = MLYielderUPP
  dev_yielder* = WSYieldFunctionObject
  dev_yielderp* = ptr dev_yielder
  dev_message* = culong
  dev_messagep* = ptr dev_message
  WSHandlerProcPtr* = proc (mlp: WSLINK; m: cint; n: cint)
  MLDeviceHandlerProcPtr* = WSHandlerProcPtr
  MLHandlerUPP* = WSHandlerProcPtr
  MLDeviceHandlerUPP* = MLHandlerUPP
  WSMessageHandlerType* = MLHandlerUPP
  WSMessageHandlerObject* = MLHandlerUPP
  dev_msghandler* = WSMessageHandlerObject
  dev_msghandlerp* = ptr dev_msghandler

proc SleepYP*(yp: WSYieldParameters): devyield_sleep {.importc: "WSSleepYP", discardable, header: wstphdr.}
proc CountYP*(yp: WSYieldParameters): devyield_count {.importc: "WSCountYP", discardable, header: wstphdr.}
proc CreateYieldFunction*(ep: WSEnvironment; yf: WSYieldFunctionType;
                           reserved: pointer): WSYieldFunctionObject {.
    importc: "WSCreateYieldFunction", discardable, header: wstphdr.}
proc DestroyYieldFunction*(yfo: WSYieldFunctionObject): WSYieldFunctionType {.
    importc: "WSDestroyYieldFunction", discardable, header: wstphdr.}
proc CallYieldFunction*(yfo: WSYieldFunctionObject; mlp: WSLINK;
                         p: WSYieldParameters): cint {.
    importc: "WSCallYieldFunction", discardable, header: wstphdr.}
proc CreateMessageHandler*(ep: WSEnvironment; mh: WSMessageHandlerType;
                            reserved: pointer): WSMessageHandlerObject {.
    importc: "WSCreateMessageHandler", discardable, header: wstphdr.}
proc DestroyMessageHandler*(mho: WSMessageHandlerObject): WSMessageHandlerType {.
    importc: "WSDestroyMessageHandler", discardable, header: wstphdr.}
proc CallMessageHandler*(mho: WSMessageHandlerObject; mlp: WSLINK; m: cint; n: cint) {.
    importc: "WSCallMessageHandler", discardable, header: wstphdr.}
proc YielderCast*(yp: WSYielderProcPtr): MLProcPtr {.importc: "WSYielderCast", discardable, header: wstphdr.}
proc HandlerCast*(mh: WSHandlerProcPtr): MLProcPtr {.importc: "WSHandlerCast", discardable, header: wstphdr.}
type
  MLSigHandlerProcPtr* = proc (signal: cint)
  WSSignalHandlerType* = MLSigHandlerProcPtr
  MLSignalHandlerObject* = pointer
  WSParametersPointer* = cstring
  MLParameters* = array[356, char]
  WSUserProcPtr* = proc (a2: WSLINK)
  MLUserUPP* = WSUserProcPtr
  WSUserFunctionType* = MLUserUPP
  WSUserFunctionTypePointer* = ptr WSUserFunctionType
  WSUserFunction* = MLUserUPP

proc NewParameters*(rev: culong; apirev: culong): WSEnvironmentParameter {.
    importc: "WSNewParameters", discardable, header: wstphdr.}
proc ReleaseParameters*(ep: WSEnvironmentParameter) {.
    importc: "WSReleaseParameters", discardable, header: wstphdr.}
proc SetAllocParameter*(ep: WSEnvironmentParameter; allocator: WSAllocator;
                         deallocator: WSDeallocator) {.
    importc: "WSSetAllocParameter", discardable, header: wstphdr.}
proc SetThreadSafeLinksParameter*(ep: WSEnvironmentParameter): clong {.
    importc: "WSSetThreadSafeLinksParameter", discardable, header: wstphdr.}
proc AllocParameter*(ep: WSEnvironmentParameter; allocator: ptr WSAllocator;
                      deallocator: ptr WSDeallocator): cint {.
    importc: "WSAllocParameter", discardable, header: wstphdr.}
proc SetResourceParameter*(ep: WSEnvironmentParameter; path: cstring): clong {.
    importc: "WSSetResourceParameter", discardable, header: wstphdr.}
proc SetDeviceParameter*(ep: WSEnvironmentParameter; devspec: cstring): clong {.
    importc: "WSSetDeviceParameter", discardable, header: wstphdr.}
proc ErrorParameter*(ep: WSEnvironmentParameter): clong {.
    importc: "WSErrorParameter", discardable, header: wstphdr.}
proc SetEncodingParameter*(ep: WSEnvironmentParameter; etype: cuint): clong {.
    importc: "WSSetEncodingParameter", discardable, header: wstphdr.}
proc DoNotHandleSignalParameter*(ep: WSEnvironmentParameter; signum: cint): clong {.
    importc: "WSDoNotHandleSignalParameter", discardable, header: wstphdr.}
proc StopHandlingSignal*(env: WSEnvironment; signum: cint) {.
    importc: "WSStopHandlingSignal", discardable, header: wstphdr.}
proc HandleSignal*(env: WSEnvironment; signum: cint) {.importc: "WSHandleSignal", discardable, header: wstphdr.}
proc SetEnvironmentData*(env: WSEnvironment; cookie: pointer): clong {.
    importc: "WSSetEnvironmentData", discardable, header: wstphdr.}
proc EnvironmentData*(env: WSEnvironment): pointer {.importc: "WSEnvironmentData", discardable, header: wstphdr.}
proc SetSignalHandler*(env: WSEnvironment; signum: cint; so: pointer): cint {.
    importc: "WSSetSignalHandler", discardable, header: wstphdr.}
proc SetSignalHandlerFromFunction*(env: WSEnvironment; signum: cint;
                                    sigfunc: WSSignalHandlerType): cint {.
    importc: "WSSetSignalHandlerFromFunction", discardable, header: wstphdr.}
proc UnsetSignalHandler*(env: WSEnvironment; signum: cint;
                          sigfunc: WSSignalHandlerType): cint {.
    importc: "WSUnsetSignalHandler", discardable, header: wstphdr.}
proc SetSymbolReplacement*(mlp: WSLINK; priv: cstring; prlen: cint; pub: cstring;
                            pblen: cint): clong {.
    importc: "WSSetSymbolReplacement", discardable, header: wstphdr.}
proc ClearSymbolReplacement*(mlp: WSLINK; index: clong): cint {.
    importc: "WSClearSymbolReplacement", discardable, header: wstphdr.}
proc ClearAllSymbolReplacements*(mlp: WSLINK) {.
    importc: "WSClearAllSymbolReplacements", discardable, header: wstphdr.}
proc Initialize*(ep: WSEnvironmentParameter): WSEnvironment {.
    importc: "WSInitialize", discardable, header: wstphdr.}
proc Deinitialize*(env: WSEnvironment) {.importc: "WSDeinitialize", discardable, header: wstphdr.}
proc VersionNumbers*(env: WSEnvironment; inumb: ptr cint; rnumb: ptr cint;
                      bnumb: ptr cint) {.importc: "WSVersionNumbers", discardable, header: wstphdr.}
proc CompilerID*(env: WSEnvironment; id: cstringArray): cint {.
    importc: "WSCompilerID", discardable, header: wstphdr.}
proc ReleaseCompilerID*(env: WSEnvironment; id: cstring) {.
    importc: "WSReleaseCompilerID", discardable, header: wstphdr.}
proc UCS2CompilerID*(env: WSEnvironment; id: ptr ptr cushort; length: ptr cint): cint {.
    importc: "WSUCS2CompilerID", discardable, header: wstphdr.}
proc ReleaseUCS2CompilerID*(env: WSEnvironment; id: ptr cushort; length: cint) {.
    importc: "WSReleaseUCS2CompilerID", discardable, header: wstphdr.}
proc UTF8CompilerID*(env: WSEnvironment; id: ptr ptr cuchar; length: ptr cint): cint {.
    importc: "WSUTF8CompilerID", discardable, header: wstphdr.}
proc ReleaseUTF8CompilerID*(env: WSEnvironment; id: ptr cuchar; length: cint) {.
    importc: "WSReleaseUTF8CompilerID", discardable, header: wstphdr.}
proc UTF16CompilerID*(env: WSEnvironment; id: ptr ptr cushort; length: ptr cint): cint {.
    importc: "WSUTF16CompilerID", discardable, header: wstphdr.}
proc ReleaseUTF16CompilerID*(env: WSEnvironment; id: ptr cushort; length: cint) {.
    importc: "WSReleaseUTF16CompilerID", discardable, header: wstphdr.}
proc UTF32CompilerID*(env: WSEnvironment; id: ptr ptr cuint; length: ptr cint): cint {.
    importc: "WSUTF32CompilerID", discardable, header: wstphdr.}
proc ReleaseUTF32CompilerID*(env: WSEnvironment; id: ptr cuint; length: cint) {.
    importc: "WSReleaseUTF32CompilerID", discardable, header: wstphdr.}
proc Begin*(ep: WSEnvironmentParameter): WSEnvironment {.importc: "WSBegin", discardable, header: wstphdr.}
proc End*(env: WSEnvironment) {.importc: "WSEnd", discardable, header: wstphdr.}
proc SetEnvIDString*(ep: WSEnvironment; environment_id: cstring): cint {.
    importc: "WSSetEnvIDString", discardable, header: wstphdr.}
proc GetLinkedEnvIDString*(mlp: WSLINK; environment_id: cstringArray): cint {.
    importc: "WSGetLinkedEnvIDString", discardable, header: wstphdr.}
proc ReleaseEnvIDString*(mlp: WSLINK; environment_id: cstring) {.
    importc: "WSReleaseEnvIDString", discardable, header: wstphdr.}
proc GetNetworkAddressList*(ep: WSEnvironment; size: ptr culong): cstringArray {.
    importc: "WSGetNetworkAddressList", discardable, header: wstphdr.}
proc ReleaseNetworkAddressList*(ep: WSEnvironment; addresses: cstringArray;
                                 size: culong) {.
    importc: "WSReleaseNetworkAddressList", discardable, header: wstphdr.}
proc GetDomainNameList*(ep: WSEnvironment; size: ptr culong): cstringArray {.
    importc: "WSGetDomainNameList", discardable, header: wstphdr.}
proc ReleaseDomainNameList*(ep: WSEnvironment; dnsnames: cstringArray; size: culong) {.
    importc: "WSReleaseDomainNameList", discardable, header: wstphdr.}
proc GetAvailableLinkProtocolNames*(ep: WSEnvironment;
                                     protocolNames: ptr cstringArray;
                                     length: ptr cint): cint {.
    importc: "WSGetAvailableLinkProtocolNames", discardable, header: wstphdr.}
proc ReleaseLinkProtocolNames*(ep: WSEnvironment; protocolNames: cstringArray;
                                length: cint) {.
    importc: "WSReleaseLinkProtocolNames", discardable, header: wstphdr.}
proc GetLinksFromEnvironment*(ep: WSEnvironment; links: ptr ptr WSLINK;
                               length: ptr cint): cint {.
    importc: "WSGetLinksFromEnvironment", discardable, header: wstphdr.}
proc ReleaseLinksFromEnvironment*(ep: WSEnvironment; links: ptr WSLINK; length: cint) {.
    importc: "WSReleaseLinksFromEnvironment", discardable, header: wstphdr.}
proc NumericsQuery*(ep: WSEnvironment; selector: culong; p1: pointer; p2: pointer;
                     np: ptr clong): clong {.importc: "WSNumericsQuery", discardable, header: wstphdr.}
proc Valid*(mlp: WSLINK): cint {.importc: "WSValid", discardable, header: wstphdr.}
proc CreateLinkWithExternalProtocol*(ep: WSEnvironment; dev: dev_type;
                                      dev_main: dev_main_type; errp: ptr cint): WSLINK {.
    importc: "WSCreateLinkWithExternalProtocol", discardable, header: wstphdr.}
proc FilterArgv*(ep: WSEnvironment; argv: cstringArray; argv_end: cstringArray): cstringArray {.
    importc: "WSFilterArgv", discardable, header: wstphdr.}
proc FeatureString*(mlp: WSLINK; buf: cstring; buffsize: clong): clong {.
    importc: "WSFeatureString", discardable, header: wstphdr.}
proc OpenArgv*(ep: WSEnvironment; argv: cstringArray; argv_end: cstringArray;
                errp: ptr cint): WSLINK {.importc: "WSOpenArgv", discardable, header: wstphdr.}
proc OpenArgcArgv*(ep: WSEnvironment; argc: cint; argv: cstringArray; errp: ptr cint): WSLINK {.
    importc: "WSOpenArgcArgv", discardable, header: wstphdr.}
proc OpenString*(ep: WSEnvironment; command_line: cstring; errp: ptr cint): WSLINK {.
    importc: "WSOpenString", discardable, header: wstphdr.}
proc LoopbackOpen*(ep: WSEnvironment; errp: ptr cint): WSLINK {.
    importc: "WSLoopbackOpen", discardable, header: wstphdr.}
proc StringToArgv*(commandline: cstring; buf: cstring; argv: cstringArray; len: cint): cint {.
    importc: "WSStringToArgv", discardable, header: wstphdr.}
proc ScanString*(argv: cstringArray; argv_end: ptr cstringArray;
                  commandline: cstringArray; buf: cstringArray): clong {.
    importc: "WSScanString", discardable, header: wstphdr.}
proc PrintArgv*(buf: cstring; buf_endp: cstringArray; argvp: ptr cstringArray;
                 argv_end: cstringArray): clong {.importc: "WSPrintArgv", discardable, header: wstphdr.}
proc ErrorMessage*(mlp: WSLINK): cstring {.importc: "WSErrorMessage", discardable, header: wstphdr.}
proc ErrorString*(env: WSEnvironment; err: clong): cstring {.
    importc: "WSErrorString", discardable, header: wstphdr.}
proc UCS2ErrorMessage*(mlp: WSLINK; length: ptr cint): ptr cushort {.
    importc: "WSUCS2ErrorMessage", discardable, header: wstphdr.}
proc UTF8ErrorMessage*(mlp: WSLINK; length: ptr cint): ptr cuchar {.
    importc: "WSUTF8ErrorMessage", discardable, header: wstphdr.}
proc UTF16ErrorMessage*(mlp: WSLINK; length: ptr cint): ptr cushort {.
    importc: "WSUTF16ErrorMessage", discardable, header: wstphdr.}
proc UTF32ErrorMessage*(mlp: WSLINK; length: ptr cint): ptr cuint {.
    importc: "WSUTF32ErrorMessage", discardable, header: wstphdr.}
proc ReleaseErrorMessage*(mlp: WSLINK; message: cstring) {.
    importc: "WSReleaseErrorMessage", discardable, header: wstphdr.}
proc ReleaseUCS2ErrorMessage*(mlp: WSLINK; message: ptr cushort; length: cint) {.
    importc: "WSReleaseUCS2ErrorMessage", discardable, header: wstphdr.}
proc ReleaseUTF8ErrorMessage*(mlp: WSLINK; message: ptr cuchar; length: cint) {.
    importc: "WSReleaseUTF8ErrorMessage", discardable, header: wstphdr.}
proc ReleaseUTF16ErrorMessage*(mlp: WSLINK; message: ptr cushort; length: cint) {.
    importc: "WSReleaseUTF16ErrorMessage", discardable, header: wstphdr.}
proc ReleaseUTF32ErrorMessage*(mlp: WSLINK; message: ptr cuint; length: cint) {.
    importc: "WSReleaseUTF32ErrorMessage", discardable, header: wstphdr.}
proc Open*(argc: cint; argv: cstringArray): WSLINK {.importc: "WSOpen", discardable, header: wstphdr.}
proc OpenInEnv*(env: WSEnvironment; argc: cint; argv: cstringArray; errp: ptr cint): WSLINK {.
    importc: "WSOpenInEnv", discardable, header: wstphdr.}
proc DuplicateLink*(parentmlp: WSLINK; name: cstring; errp: ptr cint): WSLINK {.
    importc: "WSDuplicateLink", discardable, header: wstphdr.}
proc Connect*(mlp: WSLINK): cint {.importc: "WSConnect", discardable, header: wstphdr.}
proc Activate*(mlp: WSLINK): cint {.importc: "WSActivate", discardable, header: wstphdr.}
type
  feature_setp* = pointer

proc Establish*(mlp: WSLINK; features: feature_setp): cint {.importc: "WSEstablish", discardable, header: wstphdr.}
proc EstablishString*(mlp: WSLINK; features: cstring): cint {.
    importc: "WSEstablishString", discardable, header: wstphdr.}
proc Close*(mlp: WSLINK) {.importc: "WSClose", discardable, header: wstphdr.}
proc SetUserData*(mlp: WSLINK; data: pointer; f: WSUserFunction) {.
    importc: "WSSetUserData", discardable, header: wstphdr.}
proc UserData*(mlp: WSLINK; fp: ptr WSUserFunctionType): pointer {.
    importc: "WSUserData", discardable, header: wstphdr.}
proc SetUserBlock*(mlp: WSLINK; userblock: pointer) {.importc: "WSSetUserBlock", discardable, header: wstphdr.}
proc UserBlock*(mlp: WSLINK): pointer {.importc: "WSUserBlock", discardable, header: wstphdr.}
proc UserCast*(f: WSUserProcPtr): MLProcPtr {.importc: "WSUserCast", discardable, header: wstphdr.}
proc LogStreamToFile*(mlp: WSLINK; name: cstring): cint {.
    importc: "WSLogStreamToFile", discardable, header: wstphdr.}
proc DisableLoggingStream*(mlp: WSLINK): cint {.importc: "WSDisableLoggingStream", discardable, header: wstphdr.}
proc EnableLoggingStream*(mlp: WSLINK): cint {.importc: "WSEnableLoggingStream", discardable, header: wstphdr.}
proc StopLoggingStreamToFile*(mlp: WSLINK; name: cstring): cint {.
    importc: "WSStopLoggingStreamToFile", discardable, header: wstphdr.}
proc StopLoggingStream*(mlp: WSLINK): cint {.importc: "WSStopLoggingStream", discardable, header: wstphdr.}
proc LogFileNameForLink*(mlp: WSLINK; name: cstringArray): cint {.
    importc: "WSLogFileNameForLink", discardable, header: wstphdr.}
proc ReleaseLogFileNameForLink*(mlp: WSLINK; name: cstring) {.
    importc: "WSReleaseLogFileNameForLink", discardable, header: wstphdr.}
proc Name*(mlp: WSLINK): cstring {.importc: "WSName", discardable, header: wstphdr.}
proc LinkName*(mlp: WSLINK): cstring {.importc: "WSLinkName", discardable, header: wstphdr.}
proc UCS2LinkName*(mlp: WSLINK; length: ptr cint): ptr cushort {.
    importc: "WSUCS2LinkName", discardable, header: wstphdr.}
proc UTF8LinkName*(mlp: WSLINK; length: ptr cint): ptr cuchar {.
    importc: "WSUTF8LinkName", discardable, header: wstphdr.}
proc UTF16LinkName*(mlp: WSLINK; length: ptr cint): ptr cushort {.
    importc: "WSUTF16LinkName", discardable, header: wstphdr.}
proc UTF32LinkName*(mlp: WSLINK; length: ptr cint): ptr cuint {.
    importc: "WSUTF32LinkName", discardable, header: wstphdr.}
proc ReleaseLinkName*(mlp: WSLINK; name: cstring) {.importc: "WSReleaseLinkName", discardable, header: wstphdr.}
proc ReleaseUCS2LinkName*(mlp: WSLINK; name: ptr cushort; length: cint) {.
    importc: "WSReleaseUCS2LinkName", discardable, header: wstphdr.}
proc ReleaseUTF8LinkName*(mlp: WSLINK; name: ptr cuchar; length: cint) {.
    importc: "WSReleaseUTF8LinkName", discardable, header: wstphdr.}
proc ReleaseUTF16LinkName*(mlp: WSLINK; name: ptr cushort; length: cint) {.
    importc: "WSReleaseUTF16LinkName", discardable, header: wstphdr.}
proc ReleaseUTF32LinkName*(mlp: WSLINK; name: ptr cuint; length: cint) {.
    importc: "WSReleaseUTF32LinkName", discardable, header: wstphdr.}
proc Number*(mlp: WSLINK): clong {.importc: "WSNumber", discardable, header: wstphdr.}
proc ToLinkID*(mlp: WSLINK): clong {.importc: "WSToLinkID", discardable, header: wstphdr.}
proc FromLinkID*(ep: WSEnvironment; n: clong): WSLINK {.importc: "WSFromLinkID", discardable, header: wstphdr.}
proc SetName*(mlp: WSLINK; name: cstring): cstring {.importc: "WSSetName", discardable, header: wstphdr.}
proc Init*(alloc: WSAllocator; dealloc: WSDeallocator;
            enclosing_environment: pointer): pointer {.importc: "WSInit", discardable, header: wstphdr.}
proc Deinit*(env: pointer) {.importc: "WSDeinit", discardable, header: wstphdr.}
proc EnclosingEnvironment*(ep: pointer): pointer {.
    importc: "WSEnclosingEnvironment", discardable, header: wstphdr.}
proc WLinkEnvironment*(mlp: WSLINK): pointer {.importc: "WLinkEnvironment", discardable, header: wstphdr.}
proc EnableLinkLock*(mlp: WSLINK) {.importc: "WSEnableLinkLock", discardable, header: wstphdr.}
proc DisableLinkLock*(mlp: WSLINK) {.importc: "WSDisableLinkLock", discardable, header: wstphdr.}
proc LinkEnvironment*(mlp: WSLINK): WSEnvironment {.importc: "WSLinkEnvironment", discardable, header: wstphdr.}
proc IsLinkLoopback*(mlp: WSLINK): cint {.importc: "WSIsLinkLoopback", discardable, header: wstphdr.}
proc DefaultYieldFunction*(env: WSEnvironment): WSYieldFunctionObject {.
    importc: "WSDefaultYieldFunction", discardable, header: wstphdr.}
proc SetDefaultYieldFunction*(env: WSEnvironment; yf: WSYieldFunctionObject): cint {.
    importc: "WSSetDefaultYieldFunction", discardable, header: wstphdr.}
type
  WSLinkServer* = pointer
  WSNewLinkCallbackFunction* = proc (server: WSLinkServer; link: WSLINK)

proc NewLinkServer*(env: WSEnvironment; context: pointer; error: ptr cint): WSLinkServer {.
    importc: "WSNewLinkServer", discardable, header: wstphdr.}
proc NewLinkServerWithPort*(env: WSEnvironment; port: cushort; context: pointer;
                             error: ptr cint): WSLinkServer {.
    importc: "WSNewLinkServerWithPort", discardable, header: wstphdr.}
proc NewLinkServerWithPortAndInterface*(env: WSEnvironment; port: cushort;
    iface: cstring; context: pointer; error: ptr cint): WSLinkServer {.
    importc: "WSNewLinkServerWithPortAndInterface", discardable, header: wstphdr.}
proc ShutdownLinkServer*(server: WSLinkServer) {.importc: "WSShutdownLinkServer", discardable, header: wstphdr.}
proc RegisterCallbackFunctionWithLinkServer*(server: WSLinkServer;
    function: WSNewLinkCallbackFunction) {.
    importc: "WSRegisterCallbackFunctionWithLinkServer", discardable, header: wstphdr.}
proc WaitForNewLinkFromLinkServer*(server: WSLinkServer; error: ptr cint): WSLINK {.
    importc: "WSWaitForNewLinkFromLinkServer", discardable, header: wstphdr.}
proc PortFromLinkServer*(server: WSLinkServer; error: ptr cint): cushort {.
    importc: "WSPortFromLinkServer", discardable, header: wstphdr.}
proc InterfaceFromLinkServer*(server: WSLinkServer; error: ptr cint): cstring {.
    importc: "WSInterfaceFromLinkServer", discardable, header: wstphdr.}
proc ContextFromLinkServer*(server: WSLinkServer; error: ptr cint): pointer {.
    importc: "WSContextFromLinkServer", discardable, header: wstphdr.}
proc ReleaseInterfaceFromLinkServer*(server: WSLinkServer; iface: cstring) {.
    importc: "WSReleaseInterfaceFromLinkServer", discardable, header: wstphdr.}
type
  WSServiceRef* = pointer
  MLBrowseCallbackFunction* = proc (env: WSEnvironment; `ref`: WSServiceRef;
                                 flag: cint; serviceName: cstring; context: pointer)

proc BrowseForLinkServices*(env: WSEnvironment;
                             callbackFunction: MLBrowseCallbackFunction;
                             serviceProtocol: cstring; domain: cstring;
                             context: pointer; `ref`: ptr WSServiceRef): cint {.
    importc: "WSBrowseForLinkServices", discardable, header: wstphdr.}
proc StopBrowsingForLinkServices*(env: WSEnvironment; `ref`: WSServiceRef) {.
    importc: "WSStopBrowsingForLinkServices", discardable, header: wstphdr.}
type
  MLResolveCallbackFunction* = proc (env: WSEnvironment; `ref`: WSServiceRef;
                                  serviceName: cstring; linkName: cstring;
                                  protocol: cstring; options: cint; context: pointer)

proc ResolveLinkService*(env: WSEnvironment; a3: MLResolveCallbackFunction;
                          serviceProtocol: cstring; serviceName: cstring;
                          context: pointer; `ref`: ptr WSServiceRef): cint {.
    importc: "WSResolveLinkService", discardable, header: wstphdr.}
proc StopResolvingLinkService*(env: WSEnvironment; `ref`: WSServiceRef) {.
    importc: "WSStopResolvingLinkService", discardable, header: wstphdr.}
type
  MLRegisterCallbackFunction* = proc (env: WSEnvironment; `ref`: WSServiceRef;
                                   flag: cint; serviceName: cstring;
                                   context: pointer)

proc RegisterLinkServiceWithPortAndHostname*(env: WSEnvironment;
    serviceProtocol: cstring; serviceName: cstring; port: cushort; hostname: cstring;
    function: MLRegisterCallbackFunction; domain: cstring; context: pointer;
    `ref`: ptr WSServiceRef; error: ptr cint): WSLINK {.
    importc: "WSRegisterLinkServiceWithPortAndHostname", discardable, header: wstphdr.}
proc RegisterLinkServiceWithHostname*(env: WSEnvironment;
                                       serviceProtocol: cstring;
                                       serviceName: cstring; hostname: cstring;
                                       function: MLRegisterCallbackFunction;
                                       domain: cstring; context: pointer;
                                       `ref`: ptr WSServiceRef; error: ptr cint): WSLINK {.
    importc: "WSRegisterLinkServiceWithHostname", discardable, header: wstphdr.}
proc RegisterLinkService*(env: WSEnvironment; serviceProtocol: cstring;
                           serviceName: cstring;
                           function: MLRegisterCallbackFunction; domain: cstring;
                           context: pointer; a8: ptr WSServiceRef; error: ptr cint): WSLINK {.
    importc: "WSRegisterLinkService", discardable, header: wstphdr.}
proc MLRegisterLinkServiceUsingLinkProtocol*(env: WSEnvironment;
    serviceProtocol: cstring; serviceName: cstring; port: cushort; hostname: cstring;
    protocol: cstring; function: MLRegisterCallbackFunction; domain: cstring;
    context: pointer; `ref`: ptr WSServiceRef; error: ptr cint): WSLINK {.
    importc: "MLRegisterLinkServiceUsingLinkProtocol", discardable, header: wstphdr.}
proc RegisterLinkServiceFromLinkServer*(env: WSEnvironment;
    serviceProtocol: cstring; serviceName: cstring; server: WSLinkServer;
    function: MLRegisterCallbackFunction; domain: cstring; context: pointer;
    `ref`: ptr WSServiceRef; error: ptr cint) {.
    importc: "WSRegisterLinkServiceFromLinkServer", discardable, header: wstphdr.}
proc StopRegisteringLinkService*(env: WSEnvironment; `ref`: WSServiceRef) {.
    importc: "WSStopRegisteringLinkService", discardable, header: wstphdr.}
proc StopRegisteringLinkServiceForLink*(env: WSEnvironment; link: WSLINK;
    `ref`: WSServiceRef) {.importc: "WSStopRegisteringLinkServiceForLink", discardable, header: wstphdr.}
proc ServiceProtocolFromReference*(env: WSEnvironment; `ref`: WSServiceRef): cstring {.
    importc: "WSServiceProtocolFromReference", discardable, header: wstphdr.}
proc Error*(mlp: WSLINK): cint {.importc: "WSError", discardable, header: wstphdr.}
proc ClearError*(mlp: WSLINK): cint {.importc: "WSClearError", discardable, header: wstphdr.}
proc SetError*(mlp: WSLINK; err: cint): cint {.importc: "WSSetError", discardable, header: wstphdr.}
const
  WSTerminateMessage* = 1
  WSInterruptMessage* = 2
  WSAbortMessage* = 3
  WSEndPacketMessage* = 4
  WSSynchronizeMessage* = 5
  WSImDyingMessage* = 6
  WSWaitingAcknowledgment* = 7
  WSMarkTopLevelMessage* = 8
  WSLinkClosingMessage* = 9
  WSAuthenticateFailure* = 10
  WSSuspendActivitiesMessage* = 11
  WSResumeActivitiesMessage* = 12
  WSFirstUserMessage* = 128
  WSLastUserMessage* = 255

type
  devinfo_selector* = culong

proc PutMessage*(mlp: WSLINK; msg: cint): cint {.importc: "WSPutMessage", discardable, header: wstphdr.}
proc GetMessage*(mlp: WSLINK; mp: ptr cint; np: ptr cint): cint {.
    importc: "WSGetMessage", discardable, header: wstphdr.}
proc MessageReady*(mlp: WSLINK): cint {.importc: "WSMessageReady", discardable, header: wstphdr.}
proc PutMessageWithArg*(mlp: WSLINK; msg: cint; arg: cint): cint {.
    importc: "WSPutMessageWithArg", discardable, header: wstphdr.}
proc GetMessageHandler*(mlp: WSLINK): WSMessageHandlerObject {.
    importc: "WSGetMessageHandler", discardable, header: wstphdr.}
proc MessageHandler*(mlp: WSLINK): WSMessageHandlerObject {.
    importc: "WSMessageHandler", discardable, header: wstphdr.}
proc GetYieldFunction*(mlp: WSLINK): WSYieldFunctionObject {.
    importc: "WSGetYieldFunction", discardable, header: wstphdr.}
proc YieldFunction*(mlp: WSLINK): WSYieldFunctionObject {.
    importc: "WSYieldFunction", discardable, header: wstphdr.}
proc SetMessageHandler*(mlp: WSLINK; h: WSMessageHandlerObject): cint {.
    importc: "WSSetMessageHandler", discardable, header: wstphdr.}
proc SetYieldFunction*(mlp: WSLINK; yf: WSYieldFunctionObject): cint {.
    importc: "WSSetYieldFunction", discardable, header: wstphdr.}
proc DeviceInformation*(mlp: WSLINK; selector: devinfo_selector; buf: pointer;
                         buflen: ptr clong): cint {.importc: "WSDeviceInformation", discardable, header: wstphdr.}
proc LowLevelDeviceName*(mlp: WSLINK; name: cstringArray): cint {.
    importc: "WSLowLevelDeviceName", discardable, header: wstphdr.}
proc ReleaseLowLevelDeviceName*(mlp: WSLINK; name: cstring) {.
    importc: "WSReleaseLowLevelDeviceName", discardable, header: wstphdr.}
proc GetNext*(mlp: WSLINK): cint {.importc: "WSGetNext", discardable, header: wstphdr.}
proc GetNextRaw*(mlp: WSLINK): cint {.importc: "WSGetNextRaw", discardable, header: wstphdr.}
proc GetType*(mlp: WSLINK): cint {.importc: "WSGetType", discardable, header: wstphdr.}
proc GetRawType*(mlp: WSLINK): cint {.importc: "WSGetRawType", discardable, header: wstphdr.}
proc GetRawData*(mlp: WSLINK; data: ptr cuchar; size: cint; gotp: ptr cint): cint {.
    importc: "WSGetRawData", discardable, header: wstphdr.}
proc GetData*(mlp: WSLINK; data: cstring; size: cint; gotp: ptr cint): cint {.
    importc: "WSGetData", discardable, header: wstphdr.}
proc GetArgCount*(mlp: WSLINK; countp: ptr cint): cint {.importc: "WSGetArgCount", discardable, header: wstphdr.}
proc GetRawArgCount*(mlp: WSLINK; countp: ptr cint): cint {.
    importc: "WSGetRawArgCount", discardable, header: wstphdr.}
proc BytesToGet*(mlp: WSLINK; leftp: ptr cint): cint {.importc: "WSBytesToGet", discardable, header: wstphdr.}
proc RawBytesToGet*(mlp: WSLINK; leftp: ptr cint): cint {.importc: "WSRawBytesToGet", discardable, header: wstphdr.}
proc ExpressionsToGet*(mlp: WSLINK; countp: ptr cint): cint {.
    importc: "WSExpressionsToGet", discardable, header: wstphdr.}
proc NewPacket*(mlp: WSLINK): cint {.importc: "WSNewPacket", discardable, header: wstphdr.}
proc TakeLast*(mlp: WSLINK; eleft: cint): cint {.importc: "WSTakeLast", discardable, header: wstphdr.}
proc Fill*(mlp: WSLINK): cint {.importc: "WSFill", discardable, header: wstphdr.}
proc PutNext*(mlp: WSLINK; tok: cint): cint {.importc: "WSPutNext", discardable, header: wstphdr.}
proc PutType*(mlp: WSLINK; tok: cint): cint {.importc: "WSPutType", discardable, header: wstphdr.}
proc PutRawSize*(mlp: WSLINK; size: cint): cint {.importc: "WSPutRawSize", discardable, header: wstphdr.}
proc PutRawData*(mlp: WSLINK; data: ptr cuchar; len: cint): cint {.
    importc: "WSPutRawData", discardable, header: wstphdr.}
proc PutArgCount*(mlp: WSLINK; argc: cint): cint {.importc: "WSPutArgCount", discardable, header: wstphdr.}
proc PutComposite*(mlp: WSLINK; argc: cint): cint {.importc: "WSPutComposite", discardable, header: wstphdr.}
proc BytesToPut*(mlp: WSLINK; leftp: ptr cint): cint {.importc: "WSBytesToPut", discardable, header: wstphdr.}
proc EndPacket*(mlp: WSLINK): cint {.importc: "WSEndPacket", discardable, header: wstphdr.}
proc Flush*(mlp: WSLINK): cint {.importc: "WSFlush", discardable, header: wstphdr.}
type
  decoder_mask* = culong

proc GetBinaryNumber*(mlp: WSLINK; np: pointer; `type`: clong): cint {.
    importc: "WSGetBinaryNumber", discardable, header: wstphdr.}
proc GetShortInteger*(mlp: WSLINK; hp: ptr cshort): cint {.
    importc: "WSGetShortInteger", discardable, header: wstphdr.}
proc GetInteger*(mlp: WSLINK; ip: ptr cint): cint {.importc: "WSGetInteger", discardable, header: wstphdr.}
proc GetLongInteger*(mlp: WSLINK; lp: ptr clong): cint {.importc: "WSGetLongInteger", discardable, header: wstphdr.}
proc GetInteger16*(mlp: WSLINK; hp: ptr cshort): cint {.importc: "WSGetInteger16", discardable, header: wstphdr.}
proc GetInteger32*(mlp: WSLINK; ip: ptr cint): cint {.importc: "WSGetInteger32", discardable, header: wstphdr.}
proc GetInteger64*(mlp: WSLINK; wp: ptr wsint64): cint {.importc: "WSGetInteger64", discardable, header: wstphdr.}
proc GetInteger8*(mlp: WSLINK; cp: ptr cuchar): cint {.importc: "WSGetInteger8", discardable, header: wstphdr.}
proc GetFloat*(mlp: WSLINK; fp: ptr cfloat): cint {.importc: "WSGetFloat", discardable, header: wstphdr.}
proc GetDouble*(mlp: WSLINK; dp: ptr cdouble): cint {.importc: "WSGetDouble", discardable, header: wstphdr.}
proc GetReal*(mlp: WSLINK; dp: ptr cdouble): cint {.importc: "WSGetReal", discardable, header: wstphdr.}
proc GetLongDouble*(mlp: WSLINK; xp: ptr wsextended_double): cint {.
    importc: "WSGetLongDouble", discardable, header: wstphdr.}
proc GetReal32*(mlp: WSLINK; fp: ptr cfloat): cint {.importc: "WSGetReal32", discardable, header: wstphdr.}
proc GetReal64*(mlp: WSLINK; dp: ptr cdouble): cint {.importc: "WSGetReal64", discardable, header: wstphdr.}
proc GetReal128*(mlp: WSLINK; dp: ptr wsextended_double): cint {.
    importc: "WSGetReal128", discardable, header: wstphdr.}
proc Get8BitCharacters*(mlp: WSLINK; chars_left: ptr clong; buf: ptr cuchar;
                         cardof_buf: clong; got: ptr clong; missing: clong): cint {.
    importc: "WSGet8BitCharacters", discardable, header: wstphdr.}
proc Get7BitCharacters*(mlp: WSLINK; chars_left: ptr clong; buf: cstring;
                         cardof_buf: clong; got: ptr clong): cint {.
    importc: "WSGet7BitCharacters", discardable, header: wstphdr.}
proc GetUCS2Characters*(mlp: WSLINK; chars_left: ptr cint; buf: ptr cushort;
                         cardof_buf: cint; got: ptr cint): cint {.
    importc: "WSGetUCS2Characters", discardable, header: wstphdr.}
proc GetUTF8Characters*(mlp: WSLINK; chars_left: ptr cint; buf: ptr cuchar;
                         cardof_buf: cint; got: ptr cint): cint {.
    importc: "WSGetUTF8Characters", discardable, header: wstphdr.}
proc GetUTF16Characters*(mlp: WSLINK; chars_left: ptr cint; buf: ptr cushort;
                          cardof_buf: cint; got: ptr cint): cint {.
    importc: "WSGetUTF16Characters", discardable, header: wstphdr.}
proc GetUTF32Characters*(mlp: WSLINK; chars_left: ptr cint; buf: ptr cuint;
                          cardof_buf: cint; got: ptr cint): cint {.
    importc: "WSGetUTF32Characters", discardable, header: wstphdr.}
proc GetByteString*(mlp: WSLINK; sp: ptr ptr cuchar; lenp: ptr cint; missing: clong): cint {.
    importc: "WSGetByteString", discardable, header: wstphdr.}
proc GetString*(mlp: WSLINK; sp: cstringArray): cint {.importc: "WSGetString", discardable, header: wstphdr.}
proc GetUCS2String*(mlp: WSLINK; sp: ptr ptr cushort; lenp: ptr cint): cint {.
    importc: "WSGetUCS2String", discardable, header: wstphdr.}
proc GetUTF8String*(mlp: WSLINK; sp: ptr ptr cuchar; bytes: ptr cint; chars: ptr cint): cint {.
    importc: "WSGetUTF8String", discardable, header: wstphdr.}
proc GetUTF16String*(mlp: WSLINK; sp: ptr ptr cushort; ncodes: ptr cint; chars: ptr cint): cint {.
    importc: "WSGetUTF16String", discardable, header: wstphdr.}
proc GetUTF32String*(mlp: WSLINK; sp: ptr ptr cuint; len: ptr cint): cint {.
    importc: "WSGetUTF32String", discardable, header: wstphdr.}
proc GetNumberAsByteString*(mlp: WSLINK; sp: ptr ptr cuchar; lenp: ptr clong;
                             missing: clong): cint {.
    importc: "WSGetNumberAsByteString", discardable, header: wstphdr.}
proc GetNumberAsString*(mlp: WSLINK; sp: cstringArray): cint {.
    importc: "WSGetNumberAsString", discardable, header: wstphdr.}
proc GetNumberAsUCS2String*(mlp: WSLINK; sp: ptr ptr cushort; lenp: ptr cint): cint {.
    importc: "WSGetNumberAsUCS2String", discardable, header: wstphdr.}
proc GetNumberAsUTF8String*(mlp: WSLINK; sp: ptr ptr cuchar; bytes: ptr cint;
                             chars: ptr cint): cint {.
    importc: "WSGetNumberAsUTF8String", discardable, header: wstphdr.}
proc GetNumberAsUTF16String*(mlp: WSLINK; sp: ptr ptr cushort; ncodes: ptr cint;
                              chars: ptr cint): cint {.
    importc: "WSGetNumberAsUTF16String", discardable, header: wstphdr.}
proc GetNumberAsUTF32String*(mlp: WSLINK; sp: ptr ptr cuint; lenp: ptr cint): cint {.
    importc: "WSGetNumberAsUTF32String", discardable, header: wstphdr.}
proc ReleaseUCS2String*(mlp: WSLINK; s: ptr cushort; len: cint) {.
    importc: "WSReleaseUCS2String", discardable, header: wstphdr.}
proc ReleaseUTF8String*(mlp: WSLINK; s: ptr cuchar; len: cint) {.
    importc: "WSReleaseUTF8String", discardable, header: wstphdr.}
proc ReleaseUTF16String*(mlp: WSLINK; s: ptr cushort; len: cint) {.
    importc: "WSReleaseUTF16String", discardable, header: wstphdr.}
proc ReleaseUTF32String*(mlp: WSLINK; s: ptr cuint; len: cint) {.
    importc: "WSReleaseUTF32String", discardable, header: wstphdr.}
proc ReleaseByteString*(mlp: WSLINK; s: ptr cuchar; len: cint) {.
    importc: "WSReleaseByteString", discardable, header: wstphdr.}
proc ReleaseString*(mlp: WSLINK; s: cstring) {.importc: "WSReleaseString", discardable, header: wstphdr.}
proc TestString*(mlp: WSLINK; name: cstring): cint {.importc: "WSTestString", discardable, header: wstphdr.}
proc TestUCS2String*(mlp: WSLINK; name: ptr cushort; length: cint): cint {.
    importc: "WSTestUCS2String", discardable, header: wstphdr.}
proc TestUTF8String*(mlp: WSLINK; name: ptr cuchar; length: cint): cint {.
    importc: "WSTestUTF8String", discardable, header: wstphdr.}
proc TestUTF16String*(mlp: WSLINK; name: ptr cushort; length: cint): cint {.
    importc: "WSTestUTF16String", discardable, header: wstphdr.}
proc TestUTF32String*(mlp: WSLINK; name: ptr cuint; length: cint): cint {.
    importc: "WSTestUTF32String", discardable, header: wstphdr.}
proc GetByteSymbol*(mlp: WSLINK; sp: ptr ptr cuchar; lenp: ptr cint; missing: clong): cint {.
    importc: "WSGetByteSymbol", discardable, header: wstphdr.}
proc GetSymbol*(mlp: WSLINK; sp: cstringArray): cint {.importc: "WSGetSymbol", discardable, header: wstphdr.}
proc GetUCS2Symbol*(mlp: WSLINK; sp: ptr ptr cushort; lenp: ptr cint): cint {.
    importc: "WSGetUCS2Symbol", discardable, header: wstphdr.}
proc GetUTF8Symbol*(mlp: WSLINK; sp: ptr ptr cuchar; bytes: ptr cint; chars: ptr cint): cint {.
    importc: "WSGetUTF8Symbol", discardable, header: wstphdr.}
proc GetUTF16Symbol*(mlp: WSLINK; sp: ptr ptr cushort; ncodes: ptr cint; chars: ptr cint): cint {.
    importc: "WSGetUTF16Symbol", discardable, header: wstphdr.}
proc GetUTF32Symbol*(mlp: WSLINK; sp: ptr ptr cuint; lenp: ptr cint): cint {.
    importc: "WSGetUTF32Symbol", discardable, header: wstphdr.}
proc ReleaseUCS2Symbol*(mlp: WSLINK; s: ptr cushort; len: cint) {.
    importc: "WSReleaseUCS2Symbol", discardable, header: wstphdr.}
proc ReleaseUTF8Symbol*(mlp: WSLINK; s: ptr cuchar; len: cint) {.
    importc: "WSReleaseUTF8Symbol", discardable, header: wstphdr.}
proc ReleaseUTF16Symbol*(mlp: WSLINK; s: ptr cushort; len: cint) {.
    importc: "WSReleaseUTF16Symbol", discardable, header: wstphdr.}
proc ReleaseUTF32Symbol*(mlp: WSLINK; s: ptr cuint; len: cint) {.
    importc: "WSReleaseUTF32Symbol", discardable, header: wstphdr.}
proc ReleaseByteSymbol*(mlp: WSLINK; s: ptr cuchar; len: cint) {.
    importc: "WSReleaseByteSymbol", discardable, header: wstphdr.}
proc ReleaseSymbol*(mlp: WSLINK; s: cstring) {.importc: "WSReleaseSymbol", discardable, header: wstphdr.}
proc TestSymbol*(mlp: WSLINK; name: cstring): cint {.importc: "WSTestSymbol", discardable, header: wstphdr.}
proc TestUCS2Symbol*(mlp: WSLINK; name: ptr cushort; length: cint): cint {.
    importc: "WSTestUCS2Symbol", discardable, header: wstphdr.}
proc TestUTF8Symbol*(mlp: WSLINK; name: ptr cuchar; length: cint): cint {.
    importc: "WSTestUTF8Symbol", discardable, header: wstphdr.}
proc TestUTF16Symbol*(mlp: WSLINK; name: ptr cushort; length: cint): cint {.
    importc: "WSTestUTF16Symbol", discardable, header: wstphdr.}
proc TestUTF32Symbol*(mlp: WSLINK; name: ptr cuint; length: cint): cint {.
    importc: "WSTestUTF32Symbol", discardable, header: wstphdr.}
proc GetFunction*(mlp: WSLINK; sp: cstringArray; countp: ptr cint): cint {.
    importc: "WSGetFunction", discardable, header: wstphdr.}
proc MLGetUCS2Function*(mlp: WSLINK; sp: ptr ptr cushort; length: ptr cint;
                       countp: ptr cint): cint {.importc: "MLGetUCS2Function", discardable, header: wstphdr.}
proc MLGetUTF8Function*(mlp: WSLINK; sp: ptr ptr cuchar; length: ptr cint;
                       countp: ptr cint): cint {.importc: "MLGetUTF8Function", discardable, header: wstphdr.}
proc MLGetUTF16Function*(mlp: WSLINK; sp: ptr ptr cushort; length: ptr cint;
                        countp: ptr cint): cint {.importc: "MLGetUTF16Function", discardable, header: wstphdr.}
proc MLGetUTF32Function*(mlp: WSLINK; sp: ptr ptr cuint; length: ptr cint;
                        countp: ptr cint): cint {.importc: "MLGetUTF32Function", discardable, header: wstphdr.}
proc CheckFunction*(mlp: WSLINK; s: cstring; countp: ptr clong): cint {.
    importc: "WSCheckFunction", discardable, header: wstphdr.}
proc CheckFunctionWithArgCount*(mlp: WSLINK; s: cstring; countp: ptr clong): cint {.
    importc: "WSCheckFunctionWithArgCount", discardable, header: wstphdr.}
proc TestHead*(mlp: WSLINK; s: cstring; countp: ptr cint): cint {.
    importc: "WSTestHead", discardable, header: wstphdr.}
proc TestHeadWithArgCount*(mlp: WSLINK; s: cstring; countp: ptr cint): cint {.
    importc: "WSTestHeadWithArgCount", discardable, header: wstphdr.}
proc TestUCS2HeadWithArgCount*(mlp: WSLINK; s: ptr cushort; length: cint;
                                countp: ptr cint): cint {.
    importc: "WSTestUCS2HeadWithArgCount", discardable, header: wstphdr.}
proc TestUTF16HeadWithArgCount*(mlp: WSLINK; s: ptr cushort; length: cint;
                                 countp: ptr cint): cint {.
    importc: "WSTestUTF16HeadWithArgCount", discardable, header: wstphdr.}
proc TestUTF32HeadWithArgCount*(mlp: WSLINK; s: ptr cuint; length: cint;
                                 countp: ptr cint): cint {.
    importc: "WSTestUTF32HeadWithArgCount", discardable, header: wstphdr.}
proc TestUTF8HeadWithArgCount*(mlp: WSLINK; s: ptr cuchar; length: cint;
                                countp: ptr cint): cint {.
    importc: "WSTestUTF8HeadWithArgCount", discardable, header: wstphdr.}
proc TestUCS2Head*(mlp: WSLINK; s: ptr cushort; length: cint; countp: ptr cint): cint {.
    importc: "WSTestUCS2Head", discardable, header: wstphdr.}
proc TestUTF8Head*(mlp: WSLINK; s: ptr cuchar; length: cint; countp: ptr cint): cint {.
    importc: "WSTestUTF8Head", discardable, header: wstphdr.}
proc TestUTF16Head*(mlp: WSLINK; s: ptr cushort; length: cint; countp: ptr cint): cint {.
    importc: "WSTestUTF16Head", discardable, header: wstphdr.}
proc TestUTF32Head*(mlp: WSLINK; s: ptr cuint; length: cint; countp: ptr cint): cint {.
    importc: "WSTestUTF32Head", discardable, header: wstphdr.}
proc PutBinaryNumber*(mlp: WSLINK; np: pointer; `type`: clong): cint {.
    importc: "WSPutBinaryNumber", discardable, header: wstphdr.}
proc PutShortInteger*(mlp: WSLINK; h: cint): cint {.importc: "WSPutShortInteger", discardable, header: wstphdr.}
proc PutInteger*(mlp: WSLINK; i: cint): cint {.importc: "WSPutInteger", discardable, header: wstphdr.}
proc PutLongInteger*(mlp: WSLINK; l: clong): cint {.importc: "WSPutLongInteger", discardable, header: wstphdr.}
proc PutInteger16*(mlp: WSLINK; h: cint): cint {.importc: "WSPutInteger16", discardable, header: wstphdr.}
proc PutInteger32*(mlp: WSLINK; i: cint): cint {.importc: "WSPutInteger32", discardable, header: wstphdr.}
proc PutInteger64*(mlp: WSLINK; w: wsint64): cint {.importc: "WSPutInteger64", discardable, header: wstphdr.}
proc PutInteger8*(mlp: WSLINK; i: cuchar): cint {.importc: "WSPutInteger8", discardable, header: wstphdr.}
proc PutFloat*(mlp: WSLINK; f: cdouble): cint {.importc: "WSPutFloat", discardable, header: wstphdr.}
proc PutDouble*(mlp: WSLINK; d: cdouble): cint {.importc: "WSPutDouble", discardable, header: wstphdr.}
proc PutReal*(mlp: WSLINK; d: cdouble): cint {.importc: "WSPutReal", discardable, header: wstphdr.}
proc PutLongDouble*(mlp: WSLINK; x: wsextended_double): cint {.
    importc: "WSPutLongDouble", discardable, header: wstphdr.}
proc PutReal32*(mlp: WSLINK; f: cdouble): cint {.importc: "WSPutReal32", discardable, header: wstphdr.}
proc PutReal64*(mlp: WSLINK; d: cdouble): cint {.importc: "WSPutReal64", discardable, header: wstphdr.}
proc PutReal128*(mlp: WSLINK; x: wsextended_double): cint {.importc: "WSPutReal128", discardable, header: wstphdr.}
proc Put8BitCharacters*(mlp: WSLINK; chars_left: clong; bytes: ptr cuchar;
                         nbytes: clong): cint {.importc: "WSPut8BitCharacters", discardable, header: wstphdr.}
proc Put7BitCount*(mlp: WSLINK; count: clong; size: clong): cint {.
    importc: "WSPut7BitCount", discardable, header: wstphdr.}
proc Put7BitCharacters*(mlp: WSLINK; chars_left: clong; bytes: cstring;
                         nbytes: clong; nchars_now: clong): cint {.
    importc: "WSPut7BitCharacters", discardable, header: wstphdr.}
proc PutUCS2Characters*(mlp: WSLINK; chars_left: cint; codes: ptr cushort;
                         ncodes: cint): cint {.importc: "WSPutUCS2Characters", discardable, header: wstphdr.}
proc PutUTF8Characters*(mlp: WSLINK; chars_left: cint; codes: ptr cuchar; ncodes: cint): cint {.
    importc: "WSPutUTF8Characters", discardable, header: wstphdr.}
proc PutUTF16Characters*(mlp: WSLINK; chars_left: cint; codes: ptr cushort;
                          ncodes: cint): cint {.importc: "WSPutUTF16Characters", discardable, header: wstphdr.}
proc PutUTF32Characters*(mlp: WSLINK; chars_left: cint; codes: ptr cuint; ncodes: cint): cint {.
    importc: "WSPutUTF32Characters", discardable, header: wstphdr.}
proc PutByteString*(mlp: WSLINK; s: ptr cuchar; len: clong): cint {.
    importc: "WSPutByteString", discardable, header: wstphdr.}
proc PutString*(mlp: WSLINK; s: cstring): cint {.importc: "WSPutString", discardable, header: wstphdr.}
proc PutUCS2String*(mlp: WSLINK; s: ptr cushort; len: cint): cint {.
    importc: "WSPutUCS2String", discardable, header: wstphdr.}
proc PutUTF8String*(mlp: WSLINK; s: ptr cuchar; len: cint): cint {.
    importc: "WSPutUTF8String", discardable, header: wstphdr.}
proc PutUTF16String*(mlp: WSLINK; s: ptr cushort; len: cint): cint {.
    importc: "WSPutUTF16String", discardable, header: wstphdr.}
proc PutUTF32String*(mlp: WSLINK; s: ptr cuint; len: cint): cint {.
    importc: "WSPutUTF32String", discardable, header: wstphdr.}
proc PutRealNumberAsString*(mlp: WSLINK; s: cstring): cint {.
    importc: "WSPutRealNumberAsString", discardable, header: wstphdr.}
proc PutRealNumberAsByteString*(mlp: WSLINK; s: ptr cuchar): cint {.
    importc: "WSPutRealNumberAsByteString", discardable, header: wstphdr.}
proc PutRealNumberAsUCS2String*(mlp: WSLINK; s: ptr cushort): cint {.
    importc: "WSPutRealNumberAsUCS2String", discardable, header: wstphdr.}
proc PutRealNumberAsUTF8String*(mlp: WSLINK; s: ptr cuchar; nbytes: cint): cint {.
    importc: "WSPutRealNumberAsUTF8String", discardable, header: wstphdr.}
proc PutRealNumberAsUTF16String*(mlp: WSLINK; s: ptr cushort; ncodes: cint): cint {.
    importc: "WSPutRealNumberAsUTF16String", discardable, header: wstphdr.}
proc PutRealNumberAsUTF32String*(mlp: WSLINK; s: ptr cuint; nchars: cint): cint {.
    importc: "WSPutRealNumberAsUTF32String", discardable, header: wstphdr.}
proc PutSize*(mlp: WSLINK; size: cint): cint {.importc: "WSPutSize", discardable, header: wstphdr.}
proc PutData*(mlp: WSLINK; buff: cstring; len: cint): cint {.importc: "WSPutData", discardable, header: wstphdr.}
proc PutByteSymbol*(mlp: WSLINK; s: ptr cuchar; len: clong): cint {.
    importc: "WSPutByteSymbol", discardable, header: wstphdr.}
proc PutSymbol*(mlp: WSLINK; s: cstring): cint {.importc: "WSPutSymbol", discardable, header: wstphdr.}
proc PutUCS2Symbol*(mlp: WSLINK; s: ptr cushort; len: cint): cint {.
    importc: "WSPutUCS2Symbol", discardable, header: wstphdr.}
proc PutUTF8Symbol*(mlp: WSLINK; s: ptr cuchar; len: cint): cint {.
    importc: "WSPutUTF8Symbol", discardable, header: wstphdr.}
proc PutUTF16Symbol*(mlp: WSLINK; s: ptr cushort; len: cint): cint {.
    importc: "WSPutUTF16Symbol", discardable, header: wstphdr.}
proc PutUTF32Symbol*(mlp: WSLINK; s: ptr cuint; len: cint): cint {.
    importc: "WSPutUTF32Symbol", discardable, header: wstphdr.}
proc PutFunction*(mlp: WSLINK; s: cstring; argc: cint): cint {.
    importc: "WSPutFunction", discardable, header: wstphdr.}
proc PutUCS2Function*(mlp: WSLINK; s: ptr cushort; length: cint; argn: cint): cint {.
    importc: "WSPutUCS2Function", discardable, header: wstphdr.}
proc PutUTF8Function*(mlp: WSLINK; s: ptr cuchar; length: cint; argn: cint): cint {.
    importc: "WSPutUTF8Function", discardable, header: wstphdr.}
proc PutUTF16Function*(mlp: WSLINK; s: ptr cushort; length: cint; argn: cint): cint {.
    importc: "WSPutUTF16Function", discardable, header: wstphdr.}
proc PutUTF32Function*(mlp: WSLINK; s: ptr cuint; length: cint; argn: cint): cint {.
    importc: "WSPutUTF32Function", discardable, header: wstphdr.}
type
  WSStringPosition* {.importc: "WSStringPosition", header: wstphdr, bycopy.} = object
    str* {.importc: "str".}: cstring
    `end`* {.importc: "end".}: cstring

  WSStringPositionPointer* = ptr WSStringPosition
  WSOldStringPosition* {.importc: "WSOldStringPosition", header: wstphdr, bycopy.} = object
    cc* {.importc: "cc".}: ptr cuchar
    mode* {.importc: "mode".}: cint
    more* {.importc: "more".}: cint
    head* {.importc: "head".}: ptr cuchar

  WSOldStringPositionPointer* = ptr WSOldStringPosition

proc CharacterOffset*(startp: cstringArray; `end`: cstring; n: clong): clong {.
    importc: "WSCharacterOffset", discardable, header: wstphdr.}
proc StringCharacter*(start: cstring; `end`: cstring): clong {.
    importc: "WSStringCharacter", discardable, header: wstphdr.}
proc NextCharacter*(startp: cstringArray; `end`: cstring): clong {.
    importc: "WSNextCharacter", discardable, header: wstphdr.}
proc NextCharacterFromStringWithLength*(str: cstring; indexp: ptr clong; len: clong): clong {.
    importc: "WSNextCharacterFromStringWithLength", discardable, header: wstphdr.}
proc ConvertNewLine*(sp: cstringArray): clong {.importc: "WSConvertNewLine", discardable, header: wstphdr.}
proc ConvertCharacter*(ch: culong; sp: cstringArray): clong {.
    importc: "WSConvertCharacter", discardable, header: wstphdr.}
proc ConvertByteString*(codes: ptr cuchar; len: clong; strp: cstringArray;
                         str_end: cstring): clong {.importc: "WSConvertByteString", discardable, header: wstphdr.}
proc ConvertByteStringNL*(codes: ptr cuchar; len: clong; strp: cstringArray;
                           str_end: cstring; nl: culong): clong {.
    importc: "WSConvertByteStringNL", discardable, header: wstphdr.}
proc ConvertDoubleByteString*(codes: ptr cuchar; len: clong; strp: cstringArray;
                               str_end: cstring): clong {.
    importc: "WSConvertDoubleByteString", discardable, header: wstphdr.}
proc ConvertDoubleByteStringNL*(codes: ptr cuchar; len: clong; strp: cstringArray;
                                 str_end: cstring; nl: culong): clong {.
    importc: "WSConvertDoubleByteStringNL", discardable, header: wstphdr.}
proc ConvertUCS2String*(codes: ptr cushort; len: clong; strp: cstringArray;
                         str_end: cstring): clong {.importc: "WSConvertUCS2String", discardable, header: wstphdr.}
proc ConvertUCS2StringNL*(codes: ptr cushort; len: clong; strp: cstringArray;
                           str_end: cstring; nl: culong): clong {.
    importc: "WSConvertUCS2StringNL", discardable, header: wstphdr.}
proc ConvertUTF8String*(codes: ptr cuchar; len: clong; strp: cstringArray;
                         str_end: cstring): clong {.importc: "WSConvertUTF8String", discardable, header: wstphdr.}
proc ConvertUTF8StringNL*(codes: ptr cuchar; len: clong; strp: cstringArray;
                           str_end: cstring; nl: culong): clong {.
    importc: "WSConvertUTF8StringNL", discardable, header: wstphdr.}
proc ConvertUTF16String*(codes: ptr cushort; len: clong; strp: cstringArray;
                          str_end: cstring): clong {.
    importc: "WSConvertUTF16String", discardable, header: wstphdr.}
proc ConvertUTF16StringNL*(codes: ptr cushort; len: clong; strp: cstringArray;
                            str_end: cstring; nl: culong): clong {.
    importc: "WSConvertUTF16StringNL", discardable, header: wstphdr.}
proc ConvertUTF32String*(codes: ptr cuint; len: clong; strp: cstringArray;
                          str_end: cstring): clong {.
    importc: "WSConvertUTF32String", discardable, header: wstphdr.}
proc ConvertUTF32StringNL*(codes: ptr cuint; len: clong; strp: cstringArray;
                            str_end: cstring; nl: culong): clong {.
    importc: "WSConvertUTF32StringNL", discardable, header: wstphdr.}
proc StringFirstPosFun*(s: cstring; p: WSStringPositionPointer): cstring {.
    importc: "WSStringFirstPosFun", discardable, header: wstphdr.}
proc OldPutCharToString*(ch: cuint; sp: cstringArray): cint {.
    importc: "WSOldPutCharToString", discardable, header: wstphdr.}
proc OldStringNextPosFun*(p: WSOldStringPositionPointer): ptr cuchar {.
    importc: "WSOldStringNextPosFun", discardable, header: wstphdr.}
proc OldStringFirstPosFun*(s: cstring; p: WSOldStringPositionPointer): ptr cuchar {.
    importc: "WSOldStringFirstPosFun", discardable, header: wstphdr.}
proc OldStringCharFun*(p: WSOldStringPositionPointer): cuint {.
    importc: "WSOldStringCharFun", discardable, header: wstphdr.}
proc OldConvertByteString*(codes: ptr cuchar; len: clong; strp: cstringArray;
                            str_end: cstring): clong {.
    importc: "WSOldConvertByteString", discardable, header: wstphdr.}
proc OldConvertUCS2String*(codes: ptr cushort; len: clong; strp: cstringArray;
                            str_end: cstring): clong {.
    importc: "WSOldConvertUCS2String", discardable, header: wstphdr.}
proc CharOffset*(startp: cstringArray; `end`: cstring; n: clong; more: cint): clong {.
    importc: "WSCharOffset", discardable, header: wstphdr.}
proc NextChar*(startp: cstringArray; `end`: cstring; more: cint; useSurrogates: cint;
                wasSurrogatePair: ptr cint): clong {.importc: "WSNextChar", discardable, header: wstphdr.}
type
  array_meterp* = pointer
  array_meterpp* = ptr array_meterp

proc PutArray*(mlp: WSLINK; meterp: array_meterp): cint {.importc: "WSPutArray", discardable, header: wstphdr.}
proc PutBinaryNumberArrayData*(mlp: WSLINK; meterp: array_meterp; datap: pointer;
                                count: clong; `type`: clong): cint {.
    importc: "WSPutBinaryNumberArrayData", discardable, header: wstphdr.}
proc PutByteArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cuchar;
                        count: clong): cint {.importc: "WSPutByteArrayData", discardable, header: wstphdr.}
proc PutShortIntegerArrayData*(mlp: WSLINK; meterp: array_meterp;
                                datap: ptr cshort; count: clong): cint {.
    importc: "WSPutShortIntegerArrayData", discardable, header: wstphdr.}
proc PutIntegerArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cint;
                           count: clong): cint {.importc: "WSPutIntegerArrayData", discardable, header: wstphdr.}
proc PutLongIntegerArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr clong;
                               count: clong): cint {.
    importc: "WSPutLongIntegerArrayData", discardable, header: wstphdr.}
proc PutInteger8ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cuchar;
                            count: cint): cint {.importc: "WSPutInteger8ArrayData", discardable, header: wstphdr.}
proc PutInteger16ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cshort;
                             count: cint): cint {.
    importc: "WSPutInteger16ArrayData", discardable, header: wstphdr.}
proc PutInteger32ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cint;
                             count: cint): cint {.
    importc: "WSPutInteger32ArrayData", discardable, header: wstphdr.}
proc PutInteger64ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr wsint64;
                             count: cint): cint {.
    importc: "WSPutInteger64ArrayData", discardable, header: wstphdr.}
proc PutFloatArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cfloat;
                         count: clong): cint {.importc: "WSPutFloatArrayData", discardable, header: wstphdr.}
proc PutDoubleArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cdouble;
                          count: clong): cint {.importc: "WSPutDoubleArrayData", discardable, header: wstphdr.}
proc PutLongDoubleArrayData*(mlp: WSLINK; meterp: array_meterp;
                              datap: ptr wsextended_double; count: clong): cint {.
    importc: "WSPutLongDoubleArrayData", discardable, header: wstphdr.}
proc PutReal32ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cfloat;
                          count: cint): cint {.importc: "WSPutReal32ArrayData", discardable, header: wstphdr.}
proc PutReal64ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cdouble;
                          count: cint): cint {.importc: "WSPutReal64ArrayData", discardable, header: wstphdr.}
proc PutReal128ArrayData*(mlp: WSLINK; meterp: array_meterp;
                           datap: ptr wsextended_double; count: cint): cint {.
    importc: "WSPutReal128ArrayData", discardable, header: wstphdr.}
proc PutBinaryNumberArray*(mlp: WSLINK; data: pointer; dimp: ptr clong;
                            heads: cstringArray; depth: clong; `type`: clong): cint {.
    importc: "WSPutBinaryNumberArray", discardable, header: wstphdr.}
proc PutByteArray*(mlp: WSLINK; data: ptr cuchar; dims: ptr cint; heads: cstringArray;
                    depth: cint): cint {.importc: "WSPutByteArray", discardable, header: wstphdr.}
proc PutShortIntegerArray*(mlp: WSLINK; data: ptr cshort; dims: ptr clong;
                            heads: cstringArray; depth: clong): cint {.
    importc: "WSPutShortIntegerArray", discardable, header: wstphdr.}
proc PutIntegerArray*(mlp: WSLINK; data: ptr cint; dims: ptr clong;
                       heads: cstringArray; depth: clong): cint {.
    importc: "WSPutIntegerArray", discardable, header: wstphdr.}
proc PutLongIntegerArray*(mlp: WSLINK; data: ptr clong; dims: ptr clong;
                           heads: cstringArray; depth: clong): cint {.
    importc: "WSPutLongIntegerArray", discardable, header: wstphdr.}
proc PutInteger8Array*(mlp: WSLINK; data: ptr cuchar; dims: ptr cint;
                        heads: cstringArray; depth: cint): cint {.
    importc: "WSPutInteger8Array", discardable, header: wstphdr.}
proc PutInteger16Array*(mlp: WSLINK; data: ptr cshort; dims: ptr cint;
                         heads: cstringArray; depth: cint): cint {.
    importc: "WSPutInteger16Array", discardable, header: wstphdr.}
proc PutInteger32Array*(mlp: WSLINK; data: ptr cint; dims: ptr cint;
                         heads: cstringArray; depth: cint): cint {.
    importc: "WSPutInteger32Array", discardable, header: wstphdr.}
proc PutInteger64Array*(mlp: WSLINK; data: ptr wsint64; dims: ptr cint;
                         heads: cstringArray; depth: cint): cint {.
    importc: "WSPutInteger64Array", discardable, header: wstphdr.}
proc PutFloatArray*(mlp: WSLINK; data: ptr cfloat; dims: ptr clong;
                     heads: cstringArray; depth: clong): cint {.
    importc: "WSPutFloatArray", discardable, header: wstphdr.}
proc PutDoubleArray*(mlp: WSLINK; data: ptr cdouble; dims: ptr clong;
                      heads: cstringArray; depth: clong): cint {.
    importc: "WSPutDoubleArray", discardable, header: wstphdr.}
proc PutRealArray*(mlp: WSLINK; data: ptr cdouble; dims: ptr clong;
                    heads: cstringArray; depth: clong): cint {.
    importc: "WSPutRealArray", discardable, header: wstphdr.}
proc PutLongDoubleArray*(mlp: WSLINK; data: ptr wsextended_double; dims: ptr clong;
                          heads: cstringArray; depth: clong): cint {.
    importc: "WSPutLongDoubleArray", discardable, header: wstphdr.}
proc PutReal32Array*(mlp: WSLINK; data: ptr cfloat; dims: ptr cint;
                      heads: cstringArray; depth: cint): cint {.
    importc: "WSPutReal32Array", discardable, header: wstphdr.}
proc PutReal64Array*(mlp: WSLINK; data: ptr cdouble; dims: ptr cint;
                      heads: cstringArray; depth: cint): cint {.
    importc: "WSPutReal64Array", discardable, header: wstphdr.}
proc PutReal128Array*(mlp: WSLINK; data: ptr wsextended_double; dims: ptr cint;
                       heads: cstringArray; depth: cint): cint {.
    importc: "WSPutReal128Array", discardable, header: wstphdr.}
proc PutBinaryNumberList*(mlp: WSLINK; data: pointer; count: clong; `type`: clong): cint {.
    importc: "WSPutBinaryNumberList", discardable, header: wstphdr.}
proc PutIntegerList*(mlp: WSLINK; data: ptr cint; count: clong): cint {.
    importc: "WSPutIntegerList", discardable, header: wstphdr.}
proc PutRealList*(mlp: WSLINK; data: ptr cdouble; count: clong): cint {.
    importc: "WSPutRealList", discardable, header: wstphdr.}
proc PutInteger8List*(mlp: WSLINK; data: ptr cuchar; count: cint): cint {.
    importc: "WSPutInteger8List", discardable, header: wstphdr.}
proc PutInteger16List*(mlp: WSLINK; data: ptr cshort; count: cint): cint {.
    importc: "WSPutInteger16List", discardable, header: wstphdr.}
proc PutInteger32List*(mlp: WSLINK; data: ptr cint; count: cint): cint {.
    importc: "WSPutInteger32List", discardable, header: wstphdr.}
proc PutInteger64List*(mlp: WSLINK; data: ptr wsint64; count: cint): cint {.
    importc: "WSPutInteger64List", discardable, header: wstphdr.}
proc PutReal32List*(mlp: WSLINK; data: ptr cfloat; count: cint): cint {.
    importc: "WSPutReal32List", discardable, header: wstphdr.}
proc PutReal64List*(mlp: WSLINK; data: ptr cdouble; count: cint): cint {.
    importc: "WSPutReal64List", discardable, header: wstphdr.}
proc PutReal128List*(mlp: WSLINK; data: ptr wsextended_double; count: cint): cint {.
    importc: "WSPutReal128List", discardable, header: wstphdr.}
proc PutArrayType*(mlp: WSLINK; heads: WSLINK; depth: clong; meterpp: array_meterpp): cint {.
    importc: "WSPutArrayType", discardable, header: wstphdr.}
proc ReleasePutArrayState*(mlp: WSLINK; heads: WSLINK; meterp: array_meterp): cint {.
    importc: "WSReleasePutArrayState", discardable, header: wstphdr.}
proc PutArrayLeaves*(mlp: WSLINK; heads: WSLINK; meterp: array_meterp;
                      leaves: WSLINK; count: clong): cint {.
    importc: "WSPutArrayLeaves", discardable, header: wstphdr.}
proc PutBinaryNumberArrayDataWithHeads*(mlp: WSLINK; heads: WSLINK;
    meterp: array_meterp; datap: pointer; count: clong; `type`: clong): cint {.
    importc: "WSPutBinaryNumberArrayDataWithHeads", discardable, header: wstphdr.}
proc GetArrayDimensions*(mlp: WSLINK; meterp: array_meterp): cint {.
    importc: "WSGetArrayDimensions", discardable, header: wstphdr.}
proc GetArrayType*(mlp: WSLINK; meterp: array_meterp): cint {.
    importc: "WSGetArrayType", discardable, header: wstphdr.}
proc GetBinaryNumberList*(mlp: WSLINK; datap: ptr pointer; countp: ptr clong;
                           `type`: clong): cint {.importc: "WSGetBinaryNumberList", discardable, header: wstphdr.}
proc GetIntegerList*(mlp: WSLINK; datap: ptr ptr cint; countp: ptr clong): cint {.
    importc: "WSGetIntegerList", discardable, header: wstphdr.}
proc GetRealList*(mlp: WSLINK; datap: ptr ptr cdouble; countp: ptr clong): cint {.
    importc: "WSGetRealList", discardable, header: wstphdr.}
proc GetInteger16List*(mlp: WSLINK; datap: ptr ptr cshort; countp: ptr cint): cint {.
    importc: "WSGetInteger16List", discardable, header: wstphdr.}
proc GetInteger32List*(mlp: WSLINK; datap: ptr ptr cint; countp: ptr cint): cint {.
    importc: "WSGetInteger32List", discardable, header: wstphdr.}
proc GetInteger64List*(mlp: WSLINK; datap: ptr ptr wsint64; countp: ptr cint): cint {.
    importc: "WSGetInteger64List", discardable, header: wstphdr.}
proc GetReal32List*(mlp: WSLINK; datap: ptr ptr cfloat; countp: ptr cint): cint {.
    importc: "WSGetReal32List", discardable, header: wstphdr.}
proc GetReal64List*(mlp: WSLINK; datap: ptr ptr cdouble; countp: ptr cint): cint {.
    importc: "WSGetReal64List", discardable, header: wstphdr.}
proc GetReal128List*(mlp: WSLINK; datap: ptr ptr wsextended_double; countp: ptr cint): cint {.
    importc: "WSGetReal128List", discardable, header: wstphdr.}
proc ReleaseIntegerList*(mlp: WSLINK; data: ptr cint; count: clong) {.
    importc: "WSReleaseIntegerList", discardable, header: wstphdr.}
proc ReleaseRealList*(mlp: WSLINK; data: ptr cdouble; count: clong) {.
    importc: "WSReleaseRealList", discardable, header: wstphdr.}
proc ReleaseBinaryNumberList*(mlp: WSLINK; data: pointer; count: cint; `type`: clong) {.
    importc: "WSReleaseBinaryNumberList", discardable, header: wstphdr.}
proc ReleaseInteger16List*(mlp: WSLINK; data: ptr cshort; count: cint) {.
    importc: "WSReleaseInteger16List", discardable, header: wstphdr.}
proc ReleaseInteger32List*(mlp: WSLINK; data: ptr cint; count: cint) {.
    importc: "WSReleaseInteger32List", discardable, header: wstphdr.}
proc ReleaseInteger64List*(mlp: WSLINK; data: ptr wsint64; count: cint) {.
    importc: "WSReleaseInteger64List", discardable, header: wstphdr.}
proc ReleaseReal32List*(mlp: WSLINK; data: ptr cfloat; count: cint) {.
    importc: "WSReleaseReal32List", discardable, header: wstphdr.}
proc ReleaseReal64List*(mlp: WSLINK; data: ptr cdouble; count: cint) {.
    importc: "WSReleaseReal64List", discardable, header: wstphdr.}
proc ReleaseReal128List*(mlp: WSLINK; data: ptr wsextended_double; count: cint) {.
    importc: "WSReleaseReal128List", discardable, header: wstphdr.}
proc GetBinaryNumberArrayData*(mlp: WSLINK; meterp: array_meterp; datap: pointer;
                                count: clong; `type`: clong): cint {.
    importc: "WSGetBinaryNumberArrayData", discardable, header: wstphdr.}
proc GetByteArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cuchar;
                        count: clong): cint {.importc: "WSGetByteArrayData", discardable, header: wstphdr.}
proc GetShortIntegerArrayData*(mlp: WSLINK; meterp: array_meterp;
                                datap: ptr cshort; count: clong): cint {.
    importc: "WSGetShortIntegerArrayData", discardable, header: wstphdr.}
proc GetIntegerArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cint;
                           count: clong): cint {.importc: "WSGetIntegerArrayData", discardable, header: wstphdr.}
proc GetLongIntegerArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr clong;
                               count: clong): cint {.
    importc: "WSGetLongIntegerArrayData", discardable, header: wstphdr.}
proc GetInteger16ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cshort;
                             count: cint): cint {.
    importc: "WSGetInteger16ArrayData", discardable, header: wstphdr.}
proc GetInteger32ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cint;
                             count: cint): cint {.
    importc: "WSGetInteger32ArrayData", discardable, header: wstphdr.}
proc GetInteger64ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr wsint64;
                             count: cint): cint {.
    importc: "WSGetInteger64ArrayData", discardable, header: wstphdr.}
proc GetFloatArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cfloat;
                         count: clong): cint {.importc: "WSGetFloatArrayData", discardable, header: wstphdr.}
proc GetDoubleArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cdouble;
                          count: clong): cint {.importc: "WSGetDoubleArrayData", discardable, header: wstphdr.}
proc GetLongDoubleArrayData*(mlp: WSLINK; meterp: array_meterp;
                              datap: ptr wsextended_double; count: clong): cint {.
    importc: "WSGetLongDoubleArrayData", discardable, header: wstphdr.}
proc GetReal32ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cfloat;
                          count: cint): cint {.importc: "WSGetReal32ArrayData", discardable, header: wstphdr.}
proc GetReal64ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cdouble;
                          count: cint): cint {.importc: "WSGetReal64ArrayData", discardable, header: wstphdr.}
proc GetReal128ArrayData*(mlp: WSLINK; meterp: array_meterp;
                           datap: ptr wsextended_double; count: cint): cint {.
    importc: "WSGetReal128ArrayData", discardable, header: wstphdr.}
proc GetInteger8List*(mlp: WSLINK; datap: ptr ptr cuchar; countp: ptr cint): cint {.
    importc: "WSGetInteger8List", discardable, header: wstphdr.}
proc GetInteger8ArrayData*(mlp: WSLINK; meterp: array_meterp; datap: ptr cuchar;
                            count: cint): cint {.importc: "WSGetInteger8ArrayData", discardable, header: wstphdr.}
proc ReleaseInteger8List*(mlp: WSLINK; data: ptr cuchar; count: cint) {.
    importc: "WSReleaseInteger8List", discardable, header: wstphdr.}
proc GetArrayTypeWithDepthAndLeafType*(mlp: WSLINK; heads: WSLINK;
                                        meterpp: array_meterpp; depthp: ptr clong;
                                        leaf_tokp: ptr mlapi_token): cint {.
    importc: "WSGetArrayTypeWithDepthAndLeafType", discardable, header: wstphdr.}
proc GetBinaryNumberArrayDataWithHeads*(mlp: WSLINK; heads: WSLINK;
    meterp: array_meterp; datap: pointer; countp: ptr clong; `type`: clong): cint {.
    importc: "WSGetBinaryNumberArrayDataWithHeads", discardable, header: wstphdr.}
proc ReleaseGetArrayState*(mlp: WSLINK; heads: WSLINK; meterp: array_meterp) {.
    importc: "WSReleaseGetArrayState", discardable, header: wstphdr.}
proc GetBinaryNumberArrayWithLeafType*(mlp: WSLINK; datap: ptr pointer;
                                        dimpp: ptr ptr clong;
                                        headsp: ptr cstringArray;
                                        depthp: ptr clong; `type`: clong;
                                        leaf_tokp: ptr mlapi_token): cint {.
    importc: "WSGetBinaryNumberArrayWithLeafType", discardable, header: wstphdr.}
proc GetBinaryNumberArray*(mlp: WSLINK; datap: ptr pointer; dimpp: ptr ptr clong;
                            headsp: ptr cstringArray; depthp: ptr clong; `type`: clong): cint {.
    importc: "WSGetBinaryNumberArray", discardable, header: wstphdr.}
proc GetByteArray*(mlp: WSLINK; datap: ptr ptr cuchar; dimsp: ptr ptr cint;
                    headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetByteArray", discardable, header: wstphdr.}
proc GetShortIntegerArray*(mlp: WSLINK; datap: ptr ptr cshort; dimsp: ptr ptr clong;
                            headsp: ptr cstringArray; depthp: ptr clong): cint {.
    importc: "WSGetShortIntegerArray", discardable, header: wstphdr.}
proc GetIntegerArray*(mlp: WSLINK; datap: ptr ptr cint; dimsp: ptr ptr clong;
                       headsp: ptr cstringArray; depthp: ptr clong): cint {.
    importc: "WSGetIntegerArray", discardable, header: wstphdr.}
proc GetLongIntegerArray*(mlp: WSLINK; datap: ptr ptr clong; dimsp: ptr ptr clong;
                           headsp: ptr cstringArray; depthp: ptr clong): cint {.
    importc: "WSGetLongIntegerArray", discardable, header: wstphdr.}
proc GetInteger16Array*(mlp: WSLINK; datap: ptr ptr cshort; dimsp: ptr ptr cint;
                         headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetInteger16Array", discardable, header: wstphdr.}
proc GetInteger32Array*(mlp: WSLINK; datap: ptr ptr cint; dimsp: ptr ptr cint;
                         headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetInteger32Array", discardable, header: wstphdr.}
proc GetInteger64Array*(mlp: WSLINK; datap: ptr ptr wsint64; dimsp: ptr ptr cint;
                         headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetInteger64Array", discardable, header: wstphdr.}
proc GetInteger8Array*(mlp: WSLINK; datap: ptr ptr cuchar; dimsp: ptr ptr cint;
                        headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetInteger8Array", discardable, header: wstphdr.}
proc GetFloatArray*(mlp: WSLINK; datap: ptr ptr cfloat; dimsp: ptr ptr clong;
                     headsp: ptr cstringArray; depthp: ptr clong): cint {.
    importc: "WSGetFloatArray", discardable, header: wstphdr.}
proc GetDoubleArray*(mlp: WSLINK; datap: ptr ptr cdouble; dimsp: ptr ptr clong;
                      headsp: ptr cstringArray; depthp: ptr clong): cint {.
    importc: "WSGetDoubleArray", discardable, header: wstphdr.}
proc GetRealArray*(mlp: WSLINK; datap: ptr ptr cdouble; dimsp: ptr ptr clong;
                    headsp: ptr cstringArray; depthp: ptr clong): cint {.
    importc: "WSGetRealArray", discardable, header: wstphdr.}
proc GetLongDoubleArray*(mlp: WSLINK; datap: ptr ptr wsextended_double;
                          dimsp: ptr ptr clong; headsp: ptr cstringArray;
                          depthp: ptr clong): cint {.
    importc: "WSGetLongDoubleArray", discardable, header: wstphdr.}
proc GetReal32Array*(mlp: WSLINK; datap: ptr ptr cfloat; dimsp: ptr ptr cint;
                      headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetReal32Array", discardable, header: wstphdr.}
proc GetReal64Array*(mlp: WSLINK; datap: ptr ptr cdouble; dimsp: ptr ptr cint;
                      headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetReal64Array", discardable, header: wstphdr.}
proc GetReal128Array*(mlp: WSLINK; datap: ptr ptr wsextended_double;
                       dimsp: ptr ptr cint; headsp: ptr cstringArray; depthp: ptr cint): cint {.
    importc: "WSGetReal128Array", discardable, header: wstphdr.}
proc ReleaseShortIntegerArray*(mlp: WSLINK; data: ptr cshort; dims: ptr clong;
                                heads: cstringArray; depth: clong) {.
    importc: "WSReleaseShortIntegerArray", discardable, header: wstphdr.}
proc ReleaseIntegerArray*(mlp: WSLINK; data: ptr cint; dims: ptr clong;
                           heads: cstringArray; depth: clong) {.
    importc: "WSReleaseIntegerArray", discardable, header: wstphdr.}
proc ReleaseLongIntegerArray*(mlp: WSLINK; data: ptr clong; dims: ptr clong;
                               heads: cstringArray; depth: clong) {.
    importc: "WSReleaseLongIntegerArray", discardable, header: wstphdr.}
proc ReleaseBinaryNumberArray*(mlp: WSLINK; data: pointer; dimp: ptr cint;
                                heads: cstringArray; len: cint; `type`: clong) {.
    importc: "WSReleaseBinaryNumberArray", discardable, header: wstphdr.}
proc ReleaseByteArray*(mlp: WSLINK; data: ptr cuchar; dims: ptr cint;
                        heads: cstringArray; depth: cint) {.
    importc: "WSReleaseByteArray", discardable, header: wstphdr.}
proc ReleaseInteger16Array*(mlp: WSLINK; data: ptr cshort; dims: ptr cint;
                             heads: cstringArray; depth: cint) {.
    importc: "WSReleaseInteger16Array", discardable, header: wstphdr.}
proc ReleaseInteger32Array*(mlp: WSLINK; data: ptr cint; dims: ptr cint;
                             heads: cstringArray; depth: cint) {.
    importc: "WSReleaseInteger32Array", discardable, header: wstphdr.}
proc ReleaseInteger64Array*(mlp: WSLINK; data: ptr wsint64; dims: ptr cint;
                             heads: cstringArray; depth: cint) {.
    importc: "WSReleaseInteger64Array", discardable, header: wstphdr.}
proc ReleaseInteger8Array*(mlp: WSLINK; data: ptr cuchar; dimp: ptr cint;
                            heads: cstringArray; depth: cint) {.
    importc: "WSReleaseInteger8Array", discardable, header: wstphdr.}
proc ReleaseFloatArray*(mlp: WSLINK; data: ptr cfloat; dims: ptr clong;
                         heads: cstringArray; depth: clong) {.
    importc: "WSReleaseFloatArray", discardable, header: wstphdr.}
proc ReleaseDoubleArray*(mlp: WSLINK; data: ptr cdouble; dims: ptr clong;
                          heads: cstringArray; depth: clong) {.
    importc: "WSReleaseDoubleArray", discardable, header: wstphdr.}
proc ReleaseRealArray*(mlp: WSLINK; data: ptr cdouble; dims: ptr clong;
                        heads: cstringArray; depth: clong) {.
    importc: "WSReleaseRealArray", discardable, header: wstphdr.}
proc ReleaseReal32Array*(mlp: WSLINK; data: ptr cfloat; dims: ptr cint;
                          heads: cstringArray; depth: cint) {.
    importc: "WSReleaseReal32Array", discardable, header: wstphdr.}
proc ReleaseReal64Array*(mlp: WSLINK; data: ptr cdouble; dims: ptr cint;
                          heads: cstringArray; depth: cint) {.
    importc: "WSReleaseReal64Array", discardable, header: wstphdr.}
proc ReleaseReal128Array*(mlp: WSLINK; data: ptr wsextended_double; dims: ptr cint;
                           heads: cstringArray; depth: cint) {.
    importc: "WSReleaseReal128Array", discardable, header: wstphdr.}
proc ReleaseLongDoubleArray*(mlp: WSLINK; data: ptr wsextended_double;
                              dims: ptr clong; heads: cstringArray; depth: clong) {.
    importc: "WSReleaseLongDoubleArray", discardable, header: wstphdr.}
type
  WSUnicodeContainerType* {.size: sizeof(cint).} = enum
    UCS2ContainerType, UTF8ContainerType, UTF16ContainerType, UTF32ContainerType


type
  pointer_1151741994* {.importc: "no_name", header: wstphdr, bycopy.} = object {.union.}
    ucs2* {.importc: "ucs2".}: ptr cushort
    utf8* {.importc: "utf8".}: ptr cuchar
    utf16* {.importc: "utf16".}: ptr cushort
    utf32* {.importc: "utf32".}: ptr cuint

  WSUnicodeContainer* {.importc: "WSUnicodeContainer", header: wstphdr, bycopy.} = object
    pointer* {.importc: "pointer".}: pointer_1151741994
    length* {.importc: "length".}: cint
    `type`* {.importc: "type".}: WSUnicodeContainerType


proc NewUnicodeContainer*(string: pointer; length: cint;
                           `type`: WSUnicodeContainerType): ptr WSUnicodeContainer {.
    importc: "WSNewUnicodeContainer", discardable, header: wstphdr.}
proc ReleaseUnicodeContainer*(string: ptr WSUnicodeContainer) {.
    importc: "WSReleaseUnicodeContainer", discardable, header: wstphdr.}
proc CreateMark*(mlp: WSLINK): MLINKMark {.importc: "WSCreateMark", discardable, header: wstphdr.}
proc SeekToMark*(mlp: WSLINK; mark: MLINKMark; index: cint): MLINKMark {.
    importc: "WSSeekToMark", discardable, header: wstphdr.}
proc SeekMark*(mlp: WSLINK; mark: MLINKMark; index: cint): MLINKMark {.
    importc: "WSSeekMark", discardable, header: wstphdr.}
proc DestroyMark*(mlp: WSLINK; mark: MLINKMark) {.importc: "WSDestroyMark", discardable, header: wstphdr.}
proc TransferExpression*(dmlp: WSLINK; smlp: WSLINK): cint {.
    importc: "WSTransferExpression", discardable, header: wstphdr.}
proc TransferToEndOfLoopbackLink*(dmlp: WSLINK; smlp: WSLINK): cint {.
    importc: "WSTransferToEndOfLoopbackLink", discardable, header: wstphdr.}
proc ForwardReset*(mlp: WSLINK; marker: culong): cint {.importc: "WSForwardReset", discardable, header: wstphdr.}
proc Align*(lmlp: WSLINK; rmlp: WSLINK): cint {.importc: "WSAlign", discardable, header: wstphdr.}
proc NextPacket*(mlp: WSLINK): cint {.importc: "WSNextPacket", discardable, header: wstphdr.}
type
  mldlg_result* = clong
  WSAlertProcPtr* = proc (env: WSEnvironment; message: cstring): mldlg_result
  WSRequestProcPtr* = proc (env: WSEnvironment; prompt: cstring; response: cstring;
                         sizeof_response: clong): mldlg_result
  WSConfirmProcPtr* = proc (env: WSEnvironment; question: cstring;
                         default_answer: mldlg_result): mldlg_result
  WSRequestArgvProcPtr* = proc (env: WSEnvironment; argv: cstringArray;
                             cardof_argv: clong; buf: cstring; sizeof_buf: clong): mldlg_result
  WSRequestToInteractProcPtr* = proc (env: WSEnvironment;
                                   wait_for_permission: mldlg_result): mldlg_result
  WSDialogProcPtr* = proc (env: WSEnvironment): mldlg_result
  MLDialogUPP* = WSDialogProcPtr
  MLAlertUPP* = WSAlertProcPtr
  MLRequestUPP* = WSRequestProcPtr
  MLConfirmUPP* = WSConfirmProcPtr
  MLRequestArgvUPP* = WSRequestArgvProcPtr
  MLRequestToInteractUPP* = WSRequestToInteractProcPtr
  MLAlertFunctionType* = MLAlertUPP
  MLRequestFunctionType* = MLRequestUPP
  MLConfirmFunctionType* = MLConfirmUPP
  MLRequestArgvFunctionType* = MLRequestArgvUPP
  MLRequestToInteractFunctionType* = MLRequestToInteractUPP
  WSDialogFunctionType* = MLDialogUPP

const
  WSAlertFunction* = 1
  WSRequestFunction* = 2
  WSConfirmFunction* = 3
  WSRequestArgvFunction* = 4
  WSRequestToInteractFunction* = 5

proc MLAlert_unix*(env: WSEnvironment; message: cstring): mldlg_result {.
    importc: "MLAlert_unix", discardable, header: wstphdr.}
proc MLRequest_unix*(env: WSEnvironment; prompt: cstring; response: cstring;
                    sizeof_response: clong): mldlg_result {.
    importc: "MLRequest_unix", discardable, header: wstphdr.}
proc MLConfirm_unix*(env: WSEnvironment; question: cstring;
                    default_answer: mldlg_result): mldlg_result {.
    importc: "MLConfirm_unix", discardable, header: wstphdr.}
proc MLPermit_unix*(env: WSEnvironment; wait_for_permission: mldlg_result): mldlg_result {.
    importc: "MLPermit_unix", discardable, header: wstphdr.}
proc default_request_argv*(ep: WSEnvironment; argv: cstringArray; len: clong;
                          buff: cstring; size: clong): mldlg_result {.
    importc: "default_request_argv", discardable, header: wstphdr.}
proc Alert*(env: WSEnvironment; message: cstring): mldlg_result {.
    importc: "WSAlert", discardable, header: wstphdr.}
proc Request*(env: WSEnvironment; prompt: cstring; response: cstring;
               sizeof_response: clong): mldlg_result {.importc: "WSRequest", discardable, header: wstphdr.}
proc Confirm*(env: WSEnvironment; question: cstring; default_answer: mldlg_result): mldlg_result {.
    importc: "WSConfirm", discardable, header: wstphdr.}
proc RequestArgv*(env: WSEnvironment; argv: cstringArray; cardof_argv: clong;
                   buff: cstring; size: clong): mldlg_result {.
    importc: "WSRequestArgv", discardable, header: wstphdr.}
proc RequestToInteract*(env: WSEnvironment; wait_for_permission: mldlg_result): mldlg_result {.
    importc: "WSRequestToInteract", discardable, header: wstphdr.}
proc SetDialogFunction*(env: WSEnvironment; funcnum: clong;
                         `func`: WSDialogFunctionType): cint {.
    importc: "WSSetDialogFunction", discardable, header: wstphdr.}
proc AlertCast*(f: WSAlertProcPtr): WSDialogProcPtr {.importc: "WSAlertCast", discardable, header: wstphdr.}
proc RequestCast*(f: WSRequestProcPtr): WSDialogProcPtr {.
    importc: "WSRequestCast", discardable, header: wstphdr.}
proc ConfirmCast*(f: WSConfirmProcPtr): WSDialogProcPtr {.
    importc: "WSConfirmCast", discardable, header: wstphdr.}
proc RequestArgvCast*(f: WSRequestArgvProcPtr): WSDialogProcPtr {.
    importc: "WSRequestArgvCast", discardable, header: wstphdr.}
proc RequestToInteractCast*(f: WSRequestToInteractProcPtr): WSDialogProcPtr {.
    importc: "WSRequestToInteractCast", discardable, header: wstphdr.}
type
  wstimeval* {.importc: "wstimeval", header: wstphdr, bycopy.} = object
    tv_sec* {.importc: "tv_sec".}: culong
    tv_usec* {.importc: "tv_usec".}: culong


proc Ready*(mlp: WSLINK): cint {.importc: "WSReady", discardable, header: wstphdr.}
type
  MLREADYPARALLELENV* = pointer

proc ReadyParallel*(a2: WSENV; a3: ptr WSLINK; a4: cint; a5: wstimeval): cint {.
    importc: "WSReadyParallel", discardable, header: wstphdr.}
type
  WSLinkWaitCallBackObject* = proc (a2: WSLINK; a3: pointer): cint

proc WaitForLinkActivity*(mlp: WSLINK): cint {.importc: "WSWaitForLinkActivity", discardable, header: wstphdr.}
proc WaitForLinkActivityWithCallback*(mlp: WSLINK;
                                       callback: WSLinkWaitCallBackObject): cint {.
    importc: "WSWaitForLinkActivityWithCallback", discardable, header: wstphdr.}
var stdlink* {.importc: "stdlink", header: wstphdr.}: WSLINK

var stdenv* {.importc: "stdenv", header: wstphdr.}: WSEnvironment

var stdyielder* {.importc: "stdyielder", header: wstphdr.}: WSYieldFunctionObject

var stdhandler* {.importc: "stdhandler", header: wstphdr.}: WSMessageHandlerObject

proc WSMain*(a2: cint; a3: cstringArray): cint {.importc: "WSMain", discardable, header: wstphdr.}
proc MLMainString*(commandline: cstring): cint {.importc: "MLMainString", discardable, header: wstphdr.}
proc MLMainArgv*(argv: cstringArray; argv_end: cstringArray): cint {.
    importc: "MLMainArgv", discardable, header: wstphdr.}
proc MLInstall*(a2: WSLINK): cint {.importc: "MLInstall", discardable, header: wstphdr.}
proc MLAnswer*(a2: WSLINK): wsapi_packet {.importc: "MLAnswer", discardable, header: wstphdr.}
proc MLDoCallPacket*(a2: WSLINK): cint {.importc: "MLDoCallPacket", discardable, header: wstphdr.}
proc MLEvaluate*(a2: WSLINK; a3: cstring): cint {.importc: "MLEvaluate", discardable, header: wstphdr.}
proc MLEvaluateString*(a2: WSLINK; a3: cstring): cint {.importc: "MLEvaluateString", discardable, header: wstphdr.}
proc MLDefaultHandler*(a2: WSLINK; a3: cint; a4: cint) {.importc: "MLDefaultHandler", discardable, header: wstphdr.}
proc MLDefaultYielder*(a2: WSLINK; a3: WSYieldParameters): cint {.
    importc: "MLDefaultYielder", discardable, header: wstphdr.}
var
  MLAbort* {.importc: "MLAbort", header: wstphdr.}: cint
  MLDone* {.importc: "MLDone", header: wstphdr.}: cint

var MLSpecialCharacter* {.importc: "MLSpecialCharacter", header: wstphdr.}: clong
