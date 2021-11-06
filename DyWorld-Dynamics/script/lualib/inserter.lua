local math2d = require("math2d")

DIRECTION_VECTOR = {
	[0] = {0, -1}, -- north
	[1] = {1, -1}, -- northeast
	[2] = {1, 0}, -- east
	[3] = {1, 1}, -- southeast
	[4] = {0, 1}, -- south
	[5] = {-1, 1}, -- southwest
	[6] = {-1, 0}, -- west
	[7] = {-1, -1} -- northwest
}

function getPickupDirection(inserter)
	return math.floor((math.atan2(inserter.position.x - inserter.pickup_position.x, inserter.pickup_position.y - inserter.position.y) / math.pi + 1) * 4 + 0.5) % 8
end

function getPickupDistance(inserter)
	local vector = math2d.position.subtract(inserter.pickup_position, inserter.position)
	return math.floor(math.max(math.abs(vector.x), math.abs(vector.y)) + 0.5)
end

function RotatePickup(player, inserter, increment)
	local pickup_direction = getPickupDirection(inserter)
	--[[if not settings.global["side-inserters-45"].value then
		if pickup_direction % 2 ~= 0 then
			pickup_direction = pickup_direction - increment
		end
		increment = increment * 2
	end]]
	pickup_direction = (pickup_direction + increment) % 8
	if pickup_direction == (inserter.direction + 4) % 8 then
		pickup_direction = (pickup_direction + increment) % 8
	end
	local pickup_vector = math2d.position.multiply_scalar(DIRECTION_VECTOR[pickup_direction], getPickupDistance(inserter))
	inserter.pickup_position = math2d.position.add(inserter.position, pickup_vector)
	inserter.direction = inserter.direction
end

function ToggleDropDistance(entity)
	local OFFSET = 0.3125
	local dx = entity.drop_position.x - entity.position.x
	local dy = entity.drop_position.y - entity.position.y
	if entity.direction == defines.direction.south or entity.direction == defines.direction.north then
		if dy % 1 > 0.5 then
			dy = dy + OFFSET
		else
			dy = dy - OFFSET
		end
	elseif entity.direction == defines.direction.west or entity.direction == defines.direction.east then
		if dx % 1 > 0.5 then
			dx = dx + OFFSET
		else
			dx = dx - OFFSET
		end
	end
	entity.drop_position = {entity.position.x + dx, entity.position.y + dy}
	-- set direction to force update of insert location when hand is already full
	entity.direction = entity.direction
end

function LateralDropAdjust(entity, event)
	local OFFSET = 40 / 256
	local dx = entity.drop_position.x - entity.position.x
	local dy = entity.drop_position.y - entity.position.y
	if entity.direction == defines.direction.south then
		if dx > 0 then
			dx = 0 - OFFSET
		else
			dx = dx + OFFSET
		end
	elseif entity.direction == defines.direction.west then
		if dy > 0 then
			dy = 0 - OFFSET
		else
			dy = dy + OFFSET
		end
	elseif entity.direction == defines.direction.north then
		if dx < 0 then
			dx = OFFSET
		else
			dx = dx - OFFSET
		end
	elseif entity.direction == defines.direction.east then
		if dy < 0 then
			dy = OFFSET
		else
			dy = dy - OFFSET
		end
	end
	entity.drop_position = {entity.position.x + dx, entity.position.y + dy}
	-- set direction to force update of insert location when hand is already full
	entity.direction = entity.direction
end

script.on_event(defines.events.on_entity_settings_pasted, function(event)
	local destination = event.destination
	if destination and (destination.type == "inserter" or (destination.type == "entity-ghost" and destination.ghost_type == "inserter")) then
		local prototype = nil
		if destination.type == "entity-ghost" then
			prototype = destination.ghost_prototype
		else
			prototype = destination.prototype
		end
		local pickup_distance = getPickupDistance(destination)
		local prototype_pickup_distance = math.max(math.abs(prototype.inserter_pickup_position[1]), math.abs(prototype.inserter_pickup_position[2]))
		if pickup_distance ~= prototype_pickup_distance then
			local pickup_vector = math2d.position.subtract(destination.pickup_position, destination.position)
			pickup_vector = math2d.position.multiply_scalar(math2d.position.get_normalised(pickup_vector), prototype_pickup_distance)
			destination.pickup_position = math2d.position.add(destination.position, pickup_vector)
		end
		local drop_vector = math2d.position.subtract(destination.drop_position, destination.position)
		local drop_distance = math.floor(math.max(math.abs(drop_vector.x), math.abs(drop_vector.y)) + 0.5)
		local prototype_drop_distance = math.floor(math.max(math.abs(prototype.inserter_drop_position[1]), math.abs(prototype.inserter_drop_position[2])) + 0.5)
		if drop_distance ~= prototype_drop_distance then
			local drop_direction = (destination.direction + 4) % 8
			local drop_position = math2d.position.subtract(destination.drop_position, math2d.position.multiply_scalar(DIRECTION_VECTOR[drop_direction], drop_distance))
			destination.drop_position = math2d.position.add(drop_position,  math2d.position.multiply_scalar(DIRECTION_VECTOR[drop_direction], prototype_drop_distance))
		end
	end
end)

function InserterCheck(VAR, Bool)
	for k,v in pairs(Inserters_Recipes) do
		for index,player in pairs(game.players) do
			if player.force.recipes[k] then
				if (VAR >= v.Enable and player.force.recipes[k].enabled == false) then
                    if v.Extra then
                        if v.Extra == "Story" then
                            if global.dyworld_story then
                                if (global.dyworld.story.act > v.Story[1]) or (global.dyworld.story.act >= v.Story[1] and global.dyworld.story.phase >= v.Story[2]) then
                                    player.force.recipes[k].enabled = true
									if not Bool then
										PlayerPrint({"looped-name.gained-knowledge", k})
									end
                                end
                            else
                                player.force.recipes[k].enabled = true
								if not Bool then
									PlayerPrint({"looped-name.gained-knowledge", k})
								end
                            end
                        elseif v.Extra == "Research" then
                            local amount_research = 0
                            local amount_done = 0
                            for Amount,Research in pairs(v.Research) do
                                amount_research = amount_research + 1
                                if game.forces.player.technologies[Research].researched then
                                    amount_done = amount_done + 1
                                end
                                if amount_done >= amount_research then
                                    player.force.recipes[k].enabled = true
									if not Bool then
										PlayerPrint({"looped-name.gained-knowledge", k})
									end
                                end
                            end
                        end
                    else
                        player.force.recipes[k].enabled = true
						if not Bool then
							PlayerPrint({"looped-name.gained-knowledge", k})
						end
                    end
				end
			end
		end
	end
end