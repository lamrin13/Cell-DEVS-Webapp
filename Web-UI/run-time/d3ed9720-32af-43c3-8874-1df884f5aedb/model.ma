[top]
components : 3d-life
[3d-life]
type : cell
dim : (7,7,3)
delay : transport
defaultDelayTime : 100
border : wrapped
neighbors : 3d-life(-1,-1,-1) 3d-life(-1,0,-1) 3d-life(-1,1,-1)
neighbors : 3d-life(0,-1,-1) 3d-life(0,0,-1) 3d-life(0,1,-1)
neighbors : 3d-life(1,-1,-1) 3d-life(1,0,-1) 3d-life(1,1,-1)
neighbors : 3d-life(-1,-1,0) 3d-life(-1,0,0) 3d-life(-1,1,0)
neighbors : 3d-life(0,-1,0) 3d-life(0,0,0) 3d-life(0,1,0)
neighbors : 3d-life(1,-1,0) 3d-life(1,0,0) 3d-life(1,1,0)
neighbors : 3d-life(-1,-1,1) 3d-life(-1,0,1) 3d-life(-1,1,1)
neighbors : 3d-life(0,-1,1) 3d-life(0,0,1) 3d-life(0,1,1)
neighbors : 3d-life(1,-1,1) 3d-life(1,0,1) 3d-life(1,1,1)
initialvalue : 0
initialCellsValue : initial.val
localtransition : 3d-life-rule
[3d-life-rule]
rule : 1 100 { (0,0,0) = 1 and (truecount = 8 or truecount = 10) }
rule : 1 100 { (0,0,0) = 0 and truecount >= 10 }
rule : 0 100 { t }