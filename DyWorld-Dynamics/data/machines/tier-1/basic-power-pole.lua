

local DyWorld_Prototype_1 = DyDs_CopyPrototype("electric-pole", "small-electric-pole", "basic-power-pole", true)
DyWorld_Prototype_1.resistances = Resist_Tier_1(0.6)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-power-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."power-transfer",
    order = "1",
    place_result = "basic-power-pole",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-power-pole",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "wood", amount = 4},
        {type = "item", name = "bronze-plate", amount = 1},
      },
      result = "basic-power-pole",
      result_count = 4,
	  enabled = false,
	  energy_required = 1,
    },
  },
})