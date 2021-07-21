

local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "nano-assembler", true)
DyWorld_Prototype_1.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_1.crafting_categories = {"assembling-tier-1", "assembling-tier-2", "assembling-tier-3", "assembling-tier-4"}
DyWorld_Prototype_1.energy_usage = "10000kW"
DyWorld_Prototype_1.crafting_speed = 10
DyWorld_Prototype_1.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_1.resistances = Resist_Tier_1(1)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_1.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 25,
    }


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "nano-assembler",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "4",
    place_result = "nano-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "nano-assembler",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-4", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 12},
      },
      result = "nano-assembler",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
})