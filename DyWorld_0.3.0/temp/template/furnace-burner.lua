require "data/prefix"

Data_Table_Furnace_Burner = {
	{
		Name = dyworld_prefix.."furnace-burner-01",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3},{dyworld_prefix_intermediate.."stone-gear", 1},{dyworld_prefix_intermediate.."stone-stick", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 50,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "250kW",
		Speed = 0.5,
		Effectivity = 0.75,
		Pollution = 0.05,
	},
	{
		Name = dyworld_prefix.."furnace-burner-02",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-burner-01", 1},{dyworld_prefix_intermediate.."binding-iron", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "200kW",
		Speed = 0.75,
		Effectivity = 1,
		Pollution = 0.08,
	},
}

function DyWorld_Furnace_Burner_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Furnace_Burner_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."furnace-burner",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end



for k,v in pairs(Data_Table_Furnace_Burner) do
data:extend(
	{
		DyWorld_Furnace_Burner_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Speed, v.Effectivity, v.Pollution),
		DyWorld_Furnace_Burner_Item(v.Name, v.Stack),
		DyWorld_Furnace_Burner_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end