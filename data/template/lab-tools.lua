require "data/data-templates"
require "data/prefix"

function DyWorld_Lab_Tool_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
  local result =
  {
    type = "recipe",
    name = NAME,
    energy_required = CRAFTTIME,
    ingredients = {},
    result = NAME,
    result_count = RESULTCOUNT,
  }
  return result
end

function DyWorld_Lab_Tool_Item(NAME, STACK, DURABILITY)
  local result =
  {
    type = "tool",
    name = NAME,
    icon = "__base__/graphics/icons/science-pack-1.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = NAME,
    stack_size = STACK,
    durability = DURABILITY,
    durability_description_key = "description.science-pack-remaining-amount"
  }
  return result
end

for k,v in pairs(Data_Table_Lab_Tool) do
data:extend(
	{
		DyWorld_Lab_Tool_Item(v.Name, v.Stack, v.Durability),
		DyWorld_Lab_Tool_Recipe(v.Name, v.Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end