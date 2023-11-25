



data:extend(
{
  {
    type = "assembling-machine",
    name = "caster",
    icons = 
	{
	  {
		icon = Dy_icon.."greenhouse.png",
	    --tint = Color_Tier[i],
	  },
	},
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "caster"},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = Dy_Diff(2500, 0, nil),
    crafting_speed = Dy_Diff(1, 1, "crafting"),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "caster",
    crafting_categories = {DyDs.."casting"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5,
    },
    energy_usage = "750kW",
    ingredient_count = 25,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      off_when_no_fluid_recipe = true,
    },
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = Dy_entity.."greenhouse.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15},
	  --tint = Color_Tier[i],
    },
    working_visualisations =
    {
      {
        light = {intensity = 1, size = 6},
        animation =
        {
          filename = Dy_entity.."greenhouse-light.png",
          width = 113,
          height = 91,
          frame_count = 1,
          shift = {0.2, 0.15}
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = "caster",
    icons = 
	{
	  {
		icon = Dy_icon.."greenhouse.png",
	    --tint = Color_Tier[i],
	  },
	},
    icon_size = 32,
    flags = {},
    subgroup = DyDs.."assemblers",
    order = "caster",
    place_result = "caster",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "caster",
	--category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "basic-circuit", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        --{type = "item", name = "bronze-plate", amount = 2},
      },
      result = "caster",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

DyW.Tech.Recipe.Add("metallurgy", "caster")