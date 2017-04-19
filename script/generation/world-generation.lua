module("generation", package.seeall)

Ruins = {"stone-wall"}

local keysetRuins = {}
for k in pairs(Ruins) do
    table.insert(keysetRuins, k)
end

function Ruins_Spawner(event)
	for i = 1, (math.random(5,15)) do
		BuildEntity = Ruins[keysetRuins[math.random(#keysetRuins)]]
		PosX = event.area.left_top.x+math.random(31)
		PosY = event.area.left_top.y+math.random(31)
		if game.surfaces[1].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then 
			game.surfaces[1].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.player}
		end
	end
	--debug("Generator: Created "..BuildEntity.." at "..PosX..", "..PosY)
end