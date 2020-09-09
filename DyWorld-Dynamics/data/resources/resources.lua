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
        {name = resource_parameters.minable, amount_min = 1, amount_max = resource_parameters.amount_max or 1, probability = resource_parameters.minable_probability},
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

local function resource_ore(resource_parameters, autoplace_parameters)
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
        {name = resource_parameters.minable.."-impure", amount_min = 1, amount_max = 1, probability = (1 - resource_parameters.minable_probability)},
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

--for i = 1, 25 do
data:extend({
          -- Usually earlier order takes priority, but there's some special
          -- case buried in the code about resources removing other things
          -- (though maybe there shouldn't be, and we should just place things in a different order).
          -- Trees are "a", and resources will delete trees when placed.
          -- Oil is "c" so won't be placed if another resource is already there.
          -- "d" is available for another resource, but isn't used for now.

  
 ---------- IRON ----------
 
  
  resource_ore(
    {
      name = "iron-ore-10",
      --name = "iron-ore-".. i*4,
	  minable = "iron-ore",
	  minable_probability = 0.1,
	  --minable_probability = i*4 / 100,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.1},
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
  resource_ore(
    {
      name = "iron-ore-20",
	  minable = "iron-ore",
	  minable_probability = 0.2,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.2},
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
  resource_ore(
    {
      name = "iron-ore-30",
	  minable = "iron-ore",
	  minable_probability = 0.3,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.3},
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
  resource_ore(
    {
      name = "iron-ore-40",
	  minable = "iron-ore",
	  minable_probability = 0.4,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.4},
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
  resource_ore(
    {
      name = "iron-ore-50",
	  minable = "iron-ore",
	  minable_probability = 0.5,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.5},
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
  resource_ore(
    {
      name = "iron-ore-60",
	  minable = "iron-ore",
	  minable_probability = 0.6,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.6},
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
  resource_ore(
    {
      name = "iron-ore-70",
	  minable = "iron-ore",
	  minable_probability = 0.7,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.7},
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
  resource_ore(
    {
      name = "iron-ore-80",
	  minable = "iron-ore",
	  minable_probability = 0.8,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.8},
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
  resource_ore(
    {
      name = "iron-ore-90",
	  minable = "iron-ore",
	  minable_probability = 0.9,
      order = "c",
      map_color = {0.415, 0.525, 0.580, 0.9},
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
  
})
--end
 ---------- COPPER ----------

data:extend({ 
  
  resource_ore(
    {
      name = "copper-ore-5",
	  minable = "copper-ore",
	  minable_probability = 0.05,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.05},
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
  resource_ore(
    {
      name = "copper-ore-15",
	  minable = "copper-ore",
	  minable_probability = 0.15,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.15},
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
  resource_ore(
    {
      name = "copper-ore-25",
	  minable = "copper-ore",
	  minable_probability = 0.25,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.25},
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
  resource_ore(
    {
      name = "copper-ore-35",
	  minable = "copper-ore",
	  minable_probability = 0.35,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.35},
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
  resource_ore(
    {
      name = "copper-ore-45",
	  minable = "copper-ore",
	  minable_probability = 0.45,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.45},
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
  resource_ore(
    {
      name = "copper-ore-55",
	  minable = "copper-ore",
	  minable_probability = 0.55,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.55},
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
  resource_ore(
    {
      name = "copper-ore-65",
	  minable = "copper-ore",
	  minable_probability = 0.65,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.65},
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
  resource_ore(
    {
      name = "copper-ore-75",
	  minable = "copper-ore",
	  minable_probability = 0.75,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.75},
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
  resource_ore(
    {
      name = "copper-ore-85",
	  minable = "copper-ore",
	  minable_probability = 0.85,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.85},
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
  resource_ore(
    {
      name = "copper-ore-95",
	  minable = "copper-ore",
	  minable_probability = 0.95,
      order = "c",
      map_color = {0.803, 0.388, 0.215, 0.95},
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
	  minable_probability = 0.25,
      order = "c",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0, 0.25},
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
      mining_visualisation_tint = {0, 0, 0, 0.40},
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
      mining_visualisation_tint = {0, 0, 0, 0.50},
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
      mining_visualisation_tint = {0, 0, 0, 0.60},
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
      mining_visualisation_tint = {0, 0, 0, 0.75},
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
      mining_visualisation_tint = {0, 0, 0, 0.87},
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
	  minable = "limestone",
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
	  minable = "quartzite",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 2,
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
	  minable = "granite",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 5,
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
	  minable = "sandstone",
	  minable_probability = 1,
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 2.5,
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
  
 ---------- TREES ----------
  
  resource(
    {
      name = "treefarm",
	  minable = "wood",
	  minable_probability = 1,
	  amount_max = 30,
      order = "c",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 120,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-trees",
    },
    {
      has_starting_area_placement = true,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-stone",
    }
  ),
  
 ---------- TIN ----------
  
  resource_ore(
    {
      name = "tin-ore-20",
	  minable = "tin-ore",
	  minable_probability = 0.20,
      order = "b",
      map_color = {0.560, 0.545, 0.588, 0.20},
      mining_time = 0.5,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-0",
    },
    {
      has_starting_area_placement = false,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-tin",
    }
  ),
  resource_ore(
    {
      name = "tin-ore-40",
	  minable = "tin-ore",
	  minable_probability = 0.40,
      order = "b",
      map_color = {0.560, 0.545, 0.588, 0.40},
      mining_time = 0.5,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-0",
    },
    {
      has_starting_area_placement = true,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-tin",
    }
  ),
  resource_ore(
    {
      name = "tin-ore-60",
	  minable = "tin-ore",
	  minable_probability = 0.60,
      order = "b",
      map_color = {0.560, 0.545, 0.588, 0.60},
      mining_time = 0.5,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-0",
    },
    {
      has_starting_area_placement = false,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-tin",
    }
  ),
  resource_ore(
    {
      name = "tin-ore-80",
	  minable = "tin-ore",
	  minable_probability = 0.8,
      order = "b",
      map_color = {0.560, 0.545, 0.588, 0.80},
      mining_time = 0.5,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-0",
    },
    {
      has_starting_area_placement = true,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-tin",
    }
  ),
  resource_ore(
    {
      name = "tin-ore-95",
	  minable = "tin-ore",
	  minable_probability = 0.95,
      order = "b",
      map_color = {0.560, 0.545, 0.588, 0.95},
      mining_time = 0.5,
      walking_sound = ore_sound,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
	  category = "resource-solid-tier-0",
    },
    {
      has_starting_area_placement = false,
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
	  autoplace_control_name = "deposit-tin",
    }
  ),
})


data.raw.resource.treefarm.infinite = true
data.raw.resource.treefarm.highlight = false
data.raw.resource.treefarm.minimum = 600
data.raw.resource.treefarm.normal = 600
data.raw.resource.treefarm.infinite_depletion_amount = 1
data.raw.resource.treefarm.minable.fluid_amount = 500
data.raw.resource.treefarm.minable.required_fluid = "water"