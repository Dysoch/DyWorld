require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

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