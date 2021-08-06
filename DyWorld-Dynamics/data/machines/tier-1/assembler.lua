

local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "basic-assembler", true)
DyWorld_Prototype_1.icon = "__base__/graphics/icons/assembling-machine-2.png"
DyWorld_Prototype_1.crafting_categories = {"assembling-tier-1", "assembling-tier-2"}
DyWorld_Prototype_1.energy_usage = "500kW"
DyWorld_Prototype_1.crafting_speed = 1
DyWorld_Prototype_1.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_1.resistances = Resist_Tier_1(1)
DyWorld_Prototype_1.fast_replaceable_group = "crafting"
DyWorld_Prototype_1.next_upgrade = "advanced-assembler"
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_1.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5,
    }
local DyWorld_Prototype_2 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "advanced-assembler", true)
DyWorld_Prototype_2.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_2.crafting_categories = {"assembling-tier-1", "assembling-tier-2", "assembling-tier-3"}
DyWorld_Prototype_2.energy_usage = "2000kW"
DyWorld_Prototype_2.crafting_speed = 2.5
DyWorld_Prototype_2.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_2.resistances = Resist_Tier_1(3.5)
DyWorld_Prototype_2.fast_replaceable_group = "crafting"
DyWorld_Prototype_2.next_upgrade = "nano-assembler"
DyWorld_Prototype_2.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_2.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 10 or Dy_Sett.Difficulty == "Normal" and 30 or Dy_Sett.Difficulty == "Hard" and 90 or 5,
    }


data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "basic-assembler",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "2",
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
  },
  {
    type = "item",
    name = "advanced-assembler",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "3",
    place_result = "advanced-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-assembler",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 12},
      },
      result = "advanced-assembler",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
})