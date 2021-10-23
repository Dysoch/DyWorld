

function DyWorld_Base_Attack(Surface)
	local Loc = Pick_Random_Attack_Location(Surface)
	local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 500))
	if (global.dyworld.game_stats.wave_spawners and global.dyworld.game_stats.wave_spawners[Surface] and global.dyworld.game_stats.wave_spawners[Surface].spawners_amount >= 1) then
		local Spawned = 0
		for i = 1, Str do
			local BuildEntity = Check_Wave_Tier(game.forces.enemy.evolution_factor)
			local Spawn_Loc_table = global.dyworld.game_stats.wave_spawners[Surface].spawners_loc
			local Spawn_randomized = math.random(#Spawn_Loc_table)
			PosX = Spawn_Loc_table[Spawn_randomized].posx + math.random(-40,40)
			PosY = Spawn_Loc_table[Spawn_randomized].posy + math.random(-40,40)
			if game.surfaces[Surface].can_place_entity{name=(BuildEntity), position = {PosX, PosY}} then
				game.surfaces[Surface].create_entity{name = (BuildEntity), position = {PosX, PosY}, force = game.forces.enemy}
				Spawned = Spawned + 1
			end
		end
		for Spawner, Table in pairs(global.dyworld.game_stats.wave_spawners[Surface].spawners_loc) do
			--[[
			local X_1 = Table.posx + math.random(-50,50)
			local Y_1 = Table.posy + math.random(-50,50)
			game.surfaces[Surface].create_unit_group({position = {X, Y}, force = "enemy"})
			]]
			local X_2 = Table.posx
			local Y_2 = Table.posy
			local Area = game.surfaces[Surface].find_entities_filtered{position = {X_2, Y_2}, radius = 75, type = "unit"} 
			for _,Unit in pairs(Area) do
				Unit.set_command({
						type = defines.command.attack_area,
						destination = Loc,
						radius = 5})
			end
		end
		if global.dyworld.game_stats.attack_warning_3 then
			AttackPrint({"DyDs-story.attack-3", Loc.x, Loc.y, Surface, Spawned})
		elseif global.dyworld.game_stats.attack_warning_2 then
			AttackPrint({"DyDs-story.attack-2", Spawned})
		elseif global.dyworld.game_stats.attack_warning_1 then
			AttackPrint({"DyDs-story.attack-1"})
		end
		DyWorld_Custom_Difficulty_Change("-", Spawned / 2)
	end
end


function DyWorld_Custom_Difficulty_Change(Type, Amount)
	if not global.dyworld.game_stats.difficulty then global.dyworld.game_stats.difficulty = 1 end
	if not global.dyworld.game_stats.players then global.dyworld.game_stats.players = 1 end
	if Type == "+" then
		global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (Amount * global.dyworld.game_stats.players)
	elseif Type == "-" then
		global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (Amount * global.dyworld.game_stats.players)
	end
	if global.dyworld.game_stats.difficulty >= 1000000 then
		global.dyworld.game_stats.difficulty = 1000000
	elseif global.dyworld.game_stats.difficulty <= 1 then
		global.dyworld.game_stats.difficulty = 1
	end
end

CE_Type_Killed = {
	-- Additions --
	["turret"] = {"+", 5},
	["unit-spawner"] = {"+", 100},
	
	-- Removal --
	["inserter"] = {"-", 5},
	["assembling-machine"] = {"-", 25},
	["furnace"] = {"-", 15},
	["radar"] = {"-", 750},
	["character"] = {"-", 20000},
	["transport-belt"] = {"-", 2.5},
	["splitter"] = {"-", 2.5},
	["underground-belt"] = {"-", 2.5},
	["loader"] = {"-", 2.5},
	["loader-1x1"] = {"-", 2.5},
	["boiler"] = {"-", 35},
	["container"] = {"-", 10},
	["storage-tank"] = {"-", 10},
	["logistic-container"] = {"-", 10},
	["electric-pole"] = {"-", 7.5},
	["generator"] = {"-", 27.5},
	["offshore-pump"] = {"-", 13.3},
	["pump"] = {"-", 13.3},
	["pipe"] = {"-", 2.5},
	["pipe-to-ground"] = {"-", 2.5},
	["lamp"] = {"-", 75},
	["wall"] = {"-", 25},
	["gate"] = {"-", 45},
	["lab"] = {"-", 500},
	["car"] = {"-", 130},
	["train-stop"] = {"-", 14.6},
	["rail-signal"] = {"-", 20},
	["rail-chain-signal"] = {"-", 20},
	["solar-panel"] = {"-", 1},
	["accumulator"] = {"-", 60},
	["player-port"] = {"-", 50000},
	["rocket-silo"] = {"-", 25000},
	["roboport"] = {"-", 100},
	["beacon"] = {"-", 50},
	["reactor"] = {"-", 500},
	["heat-pipe"] = {"-", 20},
	["spider-vehicle"] = {"-", 400},
	["ammo-turret"] = {"-", 500},
	["electric-turret"] = {"-", 750},
	["artillery-turret"] = {"-", 2500},
	["fluid-turret"] = {"-", 1250},
}

CE_Unit_Killed = {
	-- Base Units --
	["small-biter"] = {"+", 0.1},
	["medium-biter"] = {"+", 0.25},
	["big-biter"] = {"+", 0.5},
	["behemoth-biter"] = {"+", 1},
	["small-spitter"] = {"+", 0.15},
	["medium-spitter"] = {"+", 0.375},
	["big-spitter"] = {"+", 0.75},
	["behemoth-spitter"] = {"+", 1.5},
	-- DyWorld Units --
	["dyworld-unit-1-1"] = {"+", 1.0},
	["dyworld-unit-1-2"] = {"+", 2.0},
	["dyworld-unit-1-3"] = {"+", 3.0},
	["dyworld-unit-1-4"] = {"+", 4.0},
	["dyworld-unit-1-5"] = {"+", 5.0},
	["dyworld-unit-2-1"] = {"+", 2.5},
	["dyworld-unit-2-2"] = {"+", 5.0},
	["dyworld-unit-2-3"] = {"+", 7.5},
	["dyworld-unit-2-4"] = {"+", 10.0},
	["dyworld-unit-2-5"] = {"+", 12.5},
	["dyworld-unit-3-1"] = {"+", 5.0},
	["dyworld-unit-3-2"] = {"+", 10.0},
	["dyworld-unit-3-3"] = {"+", 15.0},
	["dyworld-unit-3-4"] = {"+", 20.0},
	["dyworld-unit-3-5"] = {"+", 25.0},
	["dyworld-unit-4-1"] = {"+", 1},
	["dyworld-unit-4-2"] = {"+", 1},
	["dyworld-unit-4-3"] = {"+", 1},
	["dyworld-unit-4-4"] = {"+", 1},
	["dyworld-unit-4-5"] = {"+", 1},
	["dyworld-unit-5-1"] = {"+", 1},
	["dyworld-unit-5-2"] = {"+", 1},
	["dyworld-unit-5-3"] = {"+", 1},
	["dyworld-unit-5-4"] = {"+", 1},
	["dyworld-unit-5-5"] = {"+", 1},
	["dyworld-unit-6-1"] = {"+", 1},
	["dyworld-unit-6-2"] = {"+", 1},
	["dyworld-unit-6-3"] = {"+", 1},
	["dyworld-unit-6-4"] = {"+", 1},
	["dyworld-unit-6-5"] = {"+", 1},
	["dyworld-unit-7-1"] = {"+", 1},
	["dyworld-unit-7-2"] = {"+", 1},
	["dyworld-unit-7-3"] = {"+", 1},
	["dyworld-unit-7-4"] = {"+", 1},
	["dyworld-unit-7-5"] = {"+", 1},
	["dyworld-unit-8-1"] = {"+", 1},
	["dyworld-unit-8-2"] = {"+", 1},
	["dyworld-unit-8-3"] = {"+", 1},
	["dyworld-unit-8-4"] = {"+", 1},
	["dyworld-unit-8-5"] = {"+", 1},
	["dyworld-unit-9-1"] = {"+", 1},
	["dyworld-unit-9-2"] = {"+", 1},
	["dyworld-unit-9-3"] = {"+", 1},
	["dyworld-unit-9-4"] = {"+", 1},
	["dyworld-unit-9-5"] = {"+", 1},
	["dyworld-unit-10-1"] = {"+", 1},
	["dyworld-unit-10-2"] = {"+", 1},
	["dyworld-unit-10-3"] = {"+", 1},
	["dyworld-unit-10-4"] = {"+", 1},
	["dyworld-unit-10-5"] = {"+", 1},
	
}