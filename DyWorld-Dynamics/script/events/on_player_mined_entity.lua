


function Event_on_player_mined_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local position = event.entity.position
	local type = event.entity.type
	
	----- Building Placement -----
	if Entity_Check(type) then
		for k,v in pairs(global.dyworld.game_stats.building_locations) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations, k)
				debug("removed building at: "..position.x..", "..position.y)
				break
			end
		end
	end
end