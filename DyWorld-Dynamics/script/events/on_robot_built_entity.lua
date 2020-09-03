


function Event_on_robot_built_entity(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		table.insert(global.dyworld.game_stats.building_locations, BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
end