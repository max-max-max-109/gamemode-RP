--[[
@author Lukasz Biegaj <wielebny@lss-rp.pl>
@author Karer <karer.programmer@gmail.com>
@author WUBE <wube@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@lss-rp.pl>
@license GPLv2
@package MTA-XyzzyRP
@link https://github.com/lpiob/MTA-XyzzyRP GitHub
]]--



local function sciagnijBandane(plr)
	local character=getElementData(plr,"character")

--	if not character then return end -- nie opwinno sie wydarzyc

	triggerEvent("broadcastCaptionedEvent", plr, getPlayerName(plr) .. " zdejmuje bandane.", 3, 15, true)
	removeElementData(plr,"zamaskowany")

	-- todo to powinno byc robione wczesniej
	local nnick=string.gsub(character.imie .. "_" .. character.nazwisko," ", "_")
	setPlayerName(plr, nnick)

end

local function zalozBandane(plr)
	local opn=getPlayerName(plr)

	local nn="Zamaskowana_osoba_"..math.random(100,999)
	if not setPlayerName(plr,nn) then return end
	triggerEvent("broadcastCaptionedEvent", plr, opn .. " zakłada bandane.", 3, 15, true)
	setElementData(plr,"zamaskowany", 198)

end


addEvent("BandanaAction", true)
addEventHandler("BandanaAction", root, function(forceSciagnij)
	if forceSciagnij then
		sciagnijBandane(source)
		return
	end

	local item_w_eq=exports["lss-core"]:eq_getItem(source, 198)

	if not item_w_eq or not item_w_eq.count or item_w_eq.count<1 then
		sciagnijBandane(source)
		return
	end


	local zamaskowany=getElementData(source,"zamaskowany")
	if zamaskowany and zamaskowany==198 then
		sciagnijBandane(source)
	else
		zalozBandane(source)
	end
	return
end)