
local drzwi={}
drzwi.obiekt=createObject(1495,2815.3393554688,-1113.2431640625,1592.7045288086,0,0,270)
setElementData(drzwi.obiekt,"customAction",{label="Otwórz/zamknij",resource="lss-turystyka",funkcja="menu_drzwi",args={}})

-- dimension
setElementDimension(drzwi.obiekt, 51)  -- bylo drzwi, ma byc drzwi.obiekt (tak jak wyzej)
-- interior
setElementInterior(drzwi.obiekt, 1)  -- j.w.

drzwi.animacja=false
drzwi.zamknieta=true

drzwi.otworz=function()
    if (drzwi.animacja or not drzwi.zamknieta) then return false end
    drzwi.animacja=true
    moveObject(drzwi.obiekt,3000,2815.3393554688,-1113.2431640625,1592.7045288086,0,0,90,"OutBounce")
    setTimer(function() drzwi.animacja=false drzwi.zamknieta=false end, 6000, 1)
end

drzwi.zamknij=function()
    if (drzwi.animacja or drzwi.zamknieta) then return false end
    drzwi.animacja=true	
    moveObject(drzwi.obiekt,3000,2815.3393554688,-1113.2431640625,1592.7045288086,0,0,-90,"OutBounce")
    setTimer(function() drzwi.animacja=false drzwi.zamknieta=true end, 6000, 1)
end


local function pracownik(id)
    local query=string.format("SELECT rank FROM lss_character_factions WHERE faction_id=35 AND character_id=%d", id)
    local wynik=exports.DB:pobierzWyniki(query)
    if (wynik and wynik.rank and tonumber(wynik.rank)>=2 and tonumber(wynik.rank)<=9) then return true else return false end
end

drzwi.toggle=function(gracz)
    -- automagiczne spawdzanie czy gracz jest pracownikiem frakcji
    local c=getElementData(gracz,"character")
    if (not c or not c.id) then return end
    if (not pracownik(tonumber(c.id))) then
	outputChatBox("(( nie masz klucza do tych drzwi ))", gracz)
	return
    end
    
    local x,y,z=getElementPosition(drzwi.obiekt)
    local x2,y2,z2=getElementPosition(gracz)
    local dist=getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
    
    if ((dist>2.5) or getPedOccupiedVehicle(gracz)) then
	outputChatBox("Podejdź bliżej do drzwi.", gracz, 255,0,0,true)
	return
    end

    if (drzwi.animacja) then
	outputChatBox("Odczekaj chwilę.", gracz, 255,0,0,true)
	return
    end
    if (drzwi.zamknieta) then
	drzwi.otworz()
	triggerEvent("broadcastCaptionedEvent", gracz, getPlayerName(gracz) .. " otwiera drzwi.", 5, 15, true)
    else
	drzwi.zamknij()
	triggerEvent("broadcastCaptionedEvent", gracz, getPlayerName(gracz) .. " zamyka drzwi.", 5, 15, true)
    end

end

addEvent("onTurystykaDrzwiToggleRequest", true)
addEventHandler("onTurystykaDrzwiToggleRequest", resourceRoot, drzwi.toggle)
