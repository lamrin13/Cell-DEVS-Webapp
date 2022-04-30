[top]
components : cropphases

[cropphases]
type : cell
width : 20
height : 20
delay : transport
defaultDelayTime : 100000
border : nowrapped
neighbors : cropphases(-1,0) cropphases(1,0)
neighbors : cropphases(0,-1) cropphases(0,0) cropphases(0,1) 
initialvalue : 0

localtransition : cropphases-rule
statevariables: value
statevalues: 0
initialvariablesvalue: cropphases.stvalues


[cropphases-rule]
rule : { $value } { $value := 2; } 100000 { $value =0 and normal(0.4,0.3)>0.1 }
rule : { $value } { $value := 3; } 300000 { $value =2 }
rule : { $value } { $value := 4; } 500000 { $value =3 }
rule : { $value } { $value := 5; } 700000 { $value =4 }
rule : { $value } { $value := 1; } 100000 { $value =1 }
rule : { $value } { $value := 11; } 100000 { $value =11 }