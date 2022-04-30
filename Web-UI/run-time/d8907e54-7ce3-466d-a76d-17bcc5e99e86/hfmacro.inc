#BeginMacro(meanofpress)
(
if( (-1,-1,-1)~press != ?, (-1,-1,-1)~press, 0) + 
if( (-1,0,-1)~press != ?, (-1,0,-1)~press, 0) +
if( (-1,1,-1)~press != ?, (-1,1,-1)~press, 0) +
if( (0,-1,-1)~press != ?, (0,-1,-1)~press, 0) +
if( (0,0,-1)~press != ?, (0,0,-1)~press, 0) +
if( (0,1,-1)~press != ?, (0,1,-1)~press, 0) +
if( (1,-1,-1)~press != ?, (1,-1,-1)~press, 0) +
if( (1,0,-1)~press != ?, (1,0,-1)~press, 0) +
if( (1,1,-1)~press != ?, (1,1,-1)~press, 0) +
if( (-1,-1,0)~press != ?, (-1,-1,0)~press, 0) + 
if( (-1,0,0)~press != ?, (-1,0,0)~press, 0) +
if( (-1,1,0)~press != ?, (-1,1,0)~press, 0) +
if( (0,-1,0)~press != ?, (0,-1,0)~press, 0) +
if( (0,0,0)~press != ?, (0,0,0)~press, 0) +
if( (0,1,0)~press != ?, (0,1,0)~press, 0) +
if( (1,-1,0)~press != ?, (1,-1,0)~press, 0) +
if( (1,0,0)~press != ?, (1,0,0)~press, 0) +
if( (1,1,0)~press != ?, (1,1,0)~press, 0) +
if( (-1,-1,1)~press != ?, (-1,-1,1)~press, 0) + 
if( (-1,0,1)~press != ?, (-1,0,1)~press, 0) +
if( (-1,1,1)~press != ?, (-1,1,1)~press, 0) +
if( (0,-1,1)~press != ?, (0,-1,1)~press, 0) +
if( (0,0,1)~press != ?, (0,0,1)~press, 0) +
if( (0,1,1)~press != ?, (0,1,1)~press, 0) +
if( (1,-1,1)~press != ?, (1,-1,1)~press, 0) +
if( (1,0,1)~press != ?, (1,0,1)~press, 0) +
if( (1,1,1)~press != ?, (1,1,1)~press, 0)
) / if ((27 - stateCount(0,~cstateport) - stateCount(?,~cstateport))=0,1,(27 - stateCount(0,~cstateport) - stateCount(?,~cstateport)))
#EndMacro

#BeginMacro(threshold)
((cellPos(0)+3000)*299800+150000) * (1 + if(stateCount(2,~cstateport)=1,0,1) * $compress )
#EndMacro

#BeginMacro(compressrock)
(
if( (-1,-1,-1)~cstateport = 1, (-1,-1,-1)~compressport*0.7,0)+
if( (-1,0,-1)~cstateport = 1, 	(-1,0,-1)~compressport*0.7,0)+
if( (-1,1,-1)~cstateport = 1,  (-1,1,-1)~compressport*0.7,0)+
if( (0,-1,-1)~cstateport = 1,	(0,-1,-1)~compressport*0.7,0)+
if( (0,-1,-1)~cstateport = 1,	(0,0,-1)~compressport*0.7,0)+
if( (0,1,-1)~cstateport = 1,   (0,1,-1)~compressport*0.7,0)+
if( (1,-1,-1)~cstateport = 1,  (1,-1,-1)~compressport*0.7,0)+
if( (1,0,-1)~cstateport = 1,   (1,0,-1)~compressport*0.7,0)+
if( (1,1,-1)~cstateport = 1,   (1,1,-1)~compressport*0.7,0)+
if( (-1,-1,0)~cstateport = 1, (-1,-1,0)~compressport*0.7,0)+
if( (-1,0,0)~cstateport = 1, 	(-1,0,0)~compressport*0.7,0)+
if( (-1,1,0)~cstateport = 1,  (-1,1,0)~compressport*0.7,0)+
if( (0,-1,0)~cstateport = 1,	(0,-1,0)~compressport*0.7,0)+
if( (0,1,0)~cstateport = 1,   (0,1,0)~compressport*0.7,0)+
if( (1,-1,0)~cstateport = 1,  (1,-1,0)~compressport*0.7,0)+
if( (1,0,0)~cstateport = 1,   (1,0,0)~compressport*0.7,0)+
if( (1,1,0)~cstateport = 1,   (1,1,0)~compressport*0.7,0)+
if( (-1,-1,1)~cstateport = 1, (-1,-1,1)~compressport*0.7,0)+
if( (-1,0,1)~cstateport = 1, 	(-1,0,1)~compressport*0.7,0)+
if( (-1,1,1)~cstateport = 1,  (-1,1,1)~compressport*0.7,0)+
if( (0,-1,1)~cstateport = 1,	(0,-1,1)~compressport*0.7,0)+
if( (0,-1,1)~cstateport = 1,	(0,0,1)~compressport*0.7,0)+
if( (0,1,1)~cstateport = 1,   (0,1,1)~compressport*0.7,0)+
if( (1,-1,1)~cstateport = 1,  (1,-1,1)~compressport*0.7,0)+
if( (1,0,1)~cstateport = 1,   (1,0,1)~compressport*0.7,0)+
if( (1,1,1)~cstateport = 1,   (1,1,1)~compressport*0.7,0)
)
#EndMacro