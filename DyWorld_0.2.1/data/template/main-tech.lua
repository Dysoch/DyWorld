require "data/template-data/tech"
require "data/prefix"

function DyWorld_Main_Tech(NAME, COUNT, TIME)
  local result =
  {
    type = "technology",
    name = NAME,
    icon = "__base__/graphics/technology/steel-processing.png", -- temp
    effects =
    {
    },
    prerequisites = {},
    unit =
    {
      count = COUNT,
      ingredients = {},
      time = TIME
    },
    order = NAME
  }
  return result
end

for k,v in pairs(Data_Table_Main_Tech) do
data:extend(
	{
		DyWorld_Main_Tech(v.Name, v.Count, v.Time)
	})
	if v.PreReq then
		for _,z in pairs(v.PreReq_Tech) do
			table.insert(data.raw.technology[v.Name].prerequisites,z)
		end
	end
	for _,z in pairs(v.Ingredients) do
		table.insert(data.raw.technology[v.Name].unit.ingredients,z)
	end
	if v.Name == dyworld_prefix.."tech-"..enhanced then
		local result = {type = "num-quick-bars", modifier = 1 }
		table.insert(data.raw.technology[dyworld_prefix.."tech-"..enhanced].effects, result)
	end
	if v.Name == dyworld_prefix.."tech-"..godlike then
		local result = {type = "num-quick-bars", modifier = 1 }
		table.insert(data.raw.technology[dyworld_prefix.."tech-"..godlike].effects, result)
	end
end