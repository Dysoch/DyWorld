require "data/prefix"

Data_Table_Gun = {
	{
		Name = dyworld_prefix.."gun-pistol",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"iron-plate", 2},{dyworld_prefix_intermediate.."binding-copper", 1}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Category = "bullet",
		Cooldown = (60/2),
		Range = 15,
		Stack_Size = 5,
	},
	{
		Name = dyworld_prefix.."gun-sniper",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{dyworld_prefix.."gun-pistol", 1},{dyworld_prefix_intermediate.."binding-chitin", 1},{"iron-plate", 20}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Category = "sniper",
		Cooldown = (60*2),
		Range = 100,
		Stack_Size = 1,
	},
	{
		Name = dyworld_prefix.."gun-electric",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{dyworld_prefix.."gun-sniper", 1},{dyworld_prefix_intermediate.."binding-steel", 5},{dyworld_prefix_intermediate.."steel-stick", 3},{"iron-plate", 9}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Category = "electric",
		Cooldown = (60*1),
		Range = 50,
		Stack_Size = 1,
	},
}

function DyWorld_Gun_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Gun_Item(NAME, CATEGORY, COOLDOWN, RANGE, STACK_SIZE)
  local result =
  {
    type = "gun",
    name = NAME,
    icon = "__base__/graphics/icons/pistol.png",
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."gun",
    order = NAME,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = CATEGORY,
      cooldown = COOLDOWN,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = RANGE,
      sound = make_light_gunshot_sounds(),
    },
    stack_size = STACK_SIZE
  }
  return result
end

for k,v in pairs(Data_Table_Gun) do
data:extend(
	{
		DyWorld_Gun_Item(v.Name, v.Category, v.Cooldown, v.Range, v.Stack_Size),
		DyWorld_Gun_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech)
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end