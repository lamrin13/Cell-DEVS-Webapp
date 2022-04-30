[top]
components : monsoon

[monsoon]
type : cell
width : 20
height : 20
delay : transport
defaultDelayTime : 100000
border : nowrapped
neighbors : monsoon(-1,0) monsoon(1,0)
neighbors : monsoon(0,-1) monsoon(0,0) monsoon(0,1) 
initialvalue : 0

localtransition : monsoon-rule
statevariables: value
statevalues: 0
initialvariablesvalue: monsoon.stvalues


[monsoon-rule]
rule : { $value } { $value := 15; } 100000 { $value =15 }
rule : { $value } { $value := 1; } 100000 { $value =1 }
rule : { $value } { $value := 2; } 100000 { $value =10 and normal(0.4,0.3)>0.15 }
rule : { $value } { $value := 2; } 300000 { $value =9 and normal(0.4,0.3)>0.15 }
rule : { $value } { $value := 2; } 500000 { $value =8 and normal(0.4,0.3)>0.15 }
rule : { $value } { $value := 2; } 600000 { $value =7 and normal(0.4,0.3)>0.15 }

