--[[
@author Lukasz Biegaj <wielebny@lss-rp.pl>
@author Karer <karer.programmer@gmail.com>
@author WUBE <wube@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@lss-rp.pl>
@license GPLv2
]]--

function menu_zastrzyk(args)
    local x,y,z=getElementPosition(localPlayer)
    local x2,y2,z2=getElementPosition(args.with)
    if (getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)>3) then
	outputChatBox("(( podejdź bliżej. ))", 255,0,0)
	return
    end
    triggerServerEvent("doZastrzyk", resourceRoot, localPlayer, args.with, args.subtype)
    exports["lss-gui"]:eq_takeItem(37,1,args.subtype)
end