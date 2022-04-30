#BeginMacro(virusspreading)
max( max( max((0,-1)~virusvers,(-1,0)~virusvers), max((1,1)~virusvers,(0,1)~virusvers)), max( max((1,0)~virusvers,(1,-1)~virusvers), max((-1,1)~virusvers,(-1,-1)~virusvers)))
#EndMacro

#BeginMacro(vPossibility_Of_Spreading)
0.15
#EndMacro


#BeginMacro(aUpdates)
~anvirusvers := #Macro(anvirusspreading) ; ~state := 2 
#EndMacro

#BeginMacro(aPossibility_Of_Spreading)
0.85
#EndMacro

#BeginMacro(vFactor_Outer)
if ( (-1, -1)~virusvers > $virusvers, 1, 0) + if ( (-1, 1)~virusvers > $virusvers, 1, 0) + if ( (1, 1)~virusvers > $virusvers, 1, 0) + if ( (1, -1)~virusvers > $virusvers, 1, 0)
#EndMacro

#BeginMacro(vFactor_Inner)
if ( (0, -1)~virusvers > $virusvers, 1, 0) + if ( (0, 1)~virusvers > $virusvers, 1, 0) + if ( (1, 0)~virusvers > $virusvers, 1, 0) + if ( (-1, 0)~virusvers > $virusvers, 1, 0)
#EndMacro

#BeginMacro(anvirusspreading)
max( max( max((0,-1)~anvirusvers,(-1,0)~anvirusvers), max((1,1)~anvirusvers,(0,1)~anvirusvers)), max( max((1,0)~anvirusvers,(1,-1)~anvirusvers), max((-1,1)~anvirusvers,(-1,-1)~anvirusvers)))
#EndMacro

#BeginMacro(countimmune)
not ( (0, -1)~state = 2 and (-1, 0)~state = 2 and (0, 1)~state = 2 and (-1, -1)~state = 2 and (1, 0)~state = 2 and (1, -1)~state = 2 and (-1, 1)~state = 2 and (1, 1)~state = 2 )
#EndMacro
