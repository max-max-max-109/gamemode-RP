-- ten skrypt mozesz skopiowac i wstawic do innego zasobu

-- spis obiektow ruszanych przez skrypt
local obiekty={ "winda_u1", "winda_u2", "winda_u3", "winda_u4", "winda_u5", "winda_u6", "winda_u7", "winda_u8", "winda_u9", "winda_u10", "winda_u11", "winda_u12", "winda_u13", "winda_u14", "winda_u15", "winda_u16", "winda_u17", "winda_u18" }
		-- , "statek5", "statek6", "statek7", "statek8", "statek9", "statek10", "statek11", "statek12", "statek13", "statek14", "statek15", "statek16", "statek17", "statek18"}


local sekwencja={
	{ nazwa="1", czas=30, opoznienie=5 },	-- postoj
	{ nazwa="2", czas=5, opoznienie=1 },	-- drzwi wejscia open (1)
	{ nazwa="3", czas=5, opoznienie=5 },	-- drzwi windy open (1)
	{ nazwa="4", czas=5, opoznienie=1 },	-- drzwi windy close (1)
	{ nazwa="5", czas=5, opoznienie=0.05 },	-- drzwi wejscia close (1)
	{ nazwa="6", czas=10, opoznienie=5 },	-- winda
	{ nazwa="7", czas=5, opoznienie=1 },	-- drzwi wejscia open (2)
	{ nazwa="8", czas=5, opoznienie=5 },	-- drzwi windy open (2)
	{ nazwa="9", czas=5, opoznienie=1 },	-- drzwi windy close (2)
	{ nazwa="10", czas=5, opoznienie=0.05 },	-- drzwi wejscia close (2)
	{ nazwa="11", czas=10, opoznienie=5 },	-- winda
	{ nazwa="12", czas=5, opoznienie=1 },	-- drzwi wejscia open (3)
	{ nazwa="13", czas=5, opoznienie=5 },	-- drzwi windy open (3)
	{ nazwa="14", czas=5, opoznienie=1 },	-- drzwi windy close (3)
	{ nazwa="15", czas=5, opoznienie=0.05 },	-- drzwi wejscia close (3)
	{ nazwa="16", czas=10, opoznienie=5 },	-- winda
	{ nazwa="17", czas=5, opoznienie=1 },	-- drzwi wejscia open (4)
	{ nazwa="18", czas=5, opoznienie=5 },	-- drzwi windy open (4)
	{ nazwa="19", czas=5, opoznienie=1 },	-- drzwi windy close (4)
	{ nazwa="20", czas=5, opoznienie=0.05 },	-- drzwi wejscia close (4)
	{ nazwa="21", czas=10, opoznienie=5 },	-- winda
	{ nazwa="22", czas=5, opoznienie=1 },	-- drzwi wejscia open (5)
	{ nazwa="23", czas=5, opoznienie=5 },	-- drzwi windy open (5)
	{ nazwa="24", czas=5, opoznienie=1 },	-- drzwi windy close (5)
	{ nazwa="25", czas=5, opoznienie=0.05 },	-- drzwi wejscia close (5)
	{ nazwa="26", czas=10, opoznienie=5 },	-- winda
	{ nazwa="27", czas=5, opoznienie=1 },	-- drzwi wejscia open (6)
	{ nazwa="28", czas=5, opoznienie=5 },	-- drzwi windy open (6)
	{ nazwa="29", czas=5, opoznienie=1 },	-- drzwi windy close (6)
	{ nazwa="30", czas=5, opoznienie=0.05 },	-- drzwi wejscia close (6)
}

local krok=1	-- rozpoczynamy od pierwszego kroku w powyzszej sekwencji (mozna zmienic na inna wartosc)

--[[
	w pliku map musza byc zdefiniowane obiekty o ID podanym w 'obiekty'
	kazdy obiekt musi miec dodatkowo zdefiniowane dodatkowe polozenia, zgodne z nazwami w sekwencji, np.:

    <object id="statek1" doublesided="false" model="10771" interior="0" dimension="0" posX="-2334.8271484375" posY="2159.91796875" posZ="5.4443907737732" rotX="0" rotY="0" rotZ="270"
		posX_bayside="..." posY_bayside="...." posZ_bayside="..."
		posX_sf="..." posZ_sf="..."></object>

	jezeli dany argument jest pominiety (np. posX_sf) to znaczy ze sie nie zmienia, nie ma koniecznosci podawania niezmienionych pozycji

]]--

-- ponizej nic nie trzeba zmieniac --------------------------------------------------------------------------------------------------------------

function ruchObiektow()
	-- przechodzimy do nastepnego kroku
	krok=krok+1
	if (krok>#sekwencja) then
		krok=1
	end
--	outputDebugString("Sekwencja " .. sekwencja[krok].nazwa)

	-- dokonujemy ruchu obiektow
	local postfix="_"..sekwencja[krok].nazwa

	for _,nazwa_obiektu in ipairs(obiekty) do
		local obiekt=getElementByID(nazwa_obiektu)
		if (obiekt) then
			local cx,cy,cz=getElementPosition(obiekt)

			local posX=getElementData(obiekt,"posX"..postfix)
			if (not posX) then posX=cx end
			local posY=getElementData(obiekt,"posY"..postfix)
			if (not posY) then posY=cy end
			local posZ=getElementData(obiekt,"posZ"..postfix)
			if (not posZ) then posZ=cz end
			moveObject(obiekt, sekwencja[krok].czas*1000, posX, posY, posZ)
		end
	end

	-- podpinamy timer do nastepnego kroku w sekwencji
	setTimer(ruchObiektow, sekwencja[krok].czas*1000+sekwencja[krok].opoznienie*1000, 1)
end

-- rozpoczynamy pierwszy krok sekwencji
setTimer(ruchObiektow, sekwencja[krok].opoznienie*1000, 1)


