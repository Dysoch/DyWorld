-- work with directions
local opposite = {
	[defines.direction.north] = defines.direction.south,
	[defines.direction.south] = defines.direction.north,
	[defines.direction.east] = defines.direction.west,
	[defines.direction.west] = defines.direction.east,
}
local dir2vector = {
	[defines.direction.north] = {x=0, y=-1},
	[defines.direction.south] = {x=0, y=1},
	[defines.direction.east] = {x=1, y=0},
	[defines.direction.west] = {x=-1, y=0},
}

-- add vectors
function add_vectors(v1, v2)
	return {v1.x + v2.x, v1.y + v2.y}
end

-- return all entities 1 tile away in specified direction
function get_neighbour_entities(entity, direction)
	return entity.surface.find_entities_filtered{ position = add_vectors(entity.position, dir2vector[direction]) }
end

-- does any entity in list have an inventory we can work with
function are_loadable(entities)
	for _,entity in pairs(entities) do
		if entity.get_inventory(defines.inventory.chest) or
			entity.get_inventory(defines.inventory.furnace_source) or
			entity.get_inventory(defines.inventory.assembling_machine_input) or
			entity.get_inventory(defines.inventory.lab_input) or
			entity.get_inventory(defines.inventory.rocket_silo_rocket)
		then return true end
	end
	return false
end

-- if there's a loadable thing behind but not ahead, turn around
-- if there's a loadable thing ahead but not behind, turn around and switch mode
function DyWorld_Loaders_Rotate(event)
	local built = event.created_entity
	if not built or not built.valid or not string.find(event.created_entity.name, "dyworld-", 1, true) and not string.find(event.created_entity.name, "-loader", 1, true) then return end
	-- is this a fake player build event from Nanobots?
	if event.revived then return end
    local snap2back = settings.get_player_settings(game.players[event.player_index])["DyWorld_loaders_snap_to_back"].value
    local snap2front = settings.get_player_settings(game.players[event.player_index])["DyWorld_loaders_snap_to_front"].value
	-- no need to check anything if all configs are off
	if not snap2back and not snap2front then return end
	-- check neighbours and snap if necessary
    local belt_end = get_neighbour_entities(built, built.direction)
    local loading_end = get_neighbour_entities(built, opposite[built.direction])
    if snap2back and not are_loadable(belt_end) and are_loadable(loading_end) then
        built.rotate( {by_player = event.player_index} )
    elseif snap2front and are_loadable(belt_end) and not are_loadable(loading_end) then
        built.direction = opposite[built.direction]
        built.rotate( {by_player = event.player_index} )
    end
end