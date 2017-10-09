require "data/prefix"

Data_Table_Furnace_Electric = {
	{
		Name = dyworld_prefix.."furnace-electric-01",
		--Icon = --todo
		Recipe_Craft_Time = 30,
		Recipe_Ingredients = {{"electric-furnace", 1},{dyworld_prefix_intermediate.."heater", 4},{"advanced-circuit", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "250kW",
		Speed = (2*2),
		Pollution = (0.005*2),
		Modules = 3,
	},
	{
		Name = dyworld_prefix.."furnace-electric-02",
		--Icon = --todo
		Recipe_Craft_Time = 60,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-electric-01", 1},{dyworld_prefix_intermediate.."heater", 6},{"processing-unit", 25},{dyworld_prefix_intermediate.."rotor", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "450kW",
		Speed = (2*4),
		Pollution = (0.005*4),
		Modules = 5,
	},
	{
		Name = dyworld_prefix.."furnace-electric-03",
		--Icon = --todo
		Recipe_Craft_Time = 90,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-electric-02", 1},{dyworld_prefix_intermediate.."heater", 9},{dyworld_prefix_intermediate.."processing-advanced", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 25000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "750kW",
		Speed = (2*8),
		Pollution = (0.005*8),
		Modules = 7,
	},
	{
		Name = dyworld_prefix.."furnace-electric-04",
		--Icon = --todo
		Recipe_Craft_Time = 120,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-electric-03", 1},{dyworld_prefix_intermediate.."heater", 14},{dyworld_prefix_intermediate.."processing-logic", 25},{dyworld_prefix_intermediate.."crystal", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "1250kW",
		Speed = (2*16),
		Pollution = (0.005*16),
		Modules = 11,
	},
}

function DyWorld_Furnace_Electric_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Furnace_Electric_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."furnace-electric",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end



for k,v in pairs(Data_Table_Furnace_Electric) do
data:extend(
	{
		DyWorld_Furnace_Electric_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Speed, v.Modules, v.Pollution),
		DyWorld_Furnace_Electric_Item(v.Name, v.Stack),
		DyWorld_Furnace_Electric_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end