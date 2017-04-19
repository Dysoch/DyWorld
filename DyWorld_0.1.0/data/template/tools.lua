require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

function DyWorld_Tools_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
  local result =
  {
    type = "recipe",
    name = NAME,
    energy_required = CRAFTTIME,
	enabled = ENABLED,
    ingredients = {},
    result = NAME,
    result_count = RESULTCOUNT
  }
  return result
end

function DyWorld_Tools_Item(NAME, DAMAGE, SPEED, STACK, DURA)
  local result =
  {
    type = "mining-tool",
    name = NAME,
    icon = "__base__/graphics/icons/iron-axe.png",
    flags = {"goes-to-main-inventory"},
    action =
    {
      type="direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
            type = "damage",
            damage = { amount = DAMAGE , type = "physical"}
        }
      }
    },
    durability = DURA,
    subgroup = "tool",
    order = NAME,
    speed = SPEED,
    stack_size = STACK
  }
  return result
end

for k,v in pairs(Data_Table_Tools) do
data:extend(
	{
		DyWorld_Tools_Item(v.Name, v.Damage, v.Speed, v.Stack, v.Durability),
		DyWorld_Tools_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end