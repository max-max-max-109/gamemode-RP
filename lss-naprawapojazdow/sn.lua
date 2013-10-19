--[[
@author Lukasz Biegaj <wielebny@lss-rp.pl>
@author Karer <karer.programmer@gmail.com>
@author RacheT <rachet@pylife.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@lss-rp.pl>
@license GPLv2
@package MTA-XyzzyRP
@link https://github.com/lpiob/MTA-XyzzyRP GitHub
]]--



-- uniwersalny kod wspoldzielony pomiedzy warsztatami

local strefyNapraw={

	--idlewood
  warsztatIdlewoodStanowsko11={
    cuboid={1846.96, -1784.89, 14.1, 5, 9, 6 },-- cuboid w ktorym musi znalezc sie pojazd
    mpos={1854.92,-1780.84,12.55}, -- pozycja markera w ktorym gracz bedzie stal aby naprawiac
    faction_id=3, -- id frakcji ktora ma do tego dostep
  },
  
  warsztatIdlewoodStanowsko12={
    cuboid={1846.96, -1775.17, 14.1, 5, 9, 6 },-- cuboid w ktorym musi znalezc sie pojazd
    mpos={1854.44,-1772.43,12.65}, -- pozycja markera w ktorym gracz bedzie stal aby naprawiac
    faction_id=3, -- id frakcji ktora ma do tego dostep
  },
  
  warsztatIdlewoodStanowsko2={
    cuboid={1892.99, -1784.89, 14.1, 5, 21, 6 },-- cuboid w ktorym musi znalezc sie pojazd
    mpos={1900.45,-1779.93,12.55}, -- pozycja markera w ktorym gracz bedzie stal aby naprawiac
    faction_id=3, -- id frakcji ktora ma do tego dostep
  },

  
  
  
  
  
}

for i,v in pairs(strefyNapraw) do
  v.cs=createColCuboid(unpack(v.cuboid))
  v.marker=createMarker(v.mpos[1], v.mpos[2], v.mpos[3], "cylinder", 1, 0,0,0,100)
  setElementData(v.marker,"cs",v.cs)
  setElementData(v.marker,"faction_id",v.faction_id)
  
end

--   triggerServerEvent("naprawaElementu", resourceRoot, naprawiany_pojazd, czesc, koszt)
addEvent("naprawaElementu", true)
addEventHandler("naprawaElementu", resourceRoot, function(pojazd, czesc, koszt)
  outputDebugString("Naprawa elementu " .. czesc .. " za " .. koszt)
  if koszt>getPlayerMoney(client) then
    return
  end

  if (czesc==-1) then
--    setElementHealth(pojazd, 1000)

    local vps={}
    local vds={}
    local vls={}

    for i=0,6 do          vps[i]=getVehiclePanelState(pojazd,i)     end
    for i=0,3 do          vds[i]=getVehicleDoorState(pojazd,i) end
    for i=0,3 do          vls[i]=getVehicleLightState(pojazd,i) end

    fixVehicle(pojazd)

    for i=0,6 do      setVehiclePanelState(pojazd, i, vps[i])    end
    for i=0,3 do      setVehicleDoorState(pojazd, i, vds[i])    end
    for i=0,3 do      setVehicleLightState(pojazd, i, vls[i])    end

    triggerClientEvent(client, "refreshVehicleData", resourceRoot, pojazd)
  elseif czesc>=0 and czesc<=6 then
    setVehiclePanelState(pojazd, czesc, 0)
    triggerClientEvent(client, "refreshVehicleData", resourceRoot, pojazd)
  elseif czesc>=10 and czesc<20 then
    local drzwi=czesc-10
    setVehicleDoorState(pojazd, drzwi, 0)
    triggerClientEvent(client, "refreshVehicleData", resourceRoot, pojazd)
  elseif czesc>=20 then
    local swiatlo=czesc-20
    setVehicleLightState(pojazd, swiatlo, 0)
    triggerClientEvent(client, "refreshVehicleData", resourceRoot, pojazd)
  end
end)