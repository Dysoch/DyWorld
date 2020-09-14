

local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "basic-assembler", true)
DyWorld_Prototype_1.icon = "__base__/graphics/icons/assembling-machine-2.png"
DyWorld_Prototype_1.crafting_categories = {"assembling-tier-1", "assembling-tier-2"}
DyWorld_Prototype_1.energy_usage = "125kW"
DyWorld_Prototype_1.crafting_speed = 1
DyWorld_Prototype_1.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 5,
    }


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-assembler",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "basic-assembler",
    place_result = "basic-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-assembler",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "basic-assembler",
	  enabled = false,
	  energy_required = 5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 8*4},
        {type = "item", name = "bronze-plate", amount = 2*3},
      },
      result = "basic-assembler",
	  enabled = false,
	  energy_required = 25,
    },
  },
})