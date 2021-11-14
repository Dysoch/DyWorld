


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
		if Food_Values[name].Radiation then
			Add_Radiation(id, Food_Values[name].Radiation)
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
	if Entity_Check(type) and name ~= "entity-ghost" and name ~= "landfill" then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.created_entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end

	----- Ghost Building -----
	if name == "entity-ghost" then
		if not global.dyworld.game_stats.ghosts then global.dyworld.game_stats.ghosts = 0 end
		global.dyworld.game_stats.ghosts = global.dyworld.game_stats.ghosts + 1
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
		if not global.dyworld.game_stats.space_mining.interfaces then global.dyworld.game_stats.space_mining.interfaces = {} end
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.impure then global.dyworld.game_stats.space_mining.interfaces.impure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts + 1
                    debug("Built: "..Metal_Name.." interface (Impure)")
                    local surface = event.created_entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, BuildingTable)
                elseif Dy_Find_Str(name, "-pure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.pure then global.dyworld.game_stats.space_mining.interfaces.pure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts + 1
                    debug("Built: "..Metal_Name.." interface (Pure)")
                    local surface = event.created_entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, BuildingTable)
                end
            end
        end
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-player", event)
			Story_Side_Objectives("build", event, 1)
		end
		
		
		if (type == "radar") then
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for k,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					game.players[v.id].minimap_enabled = true
				end
			end
			game.forces.player.zoom_to_world_enabled = true
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		
		-- Reenable Research
		if (type == "lab") then
			if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs + 1
			if player.force.research_enabled == false then
				for _,player in pairs(game.players) do
					player.force.enable_research()
					DyLog(Time..": Research Unlocked")
				end
			end
		end
		
		-- Increase Difficulty 
		DyWorld_Custom_Difficulty_Change("+", 0.5)
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
		DyWorld_Custom_Difficulty_Change("+", 0.025)
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
		global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) and name ~= "entity-ghost" and name ~= "landfill" then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.created_entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
		if not global.dyworld.game_stats.space_mining.interfaces then global.dyworld.game_stats.space_mining.interfaces = {} end
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.impure then global.dyworld.game_stats.space_mining.interfaces.impure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts + 1
                    local surface = event.created_entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, BuildingTable)
                elseif Dy_Find_Str(name, "-pure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.pure then global.dyworld.game_stats.space_mining.interfaces.pure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts + 1
                    local surface = event.created_entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, BuildingTable)
                end
            end
        end
	end
	
	if global.dyworld_story then
		-- Reenable Minimap
		if (type == "radar") then
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for k,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					game.players[v.id].minimap_enabled = true
				end
			end
			game.forces.player.zoom_to_world_enabled = true
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		
		-- Reenable Research
		if (type == "lab") then
			if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs + 1
			for _,player in pairs(game.players) do
				if player.force.research_enabled == false then
					player.force.enable_research()
					DyLog(Time..": Research Unlocked")
				end
			end
		end
		
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-robot", event)
			Story_Side_Objectives("build", event, 1)
		end
		
		-- Increase Difficulty 
		DyWorld_Custom_Difficulty_Change("+", 0.35)
	end
end

function Event_on_robot_built_tile(event)
	local name = event.tile.name
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
		global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
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
		DyWorld_Custom_Difficulty_Change("+", 0.05)
	end
end

function Event_script_raised_built(event)
	--script.on_event(remote.call("space-exploration", "get_on_player_respawned_event"), Event_on_player_respawned_script)
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
		global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) and name ~= "entity-ghost" and name ~= "landfill" then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
		if not global.dyworld.game_stats.space_mining.interfaces then global.dyworld.game_stats.space_mining.interfaces = {} end
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.impure then global.dyworld.game_stats.space_mining.interfaces.impure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts + 1
                    debug("Built: "..Metal_Name.." interface (Impure)")
                    local surface = event.entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, BuildingTable)
                elseif Dy_Find_Str(name, "-pure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.pure then global.dyworld.game_stats.space_mining.interfaces.pure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts + 1
                    debug("Built: "..Metal_Name.." interface (Pure)")
                    local surface = event.entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, BuildingTable)
                end
            end
        end
	end

	
	if global.dyworld_story then

		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("scripted-build", event)
			Story_Side_Objectives("build-2", event, 1)
		end

		-- Reenable Minimap
		if (type == "radar") then
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for k,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					game.players[v.id].minimap_enabled = true
				end
			end
			game.forces.player.zoom_to_world_enabled = true
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		
		-- Reenable Research
		if (type == "lab") then
			if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs + 1
			for _,player in pairs(game.players) do
				if player.force.research_enabled == false then
					player.force.enable_research()
					DyLog(Time..": Research Unlocked")
				end
			end
		end
		
		-- Increase Difficulty 
		DyWorld_Custom_Difficulty_Change("+", 0.5)
	end
end