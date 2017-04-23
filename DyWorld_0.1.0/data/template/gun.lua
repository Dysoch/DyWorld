require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

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
    subgroup = "gun",
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
    stack_size = 5
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