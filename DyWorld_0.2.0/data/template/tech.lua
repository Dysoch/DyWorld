require "data/template-data/tech"
require "data/prefix"

function DyWorld_Tech(NAME, ICON, COUNT, TIME)
  local result =
  {
    type = "technology",
    name = NAME,
    icon = ICON,
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
    order = NAME,
	upgrade = true
  }
  return result
end

for k,v in pairs(Data_Table_Tech) do
data:extend(
	{
		DyWorld_Tech(v.Name, v.Icon, v.Count, v.Time)
	})
	if v.PreReq then
		for _,z in pairs(v.PreReq_Tech) do
			table.insert(data.raw.technology[v.Name].prerequisites,z)
		end
	end
	if v.Effects then
		for _,z in pairs(v.Effects_Ingredients) do
		local result = {type = "unlock-recipe", recipe = z}
			table.insert(data.raw.technology[v.Name].effects,result)
		end
	end
	for _,z in pairs(v.Ingredients) do
		table.insert(data.raw.technology[v.Name].unit.ingredients,z)
	end
	if v.Base_Edit then
		data.raw.recipe[v.Base_Edit_Name].enabled = false
	end
end