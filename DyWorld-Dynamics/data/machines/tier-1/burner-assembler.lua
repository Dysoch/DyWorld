

local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "burner-assembler", true)
DyWorld_Prototype_1.crafting_categories = {"assembling-tier-1"}
DyWorld_Prototype_1.resistances = Resist_Tier_1(0.75)
DyWorld_Prototype_1.fast_replaceable_group = "crafting"
DyWorld_Prototype_1.next_upgrade = "basic-assembler"
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_1.energy_source = {
      type = "burner",
      fuel_category = "carbon",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 8 or Dy_Sett.Difficulty == "Normal" and 24 or Dy_Sett.Difficulty == "Hard" and 72 or 5,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    }


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "burner-assembler",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."burner-machines",
    order = "burner-assembler",
    place_result = "burner-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "burner-assembler",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "tin-plate", amount = 1},
      },
      result = "burner-assembler",
	  enabled = false,
	  energy_required = 2,
    },
  },
})