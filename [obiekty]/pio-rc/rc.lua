oX=1000
createObject(1596,oX+-1132.6953,1073.9922,1354.7500,0.0000,0.0000,0.0000)
createObject(1596,oX+-973.5625,1046.0703,1353.9688,0.0000,0.0000,0.0000)
createObject(2060,oX+-1124.9766,1053.9375,1344.7578,0.0000,0.0000,270.0000)
createObject(2060,oX+-1124.9766,1055.0781,1344.7578,0.0000,0.0000,270.0000)
--createObject(2060,oX+-1124.9766,1060.4766,1345.0234,0.0000,0.0000,270.0000)
--createObject(2060,oX+-980.4297,1058.0156,1344.5781,0.0000,0.0000,270.0000)
createObject(2060,oX+-980.4297,1058.5625,1344.3359,0.0000,0.0000,270.0000)
createObject(2060,oX+-980.4297,1063.6953,1344.0625,0.0000,0.0000,270.0000)
createObject(3925,oX+-1009.7578,1079.0469,1340.8438,0.0000,0.0000,0.0000)
createObject(3932,oX+-1131.9453,1029.1406,1346.4063,0.0000,0.0000,0.0000)
createObject(3933,oX+-1052.6016,1063.2578,1347.0781,0.0000,0.0000,0.0000)
createObject(3935,oX+-1097.7422,1037.8750,1343.0781,0.0000,0.0000,0.0000)
createObject(3936,oX+-974.5547,1059.4609,1344.7734,0.0000,0.0000,180.0000)
createObject(3937,oX+-1130.9219,1059.4609,1345.4688,0.0000,0.0000,0.0000)
createObject(3938,oX+-974.5547,1059.4453,1344.7734,0.0000,0.0000,180.0000)
createObject(3939,oX+-975.0469,1089.6563,1345.6563,0.0000,0.0000,180.0000)
createObject(3940,oX+-974.4453,1041.5391,1347.1484,0.0000,0.0000,180.0000)
createObject(3941,oX+-1132.1094,1077.7422,1347.9063,0.0000,0.0000,0.0000)
createObject(3947,oX+-1071.1953,1059.6406,1343.2656,0.0000,0.0000,0.0000)
createObject(3949,oX+-1070.1250,1059.6406,1343.0156,0.0000,0.0000,0.0000)
createObject(3950,oX+-991.2891,1059.6328,1341.6328,0.0000,0.0000,0.0000)
createObject(3951,oX+-1071.1953,1059.6406,1343.2656,0.0000,0.0000,0.0000)
createObject(3952,oX+-1038.9844,1035.0156,1343.2656,0.0000,0.0000,0.0000)
createObject(3953,oX+-1024.5625,1059.0469,1342.9453,0.0000,0.0000,0.0000)
createObject(3954,oX+-1027.9375,1070.9844,1341.3359,0.0000,0.0000,0.0000)
createObject(3955,oX+-1042.6406,1072.6406,1343.8594,0.0000,0.0000,0.0000)
createObject(3956,oX+-1083.6953,1071.8594,1341.9688,0.0000,0.0000,0.0000)
createObject(3957,oX+-1071.3828,1050.0547,1342.7813,0.0000,0.0000,0.0000)
createObject(3960,oX+-1130.8594,1059.4453,1345.5156,0.0000,0.0000,0.0000)

for i,v in ipairs(getElementsByType("object", resourceRoot)) do
	setElementInterior(v,1)
	setElementDimension(v,3136)
end
