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
		PlayerPrint({"new-dyworld-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.2.0" then
		global.dyworld.Version = "0.2.1" 
		PlayerPrint({"new-dyworld-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.2.1" then
		for k,v in pairs(global.players) do
			v.Level = 0
			v.XP = 0
			v.XP_LevelUp = 100
			Stats_GUI_Freq = 1
		end
		global.dyworld.XP = 0
		global.dyworld.Level = 0
		global.dyworld.Version = "0.3.0" 
		PlayerPrint({"new-dyworld-version", (global.dyworld.Version)})
	end
end