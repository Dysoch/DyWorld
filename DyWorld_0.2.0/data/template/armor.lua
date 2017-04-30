require "data/prefix"

Data_Table_Armor = {
	{
		Name = dyworld_prefix.."backpack-01",
		--Icon = --todo
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"stone", 2}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 10,
		Durability = 1000,
		Grid_State = false,
		Grid = dyworld_prefix.."armor-01",
		Resistance = false,
		Resistance_Ingredients = {{type = "physical", decrease = 0, percent = 0 }},
	},
	{
		Name = dyworld_prefix.."backpack-02",
		--Icon = --todo
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"stone", 2}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 25,
		Durability = 2000,
		Grid_State = false,
		Grid = dyworld_prefix.."armor-01",
		Resistance = false,
		Resistance_Ingredients = {{type = "physical", decrease = 0, percent = 0 }},
	},
	{
		Name = dyworld_prefix.."backpack-03",
		--Icon = --todo
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"stone", 2}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 50,
		Durability = 3000,
		Grid_State = false,
		Grid = dyworld_prefix.."armor-01",
		Resistance = false,
		Resistance_Ingredients = {{type = "physical", decrease = 0, percent = 0 }},
	},
	{
		Name = dyworld_prefix.."backpack-04",
		--Icon = --todo
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"stone", 2}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 100,
		Durability = 4000,
		Grid_State = false,
		Grid = dyworld_prefix.."armor-01",
		Resistance = false,
		Resistance_Ingredients = {{type = "physical", decrease = 0, percent = 0 }},
	},
	{
		Name = dyworld_prefix.."armor-01",
		--Icon = --todo
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"effectivity-module-3", 5}, {"speed-module-3", 5}, {"processing-unit", 40}, {"steel-plate", 40},{"power-armor-mk2",1}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 40,
		Durability = 5000,
		Grid_State = true,
		Grid = dyworld_prefix.."armor-01",
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 60 },{type = "acid", decrease = 10, percent = 50},{type = "explosion", decrease = 60, percent = 60},{type = "fire", decrease = 10, percent = 75}},
	},
	{
		Name = dyworld_prefix.."armor-02",
		--Icon = --todo
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"effectivity-module-3", 5}, {"speed-module-3", 5}, {"processing-unit", 40}, {"steel-plate", 40},{dyworld_prefix.."armor-01",1}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 60,
		Durability = 10000,
		Grid_State = true,
		Grid = dyworld_prefix.."armor-02",
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 15, percent = 70 },{type = "acid", decrease = 10, percent = 60},{type = "explosion", decrease = 60, percent = 70},{type = "fire", decrease = 10, percent = 80}},
	},
	
	{
		Name = dyworld_prefix.."armor-03",
		--Icon = --todo
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"effectivity-module-3", 10}, {"speed-module-3", 10}, {"processing-unit", 80}, {"steel-plate", 80},{dyworld_prefix.."armor-02",1}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 80,
		Durability = 20000,
		Grid_State = true,
		Grid = dyworld_prefix.."armor-03",
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 20, percent = 75 },{type = "acid", decrease = 10, percent = 70},{type = "explosion", decrease = 60, percent = 80},{type = "fire", decrease = 10, percent = 85}},
	},
	{
		Name = dyworld_prefix.."armor-04",
		--Icon = --todo
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"effectivity-module-3", 20}, {"speed-module-3", 20}, {"processing-unit", 160}, {"steel-plate", 160},{dyworld_prefix.."armor-03",1}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 100,
		Durability = 40000,
		Grid_State = true,
		Grid = dyworld_prefix.."armor-04",
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 25, percent = 80 },{type = "acid", decrease = 20, percent = 80},{type = "explosion", decrease = 120, percent = 90},{type = "fire", decrease = 20, percent = 90}},
	},
	{
		Name = dyworld_prefix.."armor-05",
		--Icon = --todo
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"effectivity-module-3", 40}, {"speed-module-3", 40}, {"processing-unit", 320}, {"steel-plate", 320},{dyworld_prefix.."armor-04",1}},
		Recipe_Results_Count = 1,
		Stack = 1,
		Inventory_Extra = 150,
		Durability = 80000,
		Grid_State = true,
		Grid = dyworld_prefix.."armor-05",
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 40, percent = 85 },{type = "acid", decrease = 40, percent = 90},{type = "explosion", decrease = 240, percent = 95},{type = "fire", decrease = 40, percent = 95}},
	},
}

function DyWorld_Armor_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Armor_Item(NAME, STACK, INV, DURA)
  local result =
  {
    type = "armor",
    name = NAME,
    icon = "__base__/graphics/icons/modular-armor.png",
    flags = {"goes-to-main-inventory"},
    resistances =
    {
    },
    durability = DURA,
    subgroup = "armor",
    order = NAME,
    stack_size = STACK,
    inventory_size_bonus = INV
  }
  return result
end

for k,v in pairs(Data_Table_Armor) do
data:extend(
	{
		
		DyWorld_Armor_Item(v.Name, v.Stack, v.Inventory_Extra, v.Durability),
		DyWorld_Armor_Recipe(v.Name, v.Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
	if v.Resistance then
		for _,z in pairs(v.Resistance_Ingredients) do
			table.insert(data.raw.armor[v.Name].resistances,z)
		end
	end
	if v.Grid_State then
		data.raw.armor[v.Name].equipment_grid = v.Grid
	end
end