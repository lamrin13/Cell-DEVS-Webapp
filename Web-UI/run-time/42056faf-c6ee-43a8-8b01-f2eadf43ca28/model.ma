[top]
components : co2

[co2]
type : cell
% Each cell is 25cm x 25cm x 25cm = 15.626 Liters of air each
dim : (17,28)
delay : transport
defaultDelayTime  : 1000 
border : nonwrapped

% 2D Von Neumann Neighbourhood
neighbors :             co2(-1,0) 
neighbors : co2(0,-1)   co2(0,0)   co2(0,1)		
neighbors :             co2(1,0)  
% Background indoor CO2 levels assumed to be 500 ppm
initialvalue : 500
localtransition : co2-rules 

% 2 State Variables corresponding to CO2 concentraion in ppm (conc) and the kind of cell (type)
% Default CO2 concentration inside a building (conc) is 0.05% or 500ppm in normal air
StateVariables: conc type
StateValues: 500 0
InitialVariablesValue: vsim.stvalues

[co2-rules]
% STATE VARIABLE LEGEND :
%   conc = double : represents the CO2 concentration (units of ppm) in a given cell, can be any positive numbe, default value is 500ppm
%
%   type = 0 : normal cell representing air with some CO2 concentration
%   type = 1 : CO2 source, constantly emits a specific CO2 output
%   type = 2 : impermeable structure (ie: walls, chairs, tables, solid objects)
%   type = 3 : doors, fixed at normal indoor background co2 level (500 ppm)
%	type = 4 : window, fixed at lower co2 levels found outside (400 ppm)
%	type = 5 : ventillation, actively removing CO2 (300 ppm)

% Diffusion between normal air cells 
rule : { $conc } { $conc := (((-1,0) + (0,-1) + (0,0) + (0,1) + (1,0))/5); } 1000 { $type = 0 AND (-1,0) > 0 AND (0,-1) > 0 AND (0,1) > 0 AND (1,0) > 0}
rule : { $conc } { $conc := (((0,-1) + (0,0) + (0,1) + (1,0))/4); } 1000 { $type = 0 AND (-1,0) < 0 AND (0,-1) > 0 AND (0,1) > 0 AND (1,0) > 0}
rule : { $conc } { $conc := (((-1,0) + (0,0) + (0,1) + (1,0))/4); } 1000 { $type = 0 AND (-1,0) > 0 AND (0,-1) < 0 AND (0,1) > 0 AND (1,0) > 0}
rule : { $conc } { $conc := (((-1,0) + (0,-1) + (0,0) + (1,0))/4); } 1000 { $type = 0 AND (-1,0) > 0 AND (0,-1) > 0 AND (0,1) < 0 AND (1,0) > 0}
rule : { $conc } { $conc := (((-1,0) + (0,-1) + (0,0) + (0,1))/4); } 1000 { $type = 0 AND (-1,0) > 0 AND (0,-1) > 0 AND (0,1) > 0 AND (1,0) < 0}
rule : { $conc } { $conc := (((0,0) + (0,1) + (1,0))/3); } 1000 { $type = 0 AND (-1,0) < 0 AND (0,-1) < 0 AND (0,1) > 0 AND (1,0) > 0}
rule : { $conc } { $conc := (((-1,0) + (0,-1) + (0,0))/3); } 1000 { $type = 0 AND (-1,0) > 0 AND (0,-1) > 0 AND (0,1) < 0 AND (1,0) < 0}
rule : { $conc } { $conc := (((0,-1) + (0,0) + (1,0))/3); } 1000 { $type = 0 AND (-1,0) < 0 AND (0,-1) > 0 AND (0,1) < 0 AND (1,0) > 0}
rule : { $conc } { $conc := (((-1,0) + (0,0) + (0,1))/3); } 1000 { $type = 0 AND (-1,0) > 0 AND (0,-1) < 0 AND (0,1) > 0 AND (1,0) < 0}

% CO2 sources have their concentration continually increased by 12.16 ppm every 5 seconds. Normal diffusion rule applies.
 rule : { $conc } { $conc := (12.16 + (((-1,0) + (0,-1) + (0,0) + (0,1) + (1,0))/5)); } 5000 { $type = 1 }

% No diffusion / CO2 concentration for impermeable structures
rule : { $conc } { $conc := -10; } 1000 { $type = 2 }

% Doors represent fixed co2 levels of the rest of the building (large volume compared to small room)
rule : { $conc } { $conc := 500; } 1000 { $type = 3 }

% Windows to the outside have a lower CO2 concentration (anywhere from 300 to 400 ppm)
rule : { $conc } { $conc := 400; } 1000 { $type = 4 }

% Ventilation actively removes CO2 at a rate greater than doors or windows. (assumed equivalent to 300 ppm)
rule : { $conc } { $conc := 300; } 1000 { $type = 5 }

% Default rule: keep concentration the same if all other rules untrue (should never happen)
rule : { $conc } 1000 { t }


