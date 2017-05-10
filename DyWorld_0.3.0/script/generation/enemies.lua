module("enemies", package.seeall)
require "data/prefix"

War_Between_Enemies = settings.global["DyWorld-enemy-war"].value

function Sanguisugea_Spawner(event)
	if math.random(25) == 5 then
		BuildEntity = dyworld_prefix.."enemy-base-001"
		PosX = event.area.left_top.x+math.random(-64,63)
		PosY = event.area.left_top.y+math.random(-64,63)
		Enemy_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity, {PosX,PosY}, 250, 250)
		if game.surfaces[1].can_place_entity{name=(BuildEntity), position=Enemy_Pos} then
			if War_Between_Enemies then
				game.surfaces[1].create_entity{name=(BuildEntity), position=Enemy_Pos, force = game.forces.sanguisugea}
				global.dyworld.Spawner_Sanguisugea = global.dyworld.Spawner_Sanguisugea + 1
				PlayerPrint("Sanguisugea Spawner Created, force: sanguisugea (FRIENDS WITH ALL!)")
				debug("Sanguisugea Spawner Created, force: sanguisugea (FRIENDS WITH ALL!)")
			else
				game.surfaces[1].create_entity{name=(BuildEntity), position=Enemy_Pos, force = game.forces.enemy}
				global.dyworld.Spawner_Sanguisugea = global.dyworld.Spawner_Sanguisugea + 1
				PlayerPrint("Sanguisugea Spawner Created, force: enemy")
				debug("Sanguisugea Spawner Created, force: enemy")
			end
		end
	end
end

function Zeptipod_Spawner(event)
	if math.random(25) == 5 then
		BuildEntity = dyworld_prefix.."enemy-base-101"
		PosX = event.area.left_top.x+math.random(-64,63)
		PosY = event.area.left_top.y+math.random(-64,63)
		Enemy_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity, {PosX,PosY}, 250, 250)
		if game.surfaces[1].can_place_entity{name=(BuildEntity), position=Enemy_Pos} then
			if War_Between_Enemies then
				game.surfaces[1].create_entity{name=(BuildEntity), position=Enemy_Pos, force = game.forces.zeptipods}
				global.dyworld.Spawner_Zeptipod = global.dyworld.Spawner_Zeptipod + 1
				PlayerPrint("Zeptipod Spawner Created, force: zeptipods (FIGHTS WITH MOST!)")
				debug("Zeptipod Spawner Created, force: zeptipods (FIGHTS WITH MOST!)")
			else
				game.surfaces[1].create_entity{name=(BuildEntity), position=Enemy_Pos, force = game.forces.enemy}
				global.dyworld.Spawner_Zeptipod = global.dyworld.Spawner_Zeptipod + 1
				PlayerPrint("Zeptipod Spawner Created, force: enemy")
				debug("Zeptipod Spawner Created, force: enemy")
			end
		end
	end
end
