require "data/prefix"

function DyWorld_Sniper_Damage(Level, Pack1, Pack2, Pack3, Pack4, Time)
  local result =
  {
    type = "technology",
    name = dyworld_prefix.."sniper-damage-"..Level,
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "sniper",
        modifier = tostring(Level/100)
      }
    },
    prerequisites = {dyworld_prefix.."tech-"..basic},
    unit =
    {
      count = math.floor((10*(Level*1.5))-Level),
      ingredients =
      {
      },
      time = Time
    },
    upgrade = true,
    order = dyworld_prefix.."sniper-damage-"..Level
  }
  if Level == 1 then
    result.prerequisites = {"military"}
  elseif Level == 11 then
    result.prerequisites = {dyworld_prefix.."tech-"..intermediate, dyworld_prefix.."sniper-damage-"..(Level - 1)}
  elseif Level == 31 then
    result.prerequisites = {dyworld_prefix.."tech-"..enhanced, dyworld_prefix.."sniper-damage-"..(Level - 1)}
  elseif Level == 61 then
    result.prerequisites = {dyworld_prefix.."tech-"..advanced, dyworld_prefix.."sniper-damage-"..(Level - 1)}
  elseif Level == 101 then
    result.prerequisites = {dyworld_prefix.."tech-"..godlike, dyworld_prefix.."sniper-damage-"..(Level - 1)}
  else
    result.prerequisites = {dyworld_prefix.."sniper-damage-"..(Level - 1)}
  end
  if Pack1 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-1", Pack1})
  end
  if Pack2 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-2", Pack2})
  end
  if Pack3 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-3", Pack3})
  end
  if Pack4 ~= 0 then
    table.insert(result.unit.ingredients, {"military-science-pack", Pack4})
  end
  if Level <= 15 then
	result.unit.time = 5
	result.unit.count = 10+Level
  elseif Level <= 30 then
	result.unit.time = 15
	result.unit.count = 50+Level
  elseif Level <= 50 then
	result.unit.time = 30
  end
  return result
end

function DyWorld_Sniper_Speed(Level, Pack1, Pack2, Pack3, Pack4, Time)
  local result =
  {
    type = "technology",
    name = dyworld_prefix.."sniper-speed-"..Level,
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "sniper",
        modifier = tostring(Level/(200+(Level-1)))
      }
    },
    prerequisites = {dyworld_prefix.."tech-"..basic},
    unit =
    {
      count = math.floor((10*(Level*1.5))-Level),
      ingredients =
      {
      },
      time = Time
    },
    upgrade = true,
    order = dyworld_prefix.."sniper-speed-"..Level
  }
  if Level == 1 then
    result.prerequisites = {"military"}
  elseif Level == 11 then
    result.prerequisites = {dyworld_prefix.."tech-"..intermediate, dyworld_prefix.."sniper-speed-"..(Level - 1)}
  elseif Level == 31 then
    result.prerequisites = {dyworld_prefix.."tech-"..enhanced, dyworld_prefix.."sniper-speed-"..(Level - 1)}
  elseif Level == 61 then
    result.prerequisites = {dyworld_prefix.."tech-"..advanced, dyworld_prefix.."sniper-speed-"..(Level - 1)}
  elseif Level == 101 then
    result.prerequisites = {dyworld_prefix.."tech-"..godlike, dyworld_prefix.."sniper-speed-"..(Level - 1)}
  else
    result.prerequisites = {dyworld_prefix.."sniper-speed-"..(Level - 1)}
  end
  if Pack1 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-1", Pack1})
  end
  if Pack2 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-2", Pack2})
  end
  if Pack3 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-3", Pack3})
  end
  if Pack4 ~= 0 then
    table.insert(result.unit.ingredients, {"military-science-pack", Pack4})
  end
  if Level <= 15 then
	result.unit.time = 5
	result.unit.count = 10+Level
  elseif Level <= 30 then
	result.unit.time = 15
	result.unit.count = 50+Level
  elseif Level <= 50 then
	result.unit.time = 30
  end
  return result
end

for i=1,10 do
 data:extend(
{
  DyWorld_Sniper_Damage(i, 1, 0, 0, 0, (i*1)),
  DyWorld_Sniper_Speed(i, 1, 0, 0, 0, (i*2)),
})
end

for i=11,30 do
 data:extend(
{
  DyWorld_Sniper_Damage(i, 1, 1, 0, 1, (i*1)),
  DyWorld_Sniper_Speed(i, 1, 1, 0, 1, (i*2)),
})
end

for i=31,60 do
 data:extend(
{
  DyWorld_Sniper_Damage(i, 1, 1, 1, 2, (i*1)),
  DyWorld_Sniper_Speed(i, 1, 1, 1, 2, (i*2)),
})
end

for i=61,100 do
 data:extend(
{
  DyWorld_Sniper_Damage(i, 1, 1, 1, 5, (i*1)),
  DyWorld_Sniper_Speed(i, 1, 1, 1, 5, (i*2)),
})
end

for i=101,500 do
 data:extend(
{
  DyWorld_Sniper_Damage(i, 1, 1, 1, 10, (i*1)),
  DyWorld_Sniper_Speed(i, 1, 1, 1, 10, (i*2)),
})
end