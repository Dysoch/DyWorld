



data:extend({
	----- Random Ores -----
  {
    type = "item",
    name = "asteroid-miner",
	  icons = {
	    {
		    icon = "__base__/graphics/icons/satellite.png",
	    },
	  },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-1",
    order = "0",
    stack_size = 1,
    rocket_launch_products = {
      {type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.05},
      {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.125},
      {type = "item", name = "copper-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.135},
      {type = "item", name = "tin-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.13},
      {type = "item", name = "magnesium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.06},
      {type = "item", name = "aluminium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.07},
      {type = "item", name = "gold-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.03},
      {type = "item", name = "lead-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.03},
      {type = "item", name = "silver-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.03},
      {type = "item", name = "uranium-ore", amount_min = 1, amount_max = 1000, probability = 0.025},
      {type = "item", name = "lignite", amount_min = 1, amount_max = 1000, probability = 0.21},
      {type = "item", name = "coal", amount_min = 1, amount_max = 1000, probability = 0.105},
      {type = "item", name = "sandstone", amount_min = 1, amount_max = 1000, probability = 0.17},
      {type = "item", name = "granite", amount_min = 1, amount_max = 1000, probability = 0.16},
      {type = "item", name = "quartzite", amount_min = 1, amount_max = 1000, probability = 0.14},
      {type = "item", name = "limestone", amount_min = 1, amount_max = 1000, probability = 0.24},
      {type = "item", name = "resin", amount_min = 1, amount_max = 1000, probability = 0.05},
      {type = "item", name = "ilmenite", amount_min = 1, amount_max = 1000, probability = 0.085},
      {type = "item", name = "biotite", amount_min = 1, amount_max = 1000, probability = 0.06},
      {type = "item", name = "sand", amount_min = 1, amount_max = 5000, probability = 0.09},
	  },
  },
	----- uranium Ores -----
  {
    type = "item",
    name = "asteroid-miner-uranium",
    icons = {
      {
        icon = "__base__/graphics/icons/satellite.png",
      },
      {
        icon = data.raw.item["uranium-ore"].icon,
        scale = 0.25,
        shift = {-8, 9},
      },
    },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-1",
    order = "1",
    stack_size = 1,
  },
	----- Stones -----
  {
    type = "item",
    name = "asteroid-miner-stone",
    icons = {
      {
        icon = "__base__/graphics/icons/satellite.png",
      },
      {
        icon = data.raw.tool["limestone"].icons[1].icon,
        tint = data.raw.tool["limestone"].icons[1].tint,
        scale = 0.25,
        shift = {-8, 9},
      },
	  },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-1",
    order = "1",
    stack_size = 1,
  },
	----- Coals -----
  {
    type = "item",
    name = "asteroid-miner-coal",
	  icons = {
      {
        icon = "__base__/graphics/icons/satellite.png",
      },
      {
        icon = data.raw.tool["coal"].icon,
        scale = 0.25,
        shift = {-8, 9},
      },
    },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-1",
    order = "1",
    stack_size = 1,
  },
})

for k,v in pairs(Dy_Metals) do
data:extend({
  {
    type = "item",
    name = "asteroid-miner-"..k,
  	localised_name = {"looped-name.asteroid-miner-1", {"looped-name."..k}},
	  icons = {
      {
        icon = "__base__/graphics/icons/satellite.png",
      },
      {
        icon = DyDs_path_icon.."ores/pure-ore.png",
        tint = Dy_Metal_Colors[k],
        scale = 0.25,
        shift = {-8, 9},
      },
    },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-1",
    order = "1",
    stack_size = 1,
  },
})
end