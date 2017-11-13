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
		local results = {"automation", "automation-2", "automation-3", "turrets", "laser-turrets", "logistics", "logistics-2", "logistics-3", "military", "military-2", "military-3", "military-4", "steel-processing"}
			for k,v in pairs(results) do
				game.players[1].force.technologies[v].researched = false
				game.players[1].force.technologies[v].researched = true
			end
		global.dyworld.Version = "0.4.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
end