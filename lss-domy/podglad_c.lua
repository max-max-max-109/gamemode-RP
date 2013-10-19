--[[
Domy do wynajecia - podglad domow na mapie

@author Lukasz Biegaj <wielebny@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@lss-rp.pl>
@license GPLv2
]]--



bindKey( 'i', 'both', function( key, keyState )
	if keyState == 'down' then
		for k, v in ipairs ( getElementsByType( 'colshape', resourceRoot ) ) do
			local dom=getElementData(v,"dom")
			if (dom and dom.ownerid) then
				createBlipAttachedTo( v, 32, 2, 255,0,0,255,100,500 );
			else
				createBlipAttachedTo( v, 31, 2, 255,0,0,255,100,500 );
			end
		end
	else
		for k, v in ipairs( getElementsByType( 'blip', getResourceRootElement() ) ) do
			destroyElement(v)
		end
	end

end)
