


function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local type_killed = event.entity.type 
	local name = event.entity.name
	local position = event.entity.position
	if killer and killer.valid and killer.type == "character" then
	--if killer.type == "character" then
		local id = killer.player.index
		
		----- Personal counter -----
		global.dyworld.players[id].killed = global.dyworld.players[id].killed + 1
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
		for k,v in pairs(global.dyworld.game_stats.building_locations) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations, k)
				--debug("removed building at: "..position.x..", "..position.y)
				break
			end
		end
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("died", event)
		
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