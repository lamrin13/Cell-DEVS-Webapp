
[top]
components : apartment

[apartment]
type : cell

% Each cell is 25cm x 25cm x 25cm = 15.626 Liters of air each
% dim : (88,80)
dim : (44, 40)

delay : transport
defaultDelayTime : 1000
border : nonwrapped

neighbors :           apartment(0,-1)
neighbors : apartment(-1,0)  apartment(0,0)  apartment(1,0) 
neighbors :           apartment(0,1)

%  Background indoor CO2 levels assumed to be 500 ppm
initialvalue : 500
localtransition : rules 

% 3 State Variables corresponding to CO2 concentraion in ppm (conc) and the kind of cell (type)
% Default CO2 concentration inside a building (conc) is 0.05% or 500ppm in normal air
StateVariables: conc type counter
NeighborPorts: c ty co
StateValues: 500 -100 -1
InitialVariablesValue: apartment.stvalues

% STATE VARIABLE LEGEND :
%   conc = double : represents the CO2 concentration (units of ppm) in a given cell, can be any positive numbe, default value is 500ppm
%
%   type = -100 : normal cell representing air with some CO2 concentration
%   type = -200 : CO2 source, constantly emits a specific CO2 output
%   type = -300 : impermeable structure (ie: walls, chairs, tables, solid objects)
%   type = -400 : doors, fixed at normal indoor background co2 level (500 ppm)
%   type = -500 : window, fixed at lower co2 levels found outside (400 ppm)
%   type = -600 : ventillation, actively removing CO2 (300 ppm)
%   type = -700 : WindowLocation (500 ppm)

[rules]
% CO2 sources have their concentration continually increased by 12.16 ppm every 5 seconds. Normal diffusion rule applies.
rule : { ~c := $conc; ~ty := $type; ~co := $counter;} { $conc := ((121.6*2) + (((-1,0)~c + (0,-1)~c + (0,0)~c + (0,1)~c + (1,0)~c)/5)); $counter := $counter+1; } 5000 { $type = -200 AND $counter != 5 }


% CO2 sources movement
rule : { ~c := $conc; ~ty := $type; ~co := $counter; } { $type:= -200; $counter:= $counter+1; } 1000 { $type = -100 AND (-1,0)~co = 5 }
rule : { ~c := $conc; ~ty := $type; ~co := $counter;} { $type:= -100; $conc := ((121.6*2) + (((-1,0)~c + (0,-1)~c + (0,0)~c + (0,1)~c + (1,0)~c)/5)); $counter:= $counter+1;} 5000 { $type = -200 AND $counter = 5 }



% Default rule: keep concentration the same if all other rules untrue (should never happen)
rule : { ~c := $conc; ~ty := $type; } { $counter := $counter +1; } 1000 { t }

