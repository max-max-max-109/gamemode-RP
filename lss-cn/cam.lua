--[[
@author Lukasz Biegaj <wielebny@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@lss-rp.pl>
@license GPLv2
]]--


local lastPhoto

addEvent("onPlayerTakePhoto", true)
addEventHandler("onPlayerTakePhoto", resourceRoot, function(pixels)
    lastPhoto=pixels
--	outputChatBox("Photo from " .. getPlayerName(client))
--	local t=createElement("photo")
--	setElementData(t,"pixels", pixels)
	triggerLatentClientEvent("updatePhoto", 50000, resourceRoot, pixels)
end)


local tvroot=createElement("tvroot")

addEvent("requestLastPhoto", true)
addEventHandler("requestLastPhoto", resourceRoot, function()
  if lastPhoto then
    triggerLatentClientEvent(client, "updatePhoto", 50000, resourceRoot, lastPhoto)
  end
end)

