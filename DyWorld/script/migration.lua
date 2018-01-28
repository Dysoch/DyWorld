module("migration", package.seeall)
require "script/startup"

function Migrate_To_Next_Version()
	if not global.dyworld.Version or global.dyworld.Version == "0.1.1" then
		for k,v in pairs(global.players) do
			v.Alive = true
		end
		global.dyworld.Research_Level_String = global.dyworld.ResearchLevel
		if global.dyworld.Research_Level_String == "Primitive" then
			global.dyworld.Research_Level_Var = 1
		elseif global.dyworld.Research_Level_String == "Basic" then
			global.dyworld.Research_Level_Var = 2
		elseif global.dyworld.Research_Level_String == "Intermediate" then
			global.dyworld.Research_Level_Var = 3
		elseif global.dyworld.Research_Level_String == "Enhanced" then
			global.dyworld.Research_Level_Var = 4
		elseif global.dyworld.Research_Level_String == "Advanced" then
			global.dyworld.Research_Level_Var = 5
		elseif global.dyworld.Research_Level_String == "Godlike" then
			global.dyworld.Research_Level_Var = 6
		end
		global.dyworld.Version = "0.2.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.2.0" then
		global.dyworld.Version = "0.2.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.2.1" then
		for k,v in pairs(global.players) do
			v.Level = 0
			v.XP = 0
			v.XP_LevelUp = 100
			v.Food = 100
			v.Food_Max = 100
			v.Food_Use = 1
			v.Water = 100
			v.Water_Max = 100
			v.Water_Use = 1
			v.PosX = 0
			v.PosY = 0
			v.State_Distance_GUI = false
			v.Ship_1_Visited = false
			v.Ship_2_Visited = false
			v.Ship_3_Visited = false
			v.Playing = true
		end
		global.dyworld.XP = 0
		global.dyworld.Level = 0
		global.dyworld.Generation_Ship_1_PosX = 0
		global.dyworld.Generation_Ship_1_PosY = 0
		global.dyworld.Generation_Ship_2_PosX = 0
		global.dyworld.Generation_Ship_2_PosY = 0
		global.dyworld.Generation_Ship_3_PosX = 0
		global.dyworld.Generation_Ship_3_PosY = 0
		global.dyworld.Version = "0.3.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.3.0" then
		for k,v in pairs(global.players) do
			v.Level = v.Level + 1
		end
		global.dyworld.Version = "0.3.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.3.1" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
		global.dyworld.Version = "0.4.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.4.0" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
		global.dyworld.Version = "0.4.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.4.1" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
		global.dyworld.Version = "0.4.2" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.4.2" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
			game.players[1].surface.regenerate_entity("tungsten-ore")
			game.players[1].surface.regenerate_entity("cadmium-ore")
		global.dyworld.Version = "0.5.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.5.0" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
			game.players[1].surface.regenerate_entity("zinc-ore")
			game.players[1].surface.regenerate_entity("nickel-ore")
			game.players[1].surface.regenerate_entity("aluminium-ore")
		global.dyworld.Version = "0.5.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.5.1" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
			game.players[1].surface.regenerate_entity("zinc-ore")
			game.players[1].surface.regenerate_entity("nickel-ore")
			game.players[1].surface.regenerate_entity("aluminium-ore")
		global.dyworld.Version = "0.6.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.6.0" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
		global.dyworld.Version = "0.6.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.6.1" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.researched then
					v.researched = false
					v.researched = true
				end
			end
		global.dyworld.Version = "0.6.2" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
end

function Migrate_Debug()
	for k,v in pairs(game.players[1].force.technologies) do
		if v.researched then
		v.researched = false
		v.researched = true
		end
	end
end