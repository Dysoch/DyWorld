require "data/prefix"

Data_Table_Tools = {
	{
		Name = dyworld_prefix.."tool-01",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3},{"raw-wood",1}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Durability = 1000,
		Damage = 1,
		Speed = 2,
	},
	{
		Name = dyworld_prefix.."tool-02",
		--Icon = --todo
		Recipe_Craft_Time = 2,
		Recipe_Ingredients = {{"stone", 3},{"raw-wood",1}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Durability = 2500,
		Damage = 2,
		Speed = 2.5,
	},
	{
		Name = dyworld_prefix.."tool-03",
		--Icon = --todo
		Recipe_Craft_Time = 4,
		Recipe_Ingredients = {{dyworld_prefix.."tool-02", 1},{"copper-plate",3}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Durability = 3500,
		Damage = 2.5,
		Speed = 5,
	},
	{
		Name = dyworld_prefix.."tool-04",
		--Icon = --todo
		Recipe_Craft_Time = 6.5,
		Recipe_Ingredients = {{dyworld_prefix.."tool-03", 1},{"iron-plate",5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Durability = 5000,
		Damage = 5,
		Speed = 3,
	},
	{
		Name = dyworld_prefix.."tool-05",
		--Icon = --todo
		Recipe_Craft_Time = 8,
		Recipe_Ingredients = {{dyworld_prefix.."tool-04", 1},{"steel-plate",5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Durability = 10000,
		Damage = 7.5,
		Speed = 5,
	},
}

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