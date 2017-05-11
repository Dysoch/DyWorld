require "data/prefix"

Data_Table_Miner_Burner = {
	{
		Name = dyworld_prefix.."drill-burner-1",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3},{"iron-plate", 10},{"copper-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = 0.25,
		Effectivity = 0.75,
		Pollution = 5,
		Energy = "250kW",
		Power = 1.5,
		Radius = 0.99,
	},
	{
		Name = dyworld_prefix.."drill-burner-2",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{dyworld_prefix.."drill-burner-1", 1},{"iron-plate", 10}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 150,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = 0.3,
		Effectivity = 1,
		Pollution = 10,
		Energy = "350kW",
		Power = 2.5,
		Radius = 0.99,
	},
}

function DyWorld_Miner_Burner_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Miner_Burner_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."extraction",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Miner_Burner_Entity(NAME, HEALTH, TINT, SPEED, EFFECTIVITY, POLLUTION, ENERGY, POWER, RADIUS)
  local result =
  {
    type = "mining-drill",
    name = NAME,
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 1, result = NAME},
    max_health = HEALTH,
    corpse = "medium-remnants",
    collision_box = {{ -0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{ -1, -1}, {1, 1}},
    mining_speed = SPEED,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/burner-mining-drill.ogg",
        volume = 0.8
      },
    },
    energy_source =
    {
      type = "burner",
      effectivity = EFFECTIVITY,
      fuel_inventory_size = 1,
      emissions = (POLLUTION/10) / POLLUTION,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    },
    energy_usage = ENERGY,
    mining_power = POWER,
    animations =
    {
      north =
      {
        layers = 
        {
          {
            priority = "extra-high",
            width = 87,
            height = 95,
            line_length = 4,
            shift = util.by_pixel(2.5, 0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = TINT,
            hr_version = {
              priority = "extra-high",
              width = 173,
              height = 188,
              line_length = 4,
              shift = util.by_pixel(2.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = TINT
            }
          },
          {
            priority = "extra-high",
            width = 109,
            height = 76,
            line_length = 4,
            shift = util.by_pixel(23.5, -1),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              priority = "extra-high",
              width = 217,
              height = 150,
              line_length = 4,
              shift = util.by_pixel(23.75, -1),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
      east =
      {
        layers =
        {
          {
            priority = "extra-high",
            width = 93,
            height = 84,
            line_length = 4,
            shift = util.by_pixel(2.5, 1),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = TINT,
            hr_version = {
              priority = "extra-high",
              width = 185,
              height = 168,
              line_length = 4,
              shift = util.by_pixel(2.75, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-E.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = TINT
            },
          },
          {
            priority = "extra-high",
            width = 93,
            height = 65,
            line_length = 4,
            shift = util.by_pixel(13.5, 0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              width = 185,
              height = 128,
              line_length = 4,
              shift = util.by_pixel(13.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-E-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
      south =
      {
        layers =
        {
          {
            priority = "extra-high",
            width = 87,
            height = 87,
            line_length = 4,
            shift = util.by_pixel(0.5, -0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = TINT,
            hr_version = {
              priority = "extra-high",
              width = 174,
              height = 174,
              line_length = 4,
              shift = util.by_pixel(0.5, -0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-S.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = TINT
            },
          },
          {
            priority = "extra-high",
            width = 88,
            height = 69,
            line_length = 4,
            shift = util.by_pixel(11, 2.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              priority = "extra-high",
              width = 174,
              height = 137,
              line_length = 4,
              shift = util.by_pixel(11, 2.75),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-S-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
      west =
      {
        layers =
        {
          {
            priority = "extra-high",
            width = 91,
            height = 88,
            line_length = 4,
            shift = util.by_pixel(-1.5, 0),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = TINT,
            hr_version = {
              priority = "extra-high",
              width = 180,
              height = 176,
              line_length = 4,
              shift = util.by_pixel(-1.5, 0),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-W.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = TINT
            },
          },
          {
            priority = "extra-high",
            width = 89,
            height = 66,
            line_length = 4,
            shift = util.by_pixel(7.5, 1),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              priority = "extra-high",
              width = 176,
              height = 130,
              line_length = 4,
              shift = util.by_pixel(7.5, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-W-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    resource_searching_radius = RADIUS,
    vector_to_place_result = {-0.5, -1.3},
    fast_replaceable_group = "mining-drill",
    circuit_wire_connection_points =
    {
      get_circuit_connector_wire_shifting_for_connector({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17),
      get_circuit_connector_wire_shifting_for_connector({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17),
      get_circuit_connector_wire_shifting_for_connector({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17),
      get_circuit_connector_wire_shifting_for_connector({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17)
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17),
      get_circuit_connector_sprites({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17),
      get_circuit_connector_sprites({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17),
      get_circuit_connector_sprites({-0.46875, 0.09375}, {-0.46875, 0.09375}, 17)
    },
    circuit_wire_max_distance = 9,
  }
  return result
end

for k,v in pairs(Data_Table_Miner_Burner) do
data:extend(
	{
		DyWorld_Miner_Burner_Entity(v.Name, v.Health, v.Tint, v.Speed, v.Effectivity, v.Pollution, v.Energy, v.Power, v.Radius),
		DyWorld_Miner_Burner_Item(v.Name, v.Stack),
		DyWorld_Miner_Burner_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end