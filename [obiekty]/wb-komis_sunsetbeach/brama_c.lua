function menu_brama()
	local c=getElementData(localPlayer,"character")
	if not c or not c.id then return end
	if tonumber(c.id)~=13373 and tonumber(c.id)~=13373 then
		outputChatBox("Nie masz klucza do bramy.", 255,0,0,true)
		return
	end
	triggerServerEvent("onBramaToggleRequest", resourceRoot)
end