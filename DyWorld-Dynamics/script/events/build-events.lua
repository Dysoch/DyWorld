


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
	
	----- Personal counter -----
	global.dyworld.players[id].build = global.dyworld.players[id].build + 1
	global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		table.insert(global.dyworld.game_stats.building_locations, BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("building-player", event)
		
		-- Reenable Minimap
		if (type == "radar") then
			if (player.minimap_enabled == false and name == "burner-radar") then
				for _,player in pairs(game.players) do
					player.minimap_enabled = true
					DyLog(Time..": Minimap Unlocked")
					game.forces.player.ghost_time_to_live = (60*60*60*24)
					game.forces.player.deconstruction_time_to_live = (60*60*60*24)
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
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

function Event_on_robot_built_entity(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		table.insert(global.dyworld.game_stats.building_locations, BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	if global.dyworld_story then
		-- Reenable Minimap
		if (type == "radar") then
			for _,player in pairs(game.players) do
				if (player.minimap_enabled == false and name == "burner-radar") then
					player.minimap_enabled = true
					DyLog(Time..": Minimap Unlocked")
					game.forces.player.ghost_time_to_live = (60*60*60*24)
					game.forces.player.deconstruction_time_to_live = (60*60*60*24)
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
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
		Story_Objectives("building-robot", event)
		
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

function Event_script_raised_built(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		table.insert(global.dyworld.game_stats.building_locations, BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	if global.dyworld_story then
		-- Reenable Minimap
		if (type == "radar") then
			for _,player in pairs(game.players) do
				if (player.minimap_enabled == false and name == "burner-radar") then
					player.minimap_enabled = true
					DyLog(Time..": Minimap Unlocked")
					game.forces.player.ghost_time_to_live = (60*60*60*24)
					game.forces.player.deconstruction_time_to_live = (60*60*60*24)
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
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
		Story_Objectives("building-robot", event)
		
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

function Event_script_raised_revive(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.entity.name
	local position = event.entity.position
	local type = event.entity.type
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		table.insert(global.dyworld.game_stats.building_locations, BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	if global.dyworld_story then
		-- Reenable Minimap
		if (type == "radar") then
			for _,player in pairs(game.players) do
				if (player.minimap_enabled == false and name == "burner-radar") then
					player.minimap_enabled = true
					DyLog(Time..": Minimap Unlocked")
					game.forces.player.ghost_time_to_live = (60*60*60*24)
					game.forces.player.deconstruction_time_to_live = (60*60*60*24)
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
				game.forces.player.ghost_time_to_live = (60*60*60*48)
				game.forces.player.deconstruction_time_to_live = (60*60*60*48)
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_3 = true
				game.forces.player.ghost_time_to_live = (60*60*60*240)
				game.forces.player.deconstruction_time_to_live = (60*60*60*240)
			end
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
		Story_Objectives("scripted-build", event)
		
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