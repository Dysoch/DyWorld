module("generation", package.seeall)
require "script/generation/noise"

Ruins = {"small-scorchmark", "sand-rock-big", "rock-big", "rock-huge"}

local keysetRuins = {}
for k in pairs(Ruins) do
    table.insert(keysetRuins, k)
end

function Ruins_Spawner(event)
	for i = 1, (math.random(5,15)) do
		BuildEntity = Ruins[keysetRuins[math.random(#keysetRuins)]]
		PosX = event.area.left_top.x+math.random(-63,63)
		PosY = event.area.left_top.y+math.random(-63,63)
		if game.surfaces[1].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
			game.surfaces[1].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.player}
		end
	end
	--debug("Generator: Created "..BuildEntity.." at "..PosX..", "..PosY)
end

function Ship_Spawner(event)
	PosX1 = 0+math.random(-150,150)
	PosY1 = 0+math.random(-150,150)
	PosX2 = 0+math.random(-150,150)
	PosY2 = 0+math.random(-150,150)
	PosX3 = 0+math.random(-150,150)
	PosY3 = 0+math.random(-150,150)
	BuildEntity1 = "big-ship-wreck-1"
	BuildEntity2 = "big-ship-wreck-2"
	BuildEntity3 = "big-ship-wreck-3"
	Ship_1_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity1, {PosX1,PosY1}, 250, 1)
	Ship_2_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity2, {PosX2,PosY2}, 250, 1)
	Ship_3_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity3, {PosX3,PosY3}, 250, 1)
	if not global.dyworld.Generation_Ship_1 then 
		Ship_1_Created = game.surfaces[1].create_entity{name=(BuildEntity1), position=Ship_1_Pos, force=game.forces.player}
		Ship_1_Created.insert{name="landfill", count=math.random(200)}
		Ship_1_Created.insert{name="stone", count=math.random(200)}
		if math.random(1,10) == 5 then
			Ship_1_Created.insert{name="iron-ore", count=math.random(100)}
		end
		if math.random(1,10) == 5 then
			Ship_1_Created.insert{name="repair-pack", count=math.random(50)}
		end
		global.dyworld.Generation_Ship_1 = true
		global.dyworld.Generation_Ship_1_PosX = Ship_1_Pos.x
		global.dyworld.Generation_Ship_1_PosY = Ship_1_Pos.y
	end
	if not global.dyworld.Generation_Ship_2 then 
		Ship_2_Created = game.surfaces[1].create_entity{name=(BuildEntity2), position=Ship_2_Pos, force=game.forces.player}
		Ship_2_Created.insert{name="coal", count=math.random(100)}
		if math.random(1,10) == 5 then
			Ship_2_Created.insert{name="copper-plate", count=math.random(50)}
		end
		if math.random(1,10) == 5 then
			Ship_2_Created.insert{name="raw-wood", count=math.random(100)}
		end
		global.dyworld.Generation_Ship_2 = true
		global.dyworld.Generation_Ship_2_PosX = Ship_2_Pos.x
		global.dyworld.Generation_Ship_2_PosY = Ship_2_Pos.y
	end
	if not global.dyworld.Generation_Ship_3 then 
		Ship_3_Created = game.surfaces[1].create_entity{name=(BuildEntity3), position=Ship_3_Pos, force=game.forces.player}
		if math.random(1,10) == 5 then
			Ship_3_Created.insert{name="iron-plate", count=math.random(50)}
		end
		Ship_3_Created.insert{name="wood", count=math.random(25)}
		global.dyworld.Generation_Ship_3 = true
		global.dyworld.Generation_Ship_3_PosX = Ship_3_Pos.x
		global.dyworld.Generation_Ship_3_PosY = Ship_3_Pos.y
	end
end