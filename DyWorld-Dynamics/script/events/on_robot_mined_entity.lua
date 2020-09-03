


function Event_on_robot_mined_entity(event)
	local position = event.entity.position
	
	----- Building Placement -----
	for k,v in pairs(global.dyworld.game_stats.building_locations) do
		if (position.x == v.posx and position.y == v.posy) then
			table.remove(global.dyworld.game_stats.building_locations, k)
			debug("removed building at: "..position.x..", "..position.y)
			break
		end
	end
	
end