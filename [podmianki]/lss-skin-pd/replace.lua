addEventHandler("onClientResourceStart",resourceRoot,
    function ()


	SKIN_ID=308
    txd = engineLoadTXD ( "ballas3.txd" )
    engineImportTXD ( txd, SKIN_ID )
    dff = engineLoadDFF ( "ballas3.dff", SKIN_ID )
    engineReplaceModel ( dff, SKIN_ID )

	SKIN_ID=309
    txd = engineLoadTXD ( "fam2.txd" )
    engineImportTXD ( txd, SKIN_ID )
    dff = engineLoadDFF ( "fam2.dff", SKIN_ID )
    engineReplaceModel ( dff, SKIN_ID )

	SKIN_ID=300
    txd = engineLoadTXD ( "vla1.txd" )
    engineImportTXD ( txd, SKIN_ID )
    dff = engineLoadDFF ( "vla1.dff", SKIN_ID )
    engineReplaceModel ( dff, SKIN_ID )


end)