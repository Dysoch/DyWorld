


function Event_on_player_used_capsule(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item.name
	local Time = global.dyworld.game_stats.time_stamp
	local P_Water = global.dyworld.players[id].water
	local P_Water_Max = global.dyworld.players[id].water_max
	local P_Food = global.dyworld.players[id].food
	local P_Food_Max = global.dyworld.players[id].food_max
	
	if Food_Values[name] then
		if Food_Values[name].Water then
			Water_Add(id, Food_Values[name].Water)
		end
		if Food_Values[name].Food then
			Food_Add(id, Food_Values[name].Food)
		end
	end
	
	----- Personal counter -----
	if not global.dyworld.players[id].capsules then global.dyworld.players[id].capsules = 0 end
	global.dyworld.players[id].capsules = global.dyworld.players[id].capsules + 1
	
	if not global.dyworld.players[id].implants then global.dyworld.players[id].implants = {} end
	if not global.dyworld.players[id].implants_used then global.dyworld.players[id].implants_used = 0 end
	if Implants[name] then
		global.dyworld.players[id].implants_used = global.dyworld.players[id].implants_used + 1
		Implant_Check(id, name)
	end
end

function Event_on_built_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type
	local Time = global.dyworld.game_stats.time_stamp
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Personal counter -----
	global.dyworld.players[id].build = global.dyworld.players[id].build + 1
	global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.created_entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-player", event)
			Story_Side_Objectives("build", event, 1)
		end
		
		
		if (type == "radar") then
			if (name == "burner-radar") then
				game.forces.player.ghost_time_to_live = (60*60*60*24)
				game.forces.player.deconstruction_time_to_live = (60*60*60*24)
			end
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for k,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					game.players[v.id].minimap_enabled = true
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		
		-- Reenable Research
		if (type == "lab" and player.force.research_enabled == false) then
			for _,player in pairs(game.players) do
				player.force.enable_research()
				DyLog(Time..": Research Unlocked")
				game.forces.player.ghost_time_to_live = (60*60*60*1)
				game.forces.player.deconstruction_time_to_live = (60*60*60*1)
			end
		end
		
		-- Increase Difficulty 
		if (global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + 0.0001
		end
		if (name == "burner-radar" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (10 * global.dyworld.game_stats.players)
		end
		if (name == "radar-1" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (100 * global.dyworld.game_stats.players)
		end
		if (name == "radar-2" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (250 * global.dyworld.game_stats.players)
		end
		if (name == "radar-3" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (500 * global.dyworld.game_stats.players)
		end
		if (name == "radar-4" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (1000 * global.dyworld.game_stats.players)
		end
	end
end

function Event_on_player_built_tile(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.tile.name
	local Time = global.dyworld.game_stats.time_stamp
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Personal counter -----
	global.dyworld.players[id].build = global.dyworld.players[id].build + 1
	global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
	
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-tile", event)
			Story_Side_Objectives("build-tile", event, 1)
		end
	end
end

function Event_on_robot_built_entity(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local surface = event.created_entity.surface.name
	local type = event.created_entity.type
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.created_entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	if global.dyworld_story then
		-- Reenable Minimap
		if (type == "radar") then
			if (name == "burner-radar") then
				game.forces.player.ghost_time_to_live = (60*60*60*24)
				game.forces.player.deconstruction_time_to_live = (60*60*60*24)
			end
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for k,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					game.players[v.id].minimap_enabled = true
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		
		-- Reenable Research
		if (type == "lab") then
			for _,player in pairs(game.players) do
				if player.force.research_enabled == false then
					player.force.enable_research()
					DyLog(Time..": Research Unlocked")
					game.forces.player.ghost_time_to_live = (60*60*60*1)
					game.forces.player.deconstruction_time_to_live = (60*60*60*1)
				end
			end
		end
		
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-robot", event)
			Story_Side_Objectives("build", event, 1)
		end
		
		-- Increase Difficulty 
		if (global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + 0.00005
		end
		if (name == "burner-radar" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (5 * global.dyworld.game_stats.players)
		end
		if (name == "radar-1" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (50 * global.dyworld.game_stats.players)
		end
		if (name == "radar-2" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (125 * global.dyworld.game_stats.players)
		end
		if (name == "radar-3" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (250 * global.dyworld.game_stats.players)
		end
		if (name == "radar-4" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (500 * global.dyworld.game_stats.players)
		end
	end
end

function Event_on_robot_built_tile(event)
	local name = event.tile.name
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-tile", event)
			Story_Side_Objectives("build-tile", event, 1)
		end
	end
end

function Event_script_raised_built(event)
	script.on_event(remote.call("space-exploration", "get_on_player_respawned_event"), Event_on_player_respawned_script)
	if global.dyworld_story and not global.dyworld.game_stats.story_pause then
		Story_Objectives("scripted-build", event)
		Story_Side_Objectives("build-2", event, 1)
	end
end

function Event_built_test(event)
	--[[if global.dyworld_story then
		Story_Objectives("scripted-build", event)
		Story_Side_Objectives("build-2", event, 1)
	end]]
	PlayerPrint(event.entity.name)
end

function Event_script_raised_revive(event)
	local name = event.entity.name
	local position = event.entity.position
	local type = event.entity.type
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
	end
	
	if global.dyworld_story then

		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("scripted-build", event)
			Story_Side_Objectives("build-2", event, 1)
		end

		-- Reenable Minimap
		if (type == "radar") then
			if (name == "burner-radar") then
				game.forces.player.ghost_time_to_live = (60*60*60*24)
				game.forces.player.deconstruction_time_to_live = (60*60*60*24)
			end
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for k,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					game.players[v.id].minimap_enabled = true
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		
		-- Reenable Research
		if (type == "lab") then
			for _,player in pairs(game.players) do
				if player.force.research_enabled == false then
					player.force.enable_research()
					DyLog(Time..": Research Unlocked")
					game.forces.player.ghost_time_to_live = (60*60*60*1)
					game.forces.player.deconstruction_time_to_live = (60*60*60*1)
				end
			end
		end
		
		-- Increase Difficulty 
		if (global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + 0.0001
		end
		if (name == "burner-radar" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (10 * global.dyworld.game_stats.players)
		end
		if (name == "radar-1" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (100 * global.dyworld.game_stats.players)
		end
		if (name == "radar-2" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (250 * global.dyworld.game_stats.players)
		end
		if (name == "radar-3" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (500 * global.dyworld.game_stats.players)
		end
		if (name == "radar-4" and global.dyworld.game_stats.difficulty < 10000) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (1000 * global.dyworld.game_stats.players)
		end
	end
end