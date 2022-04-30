[top]
components : decryption

[decryption]
type : cell
width : 10
height : 10
delay : transport
defaultDelayTime : 1000
border : wrapped 
neighbors :             life(-2,0)
neighbors : life(-1,-1) life(-1,0) life(-1,1)
neighbors :             life(0,0)  
initialvalue : 2
initialCellsValue : initial.val

localtransition : decryption-rule


[decryption-rule]
rule : 0 1000 { (-2,0) = 1 and (-1,-1) = 0 and (-1,0) = 0 and (-1,1) = 0 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 1 and (-1,-1) = 0 and (-1,0) = 0 and (-1,1) = 1 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 1 and (-1,-1) = 0 and (-1,0) = 1 and (-1,1) = 0 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 1 and (-1,-1) = 0 and (-1,0) = 1 and (-1,1) = 1 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 1 and (-1,-1) = 1 and (-1,0) = 0 and (-1,1) = 0 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 1 and (-1,-1) = 1 and (-1,0) = 0 and (-1,1) = 1 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 1 and (-1,-1) = 1 and (-1,0) = 1 and (-1,1) = 0 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 1 and (-1,-1) = 1 and (-1,0) = 1 and (-1,1) = 1 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 0 and (-1,-1) = 0 and (-1,0) = 0 and (-1,1) = 0 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 0 and (-1,-1) = 0 and (-1,0) = 0 and (-1,1) = 1 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 0 and (-1,-1) = 0 and (-1,0) = 1 and (-1,1) = 0 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 0 and (-1,-1) = 0 and (-1,0) = 1 and (-1,1) = 1 and (0,0) = 2 }
rule : 0 1000 { (-2,0) = 0 and (-1,-1) = 1 and (-1,0) = 0 and (-1,1) = 0 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 0 and (-1,-1) = 1 and (-1,0) = 0 and (-1,1) = 1 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 0 and (-1,-1) = 1 and (-1,0) = 1 and (-1,1) = 0 and (0,0) = 2 }
rule : 1 1000 { (-2,0) = 0 and (-1,-1) = 1 and (-1,0) = 1 and (-1,1) = 1 and (0,0) = 2 }
rule : 1 1000 { (0,0) = 1 }
rule : 0 1000 { (0,0) = 0 }
rule : 2 1000 { t }