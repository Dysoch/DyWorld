require "data/prefix"

Data_Table_Locomotive = {
	{
		Name = dyworld_prefix.."locomotive-1",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"locomotive", 1},{"advanced-circuit", 25},{"steel-plate", 15}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 5,
		Health = 2500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Effectivity = 1.5,
		Weight = 2500,
		Max_Speed = 1.5,
		Max_Power = tostring(600*1.5).."kW",
		Brake = 15,
	},
	{
		Name = dyworld_prefix.."locomotive-2",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{dyworld_prefix.."locomotive-1", 1},{"advanced-circuit", 25},{"steel-plate", 15}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 5,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Effectivity = 2,
		Weight = 3000,
		Max_Speed = 2,
		Max_Power = tostring(600*2).."kW",
		Brake = 20,
	},
	{
		Name = dyworld_prefix.."locomotive-3",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{dyworld_prefix.."locomotive-2", 1},{"advanced-circuit", 25},{"steel-plate", 15}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 5,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Effectivity = 3,
		Weight = 4000,
		Max_Speed = 3,
		Max_Power = tostring(600*2.5).."kW",
		Brake = 35,
	},
	{
		Name = dyworld_prefix.."locomotive-4",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{dyworld_prefix.."locomotive-3", 1},{"advanced-circuit", 25},{"steel-plate", 15}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 5,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Effectivity = 5,
		Weight = 5000,
		Max_Speed = 5,
		Max_Power = tostring(600*2).."kW",
		Brake = 50,
	},
}

data.raw["cargo-wagon"]["cargo-wagon"].max_speed = 10

function DyWorld_Locomotive_Recipe(DATA)
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

function DyWorld_Locomotive_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."railway",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

function DyWorld_Locomotive_Entity(DATA)
  local result =
  {
    type = "locomotive",
    name = DATA.Name,
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 1, result = DATA.Name},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = DATA.Health,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    drawing_box = {{-1, -4}, {1, 3}},
    weight = DATA.Weight,
    max_speed = DATA.Max_Speed,
    max_power = DATA.Max_Power,
    reversing_power_modifier = 0.6,
    braking_force = DATA.Brake,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 10,
        percent = 20
      }
    },
    burner =
    {
      fuel_category = "chemical",
      effectivity = DATA.Effectivity,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.1,
        }
      }
    },
    front_light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 238,
          height = 230,
          direction_count = 256,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
		  tint = DATA.Tint,
          hr_version =
            {
            priority = "very-low",
            width = 474,
            height = 458,
            direction_count = 256,
            filenames =
            {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-1.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-2.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-3.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-4.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-5.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-6.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-7.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-8.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-9.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-10.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-11.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-12.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-13.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-14.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-15.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-16.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0.0, -0.5},
            scale = 0.5,
			tint = DATA.Tint,
            }
        },
        {
          priority = "very-low",
          flags = { "mask" },
          width = 236,
          height = 228,
          direction_count = 256,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          apply_runtime_tint = true,
          hr_version =
            {
              priority = "very-low",
              flags = { "mask" },
              width = 472,
              height = 456,
              direction_count = 256,
              filenames =
              {
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-1.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-2.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-3.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-4.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-5.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-6.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-7.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-8.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-9.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-10.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-11.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-12.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-13.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-14.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-15.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-16.png"
              },
              line_length = 4,
              lines_per_file = 4,
              shift = {0.0, -0.5},
              apply_runtime_tint = true,
              scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "shadow" },
          width = 253,
          height = 212,
          direction_count = 256,
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {1, 0.3}
        }
      }
    },
    wheels = standard_train_wheels,
    rail_category = "regular",
    stop_trigger =
    {
      -- left side
      {
        type = "create-smoke",
        repeat_count = 125,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-smoke",
        repeat_count = 125,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/train-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.4
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.5;
  }
  return result
end

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

for k,v in pairs(Data_Table_Locomotive) do
data:extend(
	{
		DyWorld_Locomotive_Entity(v),
		DyWorld_Locomotive_Item(v),
		DyWorld_Locomotive_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end