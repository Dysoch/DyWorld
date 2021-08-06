

local DyWorld_Prototype_1 = DyDs_CopyPrototype("storage-tank", "storage-tank", "storage-tank-1", true)
DyWorld_Prototype_1.minable = {mining_time = 0.5, result = "storage-tank-1"}
DyWorld_Prototype_1.flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"}
DyWorld_Prototype_1.fast_replaceable_group = "pipe"
DyWorld_Prototype_1.fluid_box.base_area = 1000
DyWorld_Prototype_1.icon = nil
DyWorld_Prototype_1.icons = 
	{
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Tier_1,
	  },
	}
DyWorld_Prototype_1.pictures.picture.sheets[1].tint = Tier_1 
DyWorld_Prototype_1.pictures.picture.sheets[1].hr_version.tint = Tier_1 

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "storage-tank-1",
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Tier_1,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."pipe-storage",
    order = "1",
    place_result = "storage-tank-1",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "storage-tank-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 25},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "storage-tank-1",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
    
  },
})