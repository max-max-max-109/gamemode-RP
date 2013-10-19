-- 1700.01,248.84,1420.32,38.7
local D=0
local I=0
local o1=createPed(math.random(163,164),1955.82,-2181.50,13.59,262.8,false)
setElementInterior(o1,I)
setElementDimension(o1,D)
setElementData(o1,"npc", true)
setElementData(o1,"name","Ochroniarz")
setPedAnimation ( o1, "COP_AMBIENT", "Coplook_loop", -1, true, false )
setElementFrozen(o1,true)

