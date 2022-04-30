#include (rules.inc)
[top]
components : virusproducer

[virusproducer]
type : cell
dim : (30,30)
delay : transport
defaultDelayTime  : 100
border : wrapped
neighbors : (-1,0) (0,0) (1,0) 
neighbors : (-1,-1) (0,-1) (1,-1)
neighbors : (-1,1) (0,1) (1,1)
initialValue : 0
neighborports : virusvers anvirusvers state
stateVariables : virusvers anvirusvers identity timer
stateValues : 0 0 0 0
initialvariablesvalue : virusproducer.stvalues
Localtransition : virusproducing

[virusproducing]

%counting
rule : { ~virusvers := $virusvers + 0 ; ~state := $timer ;} { $timer := $timer + uniform(2, 7) ;} 100 { $identity = 100 and $timer < 60 and #Macro(anvirusspreading) < $virusvers  }
%producing
rule : { ~virusvers := $virusvers ;} { $timer := 0 ; $virusvers := $virusvers + 2 ;} 100 { $identity = 100 and $timer > 60 and #Macro(anvirusspreading) < $virusvers }
%virusspreading
rule : { ~virusvers := #Macro(virusspreading) ; ~state := -1 ; } { $virusvers := #Macro(virusspreading) ; } 100 { #Macro(virusspreading) > $virusvers and #Macro(virusspreading) > $anvirusvers and $identity = 0 and random <  ( #Macro(vPossibility_Of_Spreading) * ( #Macro(vFactor_Outer)/16 + #Macro(vFactor_Inner)/16*3 ) ) }
%anvirusproducing
rule : { ~anvirusvers := #Macro(virusspreading) + 1 ; ~virusvers := 0 ; ~state := 2 ; } { $virusvers := 0 ; $anvirusvers := #Macro(virusspreading) + 1 ; } 100 { ( #Macro(virusspreading) > $anvirusvers or #Macro(anvirusspreading) > $anvirusvers ) and $identity = 200 }
%anvirusspreading
rule : { ~anvirusvers := #Macro(anvirusspreading) ; ~virusvers := 0 ; ~state := 2 ; } { $anvirusvers := #Macro(anvirusspreading) ; $virusvers := 0 ; } 100 { #Macro(anvirusspreading) > $anvirusvers and #Macro(anvirusspreading) > $virusvers and  $identity = 0 and random < ( #Macro(aPossibility_Of_Spreading) ) }

%questioned
rule : { ~state := 1 ; } { $virusvers := 0 ; $anvirusvers := 0 ; } 100 { (0, 0)~state = 2 and $identity = 0 and random < 0.1 }
rule : { ~state := 3 ; } { $identity := 150 ; } 100 { ( #Macro(vFactor_Outer)/2 + #Macro(vFactor_Inner) ) > 2 and (0, 0)~state != -1 and (0, 0)~state != 2 and random < 0.6}
rule : { ~state := 2 ; ~anvirusvers := #Macro(anvirusspreading) ; ~virusvers := 0 ; } { $identity := 0 ; $anvirusvers := #Macro(anvirusspreading) ; } 100 { (0, 0)~state = 3 and random < 0.2 }
rule : { ~state := 1 ; ~anvirusvers := 0 ; ~virusvers := 0 ; } { $identity := 0 ; $anvirusvers := 0 ; } 100 { (0, 0)~state = 3 and random < 0.2 }
rule : { ~state := 9 ; ~virusvers := 0 ; } { $identity := 9 ;} 100 { $identity = 100 and #Macro(anvirusspreading) > $virusvers  }
rule : { 0 } 100 {t}







