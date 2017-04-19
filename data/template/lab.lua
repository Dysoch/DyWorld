require "data/data-templates"
require "data/prefix"

function DyWorld_Lab_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Lab_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Lab_Entity(NAME, HEALTH, TINT, ENERGY, SPEED, MODULES)
  local result =
  {
    type = "lab",
    name = NAME,
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = NAME},
    max_health = HEALTH,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15},
	  tint = TINT
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15},
	  tint = TINT
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = ENERGY,
    researching_speed = SPEED,
    inputs = {},
    module_specification =
    {
      module_slots = MODULES,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  }
  return result
end

for k,v in pairs(Data_Table_Lab) do
data:extend(
	{
		DyWorld_Lab_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Speed, v.Modules),
		DyWorld_Lab_Item(v.Name, v.Stack),
		DyWorld_Lab_Recipe(v.Name, v.Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
	for _,z in pairs(v.Lab_Ingredients) do
		table.insert(data.raw.lab[v.Name].inputs,z)
	end
	if v.Name == dyworld_prefix_t.."lab-1-"..primitive then
		data.raw.lab[v.Name].energy_source = {type = "burner", effectivity = 1000, fuel_inventory_size = 1}
	end
	if v.Tech then
	local result = {type = "unlock-recipe", recipe = v.Name}
		table.insert(data.raw.technology[v.Tech_Name].effects,result)
	end
end