local resourceRoot = getResourceRootElement(getThisResource())
     
addEventHandler("onClientResourceStart",resourceRoot,
function ()
    txd = engineLoadTXD ( "ak47.txd" )
    engineImportTXD ( txd, 355 )
    dff = engineLoadDFF ( "ak47.dff", 0 )
    engineReplaceModel ( dff, 355 )
    txd = engineLoadTXD ( "desert_eagle.txd" )
    engineImportTXD ( txd, 24 )
    dff = engineLoadDFF ( "desert_eagle.dff", 0 )
    engineReplaceModel ( dff, 24 )
end)