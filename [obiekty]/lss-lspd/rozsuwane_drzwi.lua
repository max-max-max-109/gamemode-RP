--[[
Skrypt obslugujacy ruchome obiekty

@author Lukasz Biegaj <wielebny@lss-rp.pl>
@author WUBE <wube@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@lss-rp.pl>
@license GPLv2
]]--

--[[
	ten skrypt mozesz skopiwac do dowolnego innego zasobu i uzupelnic tylko tabele nizej
	w sumie to powinien nawet dzialac z obiektami z innego zasobu, byleby sie ID obiektu zgadzalo

	Dane ktore musi posiadac obiekt: 
			animtime - czas przesuwu podany w milisekundach
			pos2X, pos2Y, pos2Z
]]--

local ruchome_elementy={
-- przyklady:
--  { colsphere={x,y,z,r,i,vw}, obiekty={ "obiekt1", "obiekt2" } },			
--    ^ strefa o ksztalcie kuli o promieniu r. 
--	    argumenty i,vw sa opcjonalne
--
--								^ obiekty to dowolna ilosc obiektow, moze byc jeden, moze byc wiecej niz 2
--
--  { colsphere={x,y,z,r,i,vw}, obiekty={ "obiekt1", "obiekt2" }, frakcja="Policja" },			
-- 																  ^ opcjonalny argument frakcja okresla jaka frakcja (tylko jedna) moze miec dostep


	-- drzwi na komendzie LS
	{ colsphere={ 1557.39,-1679.05,1463.47, 1, 1, 5}, obiekty={ "drzwi_komLS_1", "drzwi_komLS_2" }, frakcja="Policja" },
	-- ostatnia brama przed wiezieniem
	{ colsphere={ 1576.12,-1698.87,1460.87, 1, 1, 5}, obiekty={ "brama1" }, frakcja="Policja", minrankid=2},
	-- ostatnia brama przed wiezieniem
	{ colsphere={ 1564.67,-1700.59,1460.87, 1, 1, 5}, obiekty={ "brama2" }, frakcja="Policja", minrankid=2},
	-- brama wjazdowa na parking
	{ colsphere={1592.11,-1637.63,13.54, 8, 0, 0}, obiekty={ "brama_1_komLS" }, frakcja="Policja",minrankid=2 },
	-- brama wejsciowa na parking
	{ colsphere={1583.48,-1638.25,13.35, 1, 0, 0}, obiekty={ "brama_2_komLS" }, frakcja="Policja",minrankid=2 },	
	-- drzwi przy dachu
	{ colsphere={1635.89,-1682.97,1463.48, 1, 1, 5}, obiekty={ "dach_komLS_1", "dach_komLS_2" }, frakcja="Policja", minrankid=7 },		
}


-- nizej nie trzeba nic edytowac ---------------------------------------------------------------------------------------------------------------------

function ruchomeElementyCH(hitElement, matchingDimension)
	if (not matchingDimension or getElementType(hitElement)~="player") then
		return
	end
	-- szukamy elementu
	for i,v in ipairs(ruchome_elementy) do
		if (ruchome_elementy[i].colshape and ruchome_elementy[i].colshape==source) then
			-- sprawdzamy czy nie ma ograniczen do frakcji
			if (ruchome_elementy[i].frakcja) then
				local t=getElementData(hitElement,"faction:name")
				if (not t or t~=ruchome_elementy[i].frakcja) then
					outputChatBox("Dostep tylko dla czlonkow frakcji "..ruchome_elementy[i].frakcja, hitElement)
					return
				end
				if ruchome_elementy[i].minrankid then
					local lfrid=tonumber(getElementData(hitElement,"faction:rank_id"))
					if not lfrid or lfrid<ruchome_elementy[i].minrankid then
						return
					end
				end
			end
			-- przesuwamy!
			for i2,v2 in ipairs(ruchome_elementy[i].obiekty) do
				local o=getElementByID(v2)
				if (o) then
					moveObject(o, getElementData(o,"animtime"), getElementData(o,"pos2X"), getElementData(o,"pos2Y"), getElementData(o,"pos2Z"))
				else
					outputDebugString("Nie znaleziono przesuwanego obiektu o id " .. v2)
				end
			end
			return
		end
	end
end

function ruchomeElementyCL(hitElement, matchingDimension)
	if (not matchingDimension or getElementType(hitElement)~="player") then
		return
	end
	for i,v in ipairs(ruchome_elementy) do
		if (ruchome_elementy[i].colshape and ruchome_elementy[i].colshape==source) then
			for i2,v2 in ipairs(ruchome_elementy[i].obiekty) do
				local o=getElementByID(v2)
				if (o) then
					moveObject(o, getElementData(o,"animtime"), getElementData(o,"posX"), getElementData(o,"posY"), getElementData(o,"posZ"))
				else
					outputDebugString("Nie znaleziono przesuwanego obiektu o id " .. v2)
				end
			end
			return
		end
	end

end


for i,v in ipairs(ruchome_elementy) do
	if (ruchome_elementy[i].colsphere) then
		ruchome_elementy[i].colshape=createColSphere( ruchome_elementy[i].colsphere[1], ruchome_elementy[i].colsphere[2], ruchome_elementy[i].colsphere[3], ruchome_elementy[i].colsphere[4] )
		if (ruchome_elementy[i].colsphere[5]) then setElementInterior(ruchome_elementy[i].colshape, ruchome_elementy[i].colsphere[5]) end
		if (ruchome_elementy[i].colsphere[6]) then setElementDimension(ruchome_elementy[i].colshape, ruchome_elementy[i].colsphere[6]) end
	end
	if (ruchome_elementy[i].colshape) then
		addEventHandler ( "onColShapeHit", ruchome_elementy[i].colshape, ruchomeElementyCH )
		addEventHandler ( "onColShapeLeave", ruchome_elementy[i].colshape, ruchomeElementyCL )
	else
		outputDebugString("Nie utworzono colshape dla ruchomego elementu")
	end
end