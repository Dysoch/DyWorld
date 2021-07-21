



data:extend({
  {
    type = "item",
    name = "advanced-asteroid-miner",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-2",
    order = "0",
    stack_size = 1,
  },
	----- Stones -----
  {
    type = "item",
    name = "advanced-asteroid-miner-stone",
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
    subgroup = DyDs.."satellites-2",
    order = "1",
    stack_size = 1,
  },
	----- Coals -----
  {
    type = "item",
    name = "advanced-asteroid-miner-coal",
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
    subgroup = DyDs.."satellites-2",
    order = "1",
    stack_size = 1,
  },
})

for k,v in pairs(Dy_Metals) do
data:extend({
  {
    type = "item",
    name = "advanced-asteroid-miner-"..k,
	localised_name = {"looped-name.asteroid-miner-2", {"looped-name."..k}},
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
    subgroup = DyDs.."satellites-2",
    order = "2",
    stack_size = 1,
  },
})
end