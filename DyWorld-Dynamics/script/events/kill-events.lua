


function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local type_killed = event.entity.type
	local name = event.entity.name
	local position = event.entity.position
	if killer and killer.valid and killer.type == "character" then
	    if killer.player and killer.player.index then
            local id = killer.player.index
            ----- Personal counter -----
            global.dyworld.players[id].killed = global.dyworld.players[id].killed + 1
        end
	end
	
	----- Global counter -----
	if not global.dyworld.game_stats.killed_names[name] then
		global.dyworld.game_stats.killed_names[name] = 1
	else
		global.dyworld.game_stats.killed_names[name] = global.dyworld.game_stats.killed_names[name] + 1
	end
	global.dyworld.game_stats.killed_amount = global.dyworld.game_stats.killed_amount + 1
	
	if not global.dyworld.game_stats.killed then global.dyworld.game_stats.killed = {} end
	if not global.dyworld.game_stats.killed[name] then
		global.dyworld.game_stats.killed[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type_killed) then
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		for k,v in pairs(global.dyworld.game_stats.building_locations[surface]) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations[surface], k)
				break
			end
		end
	end
	
	if name == "dy-wave-spawner" then
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.wave_spawners then global.dyworld.game_stats.wave_spawners = {} end
		if not global.dyworld.game_stats.wave_spawners[surface_name] then global.dyworld.game_stats.wave_spawners[surface_name] = {spawners_amount = 0, spawners_loc = {}} end
		if not global.dyworld.game_stats.wave_spawners.max_per_surface then global.dyworld.game_stats.wave_spawners.max_per_surface = 10 end
		for k,v in pairs(global.dyworld.game_stats.wave_spawners[surface].spawners_loc) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.wave_spawners[surface].spawners_loc, k)
				global.dyworld.game_stats.wave_spawners[surface].spawners_amount = global.dyworld.game_stats.wave_spawners[surface].spawners_amount - 1
				break
			end
		end
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.impure and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs) do
                            local surface = event.entity.surface.name
                            if (position.x == v.PosX and position.y == v.PosY and surface == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                elseif Dy_Find_Str(name, "-pure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.pure and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs) do
                            local surface = event.entity.surface.name
                            if (position.x == v.PosX and position.y == v.PosY and surface == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                end
            end
        end
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("died", event)
			Story_Side_Objectives("kill", event, 1)
		end
		
		if (type_killed == "radar") then
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars - 1
			if global.dyworld.game_stats.radars <= 0 then
				global.dyworld.game_stats.radars = 0 
				for k,v in pairs(global.dyworld.players) do
					if game.players[v.id].minimap_enabled then
						game.players[v.id].minimap_enabled = false
					end
				end
			end
		end
		if (type_killed == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters - 1
			if global.dyworld.game_stats.inserters <= 0 then
				global.dyworld.game_stats.inserters = 0 
			end
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		if (type_killed == "lab") then
			if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs - 1
			if global.dyworld.game_stats.labs <= 0 then
				global.dyworld.game_stats.labs = 0 
			end
		end
		
		----- Difficulty -----
		if (name == "burner-radar") then
			if global.dyworld.game_stats.difficulty > ((10 * global.dyworld.game_stats.players) + 1) then
				global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (10 * global.dyworld.game_stats.players)
			else
				global.dyworld.game_stats.difficulty = 1
			end
		end
		if (name == "radar-1") then
			if global.dyworld.game_stats.difficulty > ((100 * global.dyworld.game_stats.players) + 1) then
				global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (100 * global.dyworld.game_stats.players)
			else
				global.dyworld.game_stats.difficulty = 1
			end
		end
		if (name == "radar-2") then
			if global.dyworld.game_stats.difficulty > ((250 * global.dyworld.game_stats.players) + 1) then
				global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (250 * global.dyworld.game_stats.players)
			else
				global.dyworld.game_stats.difficulty = 1
			end
		end
		if (name == "radar-3") then
			if global.dyworld.game_stats.difficulty > ((500 * global.dyworld.game_stats.players) + 1) then
				global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (500 * global.dyworld.game_stats.players)
			else
				global.dyworld.game_stats.difficulty = 1
			end
		end
		if (name == "radar-4") then
			if global.dyworld.game_stats.difficulty > ((1000 * global.dyworld.game_stats.players) + 1) then
				global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (1000 * global.dyworld.game_stats.players)
			else
				global.dyworld.game_stats.difficulty = 1
			end
		end
	end
end