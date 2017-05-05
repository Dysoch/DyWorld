require "data/prefix"

Data_Table_Solar_Panels = {
	{
		Name = dyworld_prefix.."solar-1",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"solar-panel", 1},{"advanced-circuit", 5},{"steel-plate", 15}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*3),
	},
	{
		Name = dyworld_prefix.."solar-2",
		--Icon = --todo
		Recipe_Craft_Time = 10,
		Recipe_Ingredients = {{dyworld_prefix.."solar-1", 1},{"advanced-circuit", 15},{"steel-plate", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*6),
	},
	{
		Name = dyworld_prefix.."solar-3",
		--Icon = --todo
		Recipe_Craft_Time = 15,
		Recipe_Ingredients = {{dyworld_prefix.."solar-2", 1},{"advanced-circuit", 50},{"steel-plate", 50}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 2000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*9),
	},
	{
		Name = dyworld_prefix.."solar-4",
		--Icon = --todo
		Recipe_Craft_Time = 20,
		Recipe_Ingredients = {{dyworld_prefix.."solar-3", 1},{"processing-unit", 15},{"steel-plate", 75}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*15),
	},
	{
		Name = dyworld_prefix.."solar-5",
		--Icon = --todo
		Recipe_Craft_Time = 25,
		Recipe_Ingredients = {{dyworld_prefix.."solar-4", 1},{"processing-unit", 30},{"steel-plate", 100}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 10000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*20),
	},
	{
		Name = dyworld_prefix.."solar-6",
		--Icon = --todo
		Recipe_Craft_Time = 30,
		Recipe_Ingredients = {{dyworld_prefix.."solar-5", 1},{"processing-unit", 45},{"steel-plate", 150}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 20000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*30),
	},
	{
		Name = dyworld_prefix.."solar-7",
		--Icon = --todo
		Recipe_Craft_Time = 35,
		Recipe_Ingredients = {{dyworld_prefix.."solar-6", 1},{"processing-unit", 60},{"steel-plate", 200}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 50000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*40),
	},
	{
		Name = dyworld_prefix.."solar-8",
		--Icon = --todo
		Recipe_Craft_Time = 40,
		Recipe_Ingredients = {{dyworld_prefix.."solar-7", 1},{"processing-unit", 120},{"steel-plate", 250}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*60),
	},
	{
		Name = dyworld_prefix.."solar-9",
		--Icon = --todo
		Recipe_Craft_Time = 45,
		Recipe_Ingredients = {{dyworld_prefix.."solar-8", 1},{"processing-unit", 250},{"steel-plate", 300}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 200000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (60*100),
	},
}

function DyWorld_Solar_Panels_Recipe(DATA)
  local result =
  {
    type = "recipe",
    name = DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
    ingredients = {},
    result = DATA.Name,
    result_count = DATA.Recipe_Results_Count,
  }
  return result
end

function DyWorld_Solar_Panels_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

function DyWorld_Solar_Panels_Entity(DATA)
  local result =
  {
    type = "solar-panel",
    name = DATA.Name,
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = DATA.Name},
    max_health = DATA.Health,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "solar-panel",
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
      priority = "high",
      width = 104,
      height = 96,
	  tint = DATA.Tint,
    },
    production = (tostring(DATA.Energy)).."kW"
  }
  return result
end

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

for k,v in pairs(Data_Table_Solar_Panels) do
data:extend(
	{
		DyWorld_Solar_Panels_Entity(v),
		DyWorld_Solar_Panels_Item(v),
		DyWorld_Solar_Panels_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end