#include(rules.inc)

[top]
components : ForestFire

[ForestFire]
type : cell
dim : (6,6)
delay : transport
defaultDelayTime : 1000
border : nowrapped
neighbors : ForestFire(-1,0) ForestFire(0,-1) ForestFire(1,0) 
neighbors : ForestFire(0,1)  ForestFire(0,0)
initialValue : 300.0
initialCellsValue : initial.val
stateVariables: ti 
stateValues: 1
initialVariablesValue: var.stvalues
zone : cst { (0,0)..(0,5) }  
zone : cst { (1,0)..(4,0) }
zone : cst { (1,5)..(4,5) } 
zone : cst { (5,0)..(5,5) }
localTransition : FireBehavior

[cst]
%Undefined border cells
rule : { (0,0) } 1 { undefCount >= 1 }
rule : { (0,0) } 1 { t }

[FireBehavior]
%Unburned
rule : { #macro(unburned) } 1 { ( #macro(unburned) > (0,0) OR time <= 20 ) AND (0,0) < 573 AND (0,0) != 209 }

%Burning and ti
rule : { #macro(burning) }                        1 { (0,0) > #macro(burning)  AND (0,0) >  333 AND ( (0,0) < 573 OR $ti != 1.0 ) }
rule : { #macro(burning) }                        1 { #macro(burning) >= (0,0) AND (0,0) >= 573 AND $ti != 1.0 }
rule : { #macro(burning) } { $ti := time / 100; } 1 { #macro(burning) >= (0,0) AND (0,0) >= 573 AND $ti = 1.0 }
rule : { #macro(burning) } { $ti := time / 100; } 1 { #macro(burning) <  (0,0) AND (0,0) >= 573 AND $ti = 1.0 }


%Burned
rule : { 209 } 100 { (0,0) > #macro(burning) AND (0,0) <= 333 AND (0,0) != 209 }

%Stay Burned or constant
rule : { (0,0) } 1 { t }
