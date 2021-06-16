PICKUP_ROTATIONS = -- True is clockwise rotation
{
  [0] = -- south
  {
    [true] = {py = -1, px = 0},
    [false] = {py = 1, px = 0,}
  },
  [2] = -- west
  {
    [true] = {py = 0, px = 1},
    [false] = {py = 0, px = -1}
  },
  [4] = -- north
  {
    [true] = {py = -1, px = 0},
    [false] = {py = 1, px = 0}
  },
  [6] = -- east
  {
    [true] = {py = 0, px = 1},
    [false] = {py = 0, px = -1}
  },
}

function GetPickupDirection(entity)
  -- Returns inverted pickup_position direction to match insert_position direction
  local dy = entity.pickup_position.y - entity.position.y
  if dy > 0.5 then
    return defines.direction.north
  elseif dy < -0.5 then
    return defines.direction.south
  else
    local dx = entity.pickup_position.x - entity.position.x
    if dx < -0.5 then
      return defines.direction.east
    else
      return defines.direction.west
    end
  end
end

function ApplyPickupRotation(entity, clockwise)
  local px = entity.pickup_position.x - entity.position.x
  local py = entity.pickup_position.y - entity.position.y
  local dir = GetPickupDirection(entity)
  entity.pickup_position =
  {
    entity.position.x + PICKUP_ROTATIONS[dir][clockwise].py * py,
    entity.position.y + PICKUP_ROTATIONS[dir][clockwise].px * px
  }
end

function RotatePickup(entity, clockwise)
  ApplyPickupRotation(entity, clockwise)
  if GetPickupDirection(entity) == entity.direction then
    ApplyPickupRotation(entity, clockwise)
  end
  entity.direction = entity.direction
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
  local OFFSET = 0.15625
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

function InserterCheck(VAR)
	for k,v in pairs(Inserters_Recipes) do
		for index,player in pairs(game.players) do
			if player.force.recipes[k] then
				if VAR <= v.Disable and player.force.recipes[k].enabled then
					player.force.recipes[k].enabled = false
					PlayerPrint({"looped-name.lost-knowledge", {"item-name."..k}})
				end
				if VAR >= v.Enable and not player.force.recipes[k].enabled then
					player.force.recipes[k].enabled = true
					PlayerPrint({"looped-name.gained-knowledge", {"item-name."..k}})
				end
			end
		end
	end
end