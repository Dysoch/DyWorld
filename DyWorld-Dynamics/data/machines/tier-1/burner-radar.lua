

local DyWorld_Prototype_1 = DyDs_CopyPrototype("radar", "radar", "burner-radar", true)
DyWorld_Prototype_1.energy_source = {
      type = "burner",
      fuel_category = "carbon",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 2,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    }
DyWorld_Prototype_1.resistances = Resist_Tier_1(0.5)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "burner-radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "1",
    place_result = "burner-radar",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "burner-radar",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "iron-plate", amount = 6},
        {type = "item", name = "copper-plate", amount = 1},
      },
      result = "burner-radar",
	  enabled = false,
	  energy_required = 2,
    },
  },
})