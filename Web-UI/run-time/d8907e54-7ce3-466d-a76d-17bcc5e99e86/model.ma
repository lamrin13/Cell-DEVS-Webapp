#include(hfmacro.inc)
[top]
components : startum

[startum]
type : cell
dim : (15,15,15)
delay : transport
defaultDelayTime : 100
border : nowrapped
neighbors : startum(-1,-1,-1) startum(-1,0,-1) startum(-1,1,-1)
neighbors : startum(0,-1,-1)  startum(0,0,-1)  startum(0,1,-1)
neighbors : startum(1,-1,-1)  startum(1,0,-1)  startum(1,1,-1)
neighbors : startum(-1,-1,0) startum(-1,0,0) startum(-1,1,0)
neighbors : startum(0,-1,0)  startum(0,0,0)  startum(0,1,0)
neighbors : startum(1,-1,0)  startum(1,0,0)  startum(1,1,0)
neighbors : startum(-1,-1,1) startum(-1,0,1) startum(-1,1,1)
neighbors : startum(0,-1,1)  startum(0,0,1)  startum(0,1,1)
neighbors : startum(1,-1,1)  startum(1,0,1)  startum(1,1,1)
initialvalue : 0
InitialVariablesValue : hf.stvalues
localtransition : hfrule
StateVariables : cstate compress cpress
stateValues : 0 0 0
neighborports : press cstateport compressport
 

[hfrule]
rule : { ~press := $cpress; ~compressport := $compress; } { $compress := $compress + #macro(compressrock); $cpress := 0;} 100 {t}
