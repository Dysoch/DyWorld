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
	if TECH == "toolbelt" then
		return false
	elseif TECH == "toolbelt-2" then
		return false
	elseif TECH == "toolbelt-3" then
		return false
	elseif TECH == "character-logistic-slots-1" then
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