


function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local type_killed = event.entity.type 
	local name = event.entity.name
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
end