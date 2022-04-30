[top]
components : indiamapandsowing

[indiamapandsowing]
type : cell
width : 20
height : 20
delay : transport
defaultDelayTime : 100000
border : nowrapped
neighbors : indiamapandsowing(-1,0) indiamapandsowing(1,0)
neighbors : indiamapandsowing(0,-1) indiamapandsowing(0,0) indiamapandsowing(0,1) 
initialvalue : 0

localtransition : indiamapandsowing-rule
statevariables: value
statevalues: 0
initialvariablesvalue: indiamapandsowing.stvalues


[indiamapandsowing-rule]
rule : { $value } { $value := 2; } 100000 { $value =2}
rule : { $value } { $value := 1; } 100000 { $value =1}
rule : { $value } { $value := 11; } 100000 { $value =11}
rule : { $value } { $value := 2; } 200000 { $value =0 and normal(0.4,0.3)>0.1 }