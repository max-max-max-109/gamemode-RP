VEH=560
function handlingChange()
--	setModelHandling(VEH, "mass", 11290)
--	setModelHandling(VEH, "turnMass", 30000)
	setModelHandling(VEH, "dragCoeff", 1)
--	setModelHandling(VEH, "tractionMultiplier", 0.7)
	setModelHandling(VEH, "tractionLoss", 1.001)
	setModelHandling(VEH, "centerOfMass", {0.0, 0.1, -0.2} )
	setModelHandling(VEH, "maxVelocity", 300)
	setModelHandling(VEH, "engineAcceleration", 10)
end

addEventHandler("onResourceStart", resourceRoot, handlingChange)
function resetHandling()
	for k,_ in pairs(getModelHandling(VEH)) do
		setModelHandling(VEH, k, nil)
	end
end
addEventHandler("onResourceStop", resourceRoot, resetHandling)