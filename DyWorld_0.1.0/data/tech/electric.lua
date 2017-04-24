require "data/prefix"

function DyWorld_Electric_Damage(Level, Pack1, Pack2, Pack3, Count, Time)
  local result =
  {
    type = "technology",
    name = dyworld_prefix.."electric-damage-"..Level,
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "electric",
        modifier = tostring(Level/100)
      }
    },
    prerequisites = {dyworld_prefix.."tech-"..basic},
    unit =
    {
      count = Count,
      ingredients =
      {
      },
      time = Time
    },
    upgrade = true,
    order = dyworld_prefix.."electric-damage-"..Level
  }
  if Level == 1 then
    result.prerequisites = {"military"}
  elseif Level == 11 then
    result.prerequisites = {dyworld_prefix.."tech-"..intermediate, dyworld_prefix.."electric-damage-"..(Level - 1)}
  elseif Level == 31 then
    result.prerequisites = {dyworld_prefix.."tech-"..enhanced, dyworld_prefix.."electric-damage-"..(Level - 1)}
  elseif Level == 61 then
    result.prerequisites = {dyworld_prefix.."tech-"..advanced, dyworld_prefix.."electric-damage-"..(Level - 1)}
  elseif Level == 101 then
    result.prerequisites = {dyworld_prefix.."tech-"..godlike, dyworld_prefix.."electric-damage-"..(Level - 1)}
  else
    result.prerequisites = {dyworld_prefix.."electric-damage-"..(Level - 1)}
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
  return result
end

function DyWorld_Electric_Speed(Level, Pack1, Pack2, Pack3, Count, Time)
  local result =
  {
    type = "technology",
    name = dyworld_prefix.."electric-speed-"..Level,
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "electric",
        modifier = tostring(Level/200)
      }
    },
    prerequisites = {dyworld_prefix.."tech-"..basic},
    unit =
    {
      count = Count,
      ingredients =
      {
      },
      time = Time
    },
    upgrade = true,
    order = dyworld_prefix.."electric-speed-"..Level
  }
  if Level == 1 then
    result.prerequisites = {"military"}
  elseif Level == 11 then
    result.prerequisites = {dyworld_prefix.."tech-"..intermediate, dyworld_prefix.."electric-speed-"..(Level - 1)}
  elseif Level == 31 then
    result.prerequisites = {dyworld_prefix.."tech-"..enhanced, dyworld_prefix.."electric-speed-"..(Level - 1)}
  elseif Level == 61 then
    result.prerequisites = {dyworld_prefix.."tech-"..advanced, dyworld_prefix.."electric-speed-"..(Level - 1)}
  elseif Level == 101 then
    result.prerequisites = {dyworld_prefix.."tech-"..godlike, dyworld_prefix.."electric-speed-"..(Level - 1)}
  else
    result.prerequisites = {dyworld_prefix.."electric-speed-"..(Level - 1)}
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
  return result
end

for i=1,10 do
 data:extend(
{
  DyWorld_Electric_Damage(i, 1, 0, 0, (i*50), (i*1)),
  DyWorld_Electric_Speed(i, 1, 0, 0, (i*50), (i*2)),
})
end

for i=11,30 do
 data:extend(
{
  DyWorld_Electric_Damage(i, 1, 1, 0, (i*100), (i*1)),
  DyWorld_Electric_Speed(i, 1, 1, 0, (i*100), (i*2)),
})
end

for i=31,60 do
 data:extend(
{
  DyWorld_Electric_Damage(i, 1, 1, 1, (i*200), (i*1)),
  DyWorld_Electric_Speed(i, 1, 1, 1, (i*200), (i*2)),
})
end

for i=61,100 do
 data:extend(
{
  DyWorld_Electric_Damage(i, 1, 1, 1, (i*500), (i*1)),
  DyWorld_Electric_Speed(i, 1, 1, 1, (i*500), (i*2)),
})
end

for i=101,500 do
 data:extend(
{
  DyWorld_Electric_Damage(i, 1, 1, 1, (i*1000), (i*1)),
  DyWorld_Electric_Speed(i, 1, 1, 1, (i*1000), (i*2)),
})
end