require "data/prefix"

Data_Table_Lab_Tool = {
	{
		Name = dyworld_prefix.."lab-tool-stone",
		Stack = 200,
		Durability = 1,
		Craft_Time = 1.5,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"stone",1}},
	},
	{
		Name = dyworld_prefix.."lab-tool-copper",
		Stack = 200,
		Durability = 1,
		Craft_Time = 1.5,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"copper-ore",1}},
	},
	{
		Name = dyworld_prefix.."lab-tool-iron",
		Stack = 200,
		Durability = 1,
		Craft_Time = 1.5,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"iron-ore",1}},
	},
	{
		Name = dyworld_prefix.."lab-tool-coal",
		Stack = 200,
		Durability = 1,
		Craft_Time = 1.5,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"coal",1}},
	},
}

function DyWorld_Lab_Tool_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
  local result =
  {
    type = "recipe",
    name = NAME,
    energy_required = CRAFTTIME,
	enabled = ENABLED,
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