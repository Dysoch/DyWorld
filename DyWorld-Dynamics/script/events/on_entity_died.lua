


function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local type_killed = event.entity.type 
	local name = event.entity.name
	local position = event.entity.position
	if killer and killer.valid and killer.type == "character" then
	--if killer.type == "character" then
		local id = killer.player.index
		
		----- Global counter -----
		if not global.dyworld.game_stats.killed_names[name] then
			global.dyworld.game_stats.killed_names[name] = 1
		else
			global.dyworld.game_stats.killed_names[name] = global.dyworld.game_stats.killed_names[name] + 1
		end
	
		----- Personal counter -----
		global.dyworld.players[id].killed = global.dyworld.players[id].killed + 1
	global.dyworld.game_stats.killed_amount = global.dyworld.game_stats.killed_amount + 1
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
	
	----- Story Objective Check -----
	Story_Objectives("died", event)
end