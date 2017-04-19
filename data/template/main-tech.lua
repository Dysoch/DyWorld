require "data/data-templates"
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
end