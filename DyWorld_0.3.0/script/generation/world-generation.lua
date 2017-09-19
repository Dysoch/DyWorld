module("generation", package.seeall)
require "script/generation/noise"

Ruins = {"small-scorchmark", "stone-rock", "red-desert-rock-big-01"}

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
	PosX = event.area.left_top.x
	PosY = event.area.left_top.y
	BuildEntity1 = "big-ship-wreck-1"
	BuildEntity2 = "big-ship-wreck-2"
	BuildEntity3 = "big-ship-wreck-3"
	Ship_1_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity1, {PosX,PosY}, 250, 250)
	Ship_2_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity2, {PosX,PosY}, 250, 250)
	Ship_3_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity3, {PosX,PosY}, 250, 250)
	if not global.dyworld.Generation_Ship_1 then 
		Ship_1_Created = game.surfaces[1].create_entity{name=(BuildEntity1), position=Ship_1_Pos, force=game.forces.player}
		Ship_1_Created.insert{name="stone", count=math.random(100)}
		if math.random(1,10) == 5 then
			Ship_1_Created.insert{name="iron-ore", count=math.random(100)}
		end
		if math.random(1,10) == 5 then
			Ship_1_Created.insert{name="repair-pack", count=math.random(50)}
		end
		global.dyworld.Generation_Ship_1 = true
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
	end
	if not global.dyworld.Generation_Ship_3 then 
		Ship_3_Created = game.surfaces[1].create_entity{name=(BuildEntity3), position=Ship_3_Pos, force=game.forces.player}
		if math.random(1,10) == 5 then
			Ship_3_Created.insert{name="iron-plate", count=math.random(50)}
		end
		Ship_3_Created.insert{name="wood", count=math.random(25)}
		global.dyworld.Generation_Ship_3 = true
	end
end