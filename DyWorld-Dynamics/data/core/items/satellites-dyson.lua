


for i = 1,5 do
data:extend({
  {
    type = "item",
    name = "basic-dyson-satellite-"..i,
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-3",
    order = (-1 + i),
    stack_size = 1,
  },
  {
    type = "item",
    name = "advanced-dyson-satellite-"..i,
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-3",
    order = (i+4),
    stack_size = 1,
  },
  {
    type = "item",
    name = "basic-dyson-sphere-comp-"..i,
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-4",
    order = (-1 + i),
    stack_size = 1,
  },
  {
    type = "item",
    name = "advanced-dyson-sphere-comp-"..i,
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."satellites-4",
    order = (i+4),
    stack_size = 1,
  },
})
end