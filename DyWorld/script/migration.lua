module("migration", package.seeall)
require "script/startup"

function Migrate_To_Next_Version()
	if not global.dyworld.Version or global.dyworld.Version == "0.5.1" then
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
				if v.name == "toolbelt" or v.name == "toolbelt-2" or v.name == "toolbelt-3" then
					-- do nothing to make sure the quickbelts stay with items
				else
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		if not global.dyworld.Guide then
			global.dyworld.Guide = {} 
		end
		if not global.dyworld.Warfare then 
			global.dyworld.Warfare = {} 
			global.dyworld.Warfare.Location = {} 
			global.dyworld.Max_Research = startup.Research_Calc()
		end
		global.dyworld.Version = "0.6.2" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.6.2" then
			for k,v in pairs(game.players[1].force.technologies) do
				if v.name == "toolbelt" or v.name == "toolbelt-2" or v.name == "toolbelt-3" then
					-- do nothing to make sure the quickbelts stay with items
				else
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.6.3" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.6.3" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.6.4" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.6.4" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
			global.dyworld.RPG_Mode = "normal"
		global.dyworld.Version = "0.6.5" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.6.5" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.7.0" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.0" then
		global.dyworld.Version = "0.7.1" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.1" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.7.2" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.2" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.7.3" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.3" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.7.4" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.4" then
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.7.5" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.5" then
			global.dyworld.Research_Done = 0
			for k,v in pairs(game.players[1].force.technologies) do
				if Check_Tech(v.name) then
					if v.researched then
						v.researched = false
						v.researched = true
					end
				end
			end
		global.dyworld.Version = "0.7.80" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
	end
	if global.dyworld.Version == "0.7.80" then
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
		global.dyworld.Version = "0.7.81" 
		PlayerPrint({"dyworld.new-version", (global.dyworld.Version)})
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