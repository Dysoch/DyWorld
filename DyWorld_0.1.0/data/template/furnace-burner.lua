require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

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
    subgroup = "smelting-machine",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Furnace_Burner_Entity(NAME, HEALTH, TINT, ENERGY, SPEED, EFFECTIVITY, POLLUTION)
  local result =
  {
    type = "furnace",
    name = NAME,
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = NAME},
    max_health = HEALTH,
    corpse = "medium-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg", }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "explosion",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = ENERGY,
    crafting_speed = SPEED,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      effectivity = EFFECTIVITY,
      fuel_inventory_size = 1,
      emissions = POLLUTION,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
      priority = "extra-high",
      width = 81,
      height = 64,
      frame_count = 1,
      shift = {0.515625, 0.0625},
	  tint = TINT
    },
    working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
          priority = "extra-high",
          line_length = 8,
          width = 22,
          height = 87,
          frame_count = 48,
          axially_symmetrical = false,
          direction_count = 1,
          shift = {0.0625, -0.453125},
        },
        light = {intensity = 1, size = 1}
      }
    },
    fast_replaceable_group = "furnace"
  }
  return result
end

for k,v in pairs(Data_Table_Furnace_Burner) do
data:extend(
	{
		DyWorld_Furnace_Burner_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Speed, v.Effectivity, v.Pollution),
		DyWorld_Furnace_Burner_Item(v.Name, v.Stack),
		DyWorld_Furnace_Burner_Recipe(v.Name, v.Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end