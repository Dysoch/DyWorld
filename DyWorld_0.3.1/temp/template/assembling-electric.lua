require "data/prefix"

Data_Table_Assembling_Electric = {
	{
		Name = dyworld_prefix.."assembling-machine-electric-01",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"assembling-machine-3", 1},{dyworld_prefix_intermediate.."steel-stick", 25},{dyworld_prefix_intermediate.."rotor", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "450kW",
		Speed = 2.5,
		Pollution = 7,
	},
	{
		Name = dyworld_prefix.."assembling-machine-electric-02",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{dyworld_prefix.."assembling-machine-electric-01", 1},{dyworld_prefix_intermediate.."steel-gear", 15},{dyworld_prefix_intermediate.."rotor", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 25000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "950kW",
		Speed = 5,
		Pollution = 12,
	},
}

function DyWorld_Assembling_Electric_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Assembling_Electric_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."assembling-electric",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end



for k,v in pairs(Data_Table_Assembling_Electric) do
data:extend(
	{
		DyWorld_Assembling_Electric_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Speed, v.Pollution),
		DyWorld_Assembling_Electric_Item(v.Name, v.Stack),
		DyWorld_Assembling_Electric_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end