

function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local entity_killed = event.entity
	local type_killed = entity_killed.type
	local name = event.entity.name
	local position = event.entity.position
	if killer and killer.valid and killer.type == "character" then
	    if killer.player and killer.player.index then
            local id = killer.player.index
            ----- Personal counter -----
            global.dyworld.players[id].killed = global.dyworld.players[id].killed + 1
        end
	end
	
	----- Difficulty -----
	local custom_difficulty_change_amount = 0
	if type_killed == "unit" then
		if CE_Unit_Killed[name] then
			custom_difficulty_change_amount = CE_Unit_Killed[name][1]
		end
	elseif CE_Type_Killed[type_killed] then
		-- BUG?: currently this allows a player to kill their buildings to lower difficulty
		custom_difficulty_change_amount = CE_Type_Killed[type_killed][1]
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
	
	if name == "dy-wave-spawner" then
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.wave_spawners then global.dyworld.game_stats.wave_spawners = {} end
		if not global.dyworld.game_stats.wave_spawners[surface] then global.dyworld.game_stats.wave_spawners[surface] = {spawners_amount = 0, spawners_loc = {}} end
		if not global.dyworld.game_stats.wave_spawners.max_per_surface then global.dyworld.game_stats.wave_spawners.max_per_surface = 10 end
		
		DyWorld_Base_Attack(surface)
		game.surfaces[surface].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-250,250)),(math.random(-250,250))}, force = game.forces.enemy, speed = 2.5, target = {position.x, position.y}}
		
		for k,v in pairs(global.dyworld.game_stats.wave_spawners[surface].spawners_loc) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.wave_spawners[surface].spawners_loc, k)
				global.dyworld.game_stats.wave_spawners[surface].spawners_amount = global.dyworld.game_stats.wave_spawners[surface].spawners_amount - 1
				break
			end
		end
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("died", event)
			Story_Side_Objectives("kill", event, 1)
		end
	end

	_Event_on_force_removed_entity(event, force, entity_killed, custom_difficulty_change_amount)
end