

local DyWorld_Prototype_1 = DyDs_CopyPrototype("storage-tank", "storage-tank", "storage-tank-2", true)
DyWorld_Prototype_1.minable = {mining_time = 0.5, result = "storage-tank-2"}
DyWorld_Prototype_1.flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"}
DyWorld_Prototype_1.fast_replaceable_group = "pipe"
DyWorld_Prototype_1.fluid_box.base_area = 5000
DyWorld_Prototype_1.icon = nil
DyWorld_Prototype_1.icons = 
	{
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Tier_2,
	  },
	}
DyWorld_Prototype_1.pictures.picture.sheets[1].tint = Tier_2 
DyWorld_Prototype_1.pictures.picture.sheets[1].hr_version.tint = Tier_2 

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "storage-tank-2",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Tier_2,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."pipe-storage",
    order = "2",
    place_result = "storage-tank-2",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "storage-tank-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 25},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "storage-tank-2",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
    
  },
})