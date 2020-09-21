

local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "bloomery", true)
DyWorld_Prototype_1.icon = "__base__/graphics/icons/electric-furnace.png"
DyWorld_Prototype_1.crafting_categories = {"bloomery"}
DyWorld_Prototype_1.energy_usage = "500W"
DyWorld_Prototype_1.crafting_speed = 1
DyWorld_Prototype_1.corpse = "electric-furnace-remnants"
DyWorld_Prototype_1.dying_explosion = "electric-furnace-explosion"
DyWorld_Prototype_1.animation = data.raw.furnace["electric-furnace"].animation
DyWorld_Prototype_1.working_visualisations = data.raw.furnace["electric-furnace"].working_visualisations
DyWorld_Prototype_1.water_reflection = data.raw.furnace["electric-furnace"].water_reflection
DyWorld_Prototype_1.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 5,
    }


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "bloomery",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "bloomery",
    place_result = "bloomery",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "bloomery",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "bloomery",
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
      result = "bloomery",
	  enabled = false,
	  energy_required = 25,
    },
  },
})