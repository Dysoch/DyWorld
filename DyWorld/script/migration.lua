require "script/startup"

function Migrate_To_Next_Version()
	if global.dyworld.Version == "0.7.80" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint("Please start over! DyWorld has changed a lot since version 0.7.x, and certain things are no longer working. No migration will happen from 0.7.x to 0.8, since that is to much edits that might corrupt savegame. Please start a new game!")
	end
	if global.dyworld.Version == "0.8.0" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.8.1" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.2" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.8.2" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.3" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.8.3" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.4" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.8.4" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.5" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.8.5" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			if game.players and game.players[1] then
				for k,v in pairs(game.players[1].force.technologies) do
					if Check_Tech(v.name) then
						if v.researched then
							v.researched = false
							v.researched = true
						end
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.6" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.8.6" or global.dyworld.Version == "0.8.90" then
		if remote.interfaces["silo_script"] then
			remote.call("silo_script", "set_no_victory", true)
			local tracked_items = remote.call("silo_script", "get_tracked_items")
			if not tracked_items["automation-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "automation-science-pack")
			end
			if not tracked_items["logistic-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "logistic-science-pack")
			end
			if not tracked_items["chemical-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "chemical-science-pack")
			end
			if not tracked_items["military-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "military-science-pack")
			end
			if not tracked_items["production-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "production-science-pack")
			end
			if not tracked_items["utility-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "utility-science-pack")
			end
			if not tracked_items["space-science-pack"] then
				remote.call("silo_script", "add_tracked_item", "space-science-pack")
			end
		end
		for k,v in pairs(global.players) do	
			v.State_Skills_GUI = false
			v.Skill_Points = 0
			v.Skill_Points_Gain = 
			{
				Killed = 0,
				Killed_Gain = 100,
				Scanned = 0,
				Scanned_Gain = 150,
			}
			v.Skills = 
			{
				["dyworld-running-skill"] = {CD_On = false, CD_Time = 600, CD = 0, Name = "dyworld-running-skill", SP_Usage = 50, Active_Time = 60, Active = false, Active_Time_Left = 0, Level = 5},
				["dyworld-chart-skill"] = {CD_On = false, CD_Time = 3600, CD = 0, Name = "dyworld-chart-skill", SP_Usage = 250, Strength = 500, Active = false, Level = 15},
			}
			v.physical_mod = {
				strength = 0,
				endurance = 0,
				speed = 0,
				creations = 0,
				implants = 0,
			}
			v.mystical_mod = { 
				spirit = 0,
				intelligence = 0,
				wisdom = 0,
				guile = 0,
				knowledge = 0,
			}
		end
		-- This part below is done every migration!
		global.dyworld.Max_Research = Research_Calc(),
		global.dyworld.Research_Done == 0
		global.stats.research = 0
		global.dyworld.Migration_Check = true
		if game.players and game.players[1] then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		end
		global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.9.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.9.0" then
		-- This part below is done every migration!
		global.dyworld.Max_Research = Research_Calc(),
		global.dyworld.Research_Done == 0
		global.stats.research = 0
		global.dyworld.Migration_Check = true
		if game.players and game.players[1] then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		end
		global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.9.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
	if global.dyworld.Version == "0.9.1" then
		for k,v in pairs(global.players) do	
			v.killed = {}
		end
		-- This part below is done every migration!
		global.dyworld.Max_Research = Research_Calc(),
		global.dyworld.Research_Done == 0
		global.stats.research = 0
		global.dyworld.Migration_Check = true
		if game.players and game.players[1] then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		end
		global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.9.2" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		PlayerPrint({"dyworld.migrate-1"})
		PlayerPrint({"dyworld.migrate-2"})
	end
end

function Migrate_Debug()
	for k,v in pairs(game.players[1].force.technologies) do
		if Check_Tech(v.name) then
			if v.researched then
				v.researched = false
				v.researched = true
			end
		end
	end
end

function Check_Tech(TECH)
	if TECH == "character-logistic-slots-1" then
		return false
	elseif TECH == "character-logistic-slots-2" then
		return false
	elseif TECH == "character-logistic-slots-3" then
		return false
	elseif TECH == "character-logistic-slots-4" then
		return false
	elseif TECH == "character-logistic-slots-5" then
		return false
	elseif TECH == "character-logistic-slots-6" then
		return false
	elseif TECH == "auto-character-logistic-trash-slots" then
		return false
	else
		return true
	end
end