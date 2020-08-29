local noise = require("noise")
local tne = noise.to_noise_expression
local resource_autoplace = require("resource-autoplace")

ore_sound =
{
  {
    filename = "__base__/sound/walking/resources/ore-01.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-02.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-03.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-04.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-05.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-06.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-07.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-08.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-09.ogg",
    volume = 0.7
  },
  {
    filename = "__base__/sound/walking/resources/ore-10.ogg",
    volume = 0.7
  }
}

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set("iron-ore", true)
resource_autoplace.initialize_patch_set("copper-ore", true)
resource_autoplace.initialize_patch_set("coal", false)
resource_autoplace.initialize_patch_set("browncoal", true)
resource_autoplace.initialize_patch_set("limestone", true)
resource_autoplace.initialize_patch_set("quartzite", false)
resource_autoplace.initialize_patch_set("granite", false)
resource_autoplace.initialize_patch_set("sandstone", true)

local function resource(resource_parameters, autoplace_parameters)
  if coverage == nil then coverage = 0.02 end

  return
  {
    type = "resource",
    name = resource_parameters.name,
    --icon = "__base__/graphics/icons/" .. resource_parameters.name .. ".png",
    icon = "__base__/graphics/icons/stone.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = resource_parameters.category,
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = resource_parameters.mining_time,
      results = {
        {name = resource_parameters.minable, amount_min = 1, amount_max = 1, probability = resource_parameters.minable_probability},
      }
    },
    walking_sound = resource_parameters.walking_sound,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      base_density = autoplace_parameters.base_density,
      has_starting_area_placement = autoplace_parameters.has_starting_area_placement,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
	  autoplace_control_name = autoplace_parameters.autoplace_control_name,
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        --filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        filename = "__base__/graphics/entity/stone/stone.png",
		tint = resource_parameters.map_color,
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          --filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/hr-" .. resource_parameters.name .. ".png",
          filename = "__base__/graphics/entity/stone/hr-stone.png",
		  tint = resource_parameters.map_color,
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint
  }
end

data:extend({
          -- Usually earlier order takes priority, but there's some special
          -- case buried in the code about resources removing other things
          -- (though maybe there shouldn't be, and we should just place things in a different order).
          -- Trees are "a", and resources will delete trees when placed.
          -- Oil is "c" so won't be placed if another resource is already there.
          -- "d" is available for another resource, but isn't used for now.

  
 ---------- IRON ----------
 
  
  resource(
    {
      name = "iron-ore-10",
	  minable = "iron-ore",
	  minable_probability = 0.1,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-20",
	  minable = "iron-ore",
	  minable_probability = 0.2,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-30",
	  minable = "iron-ore",
	  minable_probability = 0.3,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-40",
	  minable = "iron-ore",
	  minable_probability = 0.4,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-50",
	  minable = "iron-ore",
	  minable_probability = 0.5,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-60",
	  minable = "iron-ore",
	  minable_probability = 0.6,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-70",
	  minable = "iron-ore",
	  minable_probability = 0.7,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-80",
	  minable = "iron-ore",
	  minable_probability = 0.8,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  resource(
    {
      name = "iron-ore-90",
	  minable = "iron-ore",
	  minable_probability = 0.9,
      order = "c",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
	  base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-iron",
    }
  ),
  
 ---------- COPPER ----------
 
  
  resource(
    {
      name = "copper-ore-5",
	  minable = "copper-ore",
	  minable_probability = 0.05,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-15",
	  minable = "copper-ore",
	  minable_probability = 0.15,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-25",
	  minable = "copper-ore",
	  minable_probability = 0.25,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-35",
	  minable = "copper-ore",
	  minable_probability = 0.35,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-45",
	  minable = "copper-ore",
	  minable_probability = 0.45,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-55",
	  minable = "copper-ore",
	  minable_probability = 0.55,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-65",
	  minable = "copper-ore",
	  minable_probability = 0.65,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-75",
	  minable = "copper-ore",
	  minable_probability = 0.75,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-85",
	  minable = "copper-ore",
	  minable_probability = 0.85,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  resource(
    {
      name = "copper-ore-95",
	  minable = "copper-ore",
	  minable_probability = 0.95,
      order = "c",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
	  autoplace_control_name = "deposit-copper",
    }
  ),
  
 ---------- COAL ----------
 
  
  resource(
    {
      name = "coal-25",
	  minable = "coal",
	  minable_probability = .25,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-coal",
    }
  ),
  resource(
    {
      name = "coal-40",
	  minable = "coal",
	  minable_probability = 0.4,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-coal",
    }
  ),
  resource(
    {
      name = "coal-50",
	  minable = "coal",
	  minable_probability = 0.5,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-coal",
    }
  ),
  resource(
    {
      name = "coal-60",
	  minable = "coal",
	  minable_probability = 0.6,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-coal",
    }
  ),
  resource(
    {
      name = "coal-75",
	  minable = "coal",
	  minable_probability = 0.75,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-coal",
    }
  ),
  resource(
    {
      name = "coal-87",
	  minable = "coal",
	  minable_probability = 0.87,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-coal",
    }
  ),
  
 ---------- STONES ----------
 
  resource(
    {
      name = "limestone",
	  minable = "stone",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-0",
    },
    {
      has_starting_area_placement = true,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-stone",
    }
  ),
  resource(
    {
      name = "quartzite",
	  minable = "stone",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = false,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-stone",
    }
  ),
  resource(
    {
      name = "granite",
	  minable = "stone",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-2",
    },
    {
      has_starting_area_placement = false,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-stone",
    }
  ),
  resource(
    {
      name = "sandstone",
	  minable = "stone",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 1,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-1",
    },
    {
      has_starting_area_placement = true,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-stone",
    }
  ),
})
