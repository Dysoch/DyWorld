require "script/startup"

function Migrate_To_Next_Version()
	if global.dyworld.Version == "0.7.82" then
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done == 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
		--@todo add migration message
		--@body A message that says to start over with a new game since DyWorld changed a lot
	end
	--[[if global.dyworld.Version == "0.7.5" or global.dyworld.Version == "0.7.81" then
			remote.call("silo_script", "set_show_launched_without_satellite", false)
			remote.call("silo_script", "set_finish_on_launch", false)
			remote.call("silo_script", "remove_tracked_item", "satellite")
			remote.call("silo_script", "add_tracked_item", "dyworld-dtx-001-spaceship")
			-- This part below is done every migration!
			global.dyworld.Max_Research = Research_Calc(),
			global.dyworld.Research_Done = 0
			global.stats.research = 0
			global.dyworld.Migration_Check = true
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
			global.dyworld.Migration_Check = false
		global.dyworld.Version = "0.8.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end]]
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