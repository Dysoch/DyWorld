

local DyWorld_Prototype_0 = DyDs_CopyPrototype("electric-pole", "small-electric-pole", "basic-power-pole", true)
DyWorld_Prototype_0.resistances = Resist_Tier_1(0.6)
DyWorld_Prototype_0.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value

data:extend({
  DyWorld_Prototype_0,
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

local DyWorld_Prototype_1 = DyDs_CopyPrototype("electric-pole", "medium-electric-pole", "advanced-power-pole", true)
DyWorld_Prototype_1.maximum_wire_distance = 15
DyWorld_Prototype_1.supply_area_distance = 4.5

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "advanced-power-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."power-transfer",
    order = "2",
    place_result = "advanced-power-pole",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-power-pole",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3},
        {type = "item", name = "copper-cable", amount = 4},
        {type = "item", name = "rubber", amount = 2},
      },
      result = "advanced-power-pole",
      result_count = 1,
	  enabled = false,
	  energy_required = 2.5,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("electric-pole", "big-electric-pole", "basic-power-relay", true)
DyWorld_Prototype_2.maximum_wire_distance = 32
data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "power"
DyWorld_Prototype_2.fast_replaceable_group = "power"
DyWorld_Prototype_2.maximum_wire_distance = 32
DyWorld_Prototype_2.supply_area_distance = 7

data:extend({
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "basic-power-relay",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."power-transfer",
    order = "4",
    place_result = "basic-power-relay",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-power-relay",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3},
        {type = "item", name = "copper-cable", amount = 4},
        {type = "item", name = "rubber", amount = 2},
      },
      result = "basic-power-relay",
      result_count = 1,
	  enabled = false,
	  energy_required = 2.5,
    },
  },
})