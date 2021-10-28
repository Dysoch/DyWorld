

local DyWorld_Prototype_1 = DyDs_CopyPrototype("generator", "steam-engine", "gas-engine", true)
DyWorld_Prototype_1.fluid_box.filter = nil
DyWorld_Prototype_1.fluid_box.minimum_temperature = 0
DyWorld_Prototype_1.maximum_temperature = 100
DyWorld_Prototype_1.max_power_output = "500kW"
DyWorld_Prototype_1.energy_source.emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5
DyWorld_Prototype_1.fluid_usage_per_tick = (5 / 60)
DyWorld_Prototype_1.burns_fluid = true

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "gas-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."steam-engine",
    order = "2",
    place_result = "gas-engine",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "gas-engine",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "bronze-pipe", amount = 3},
        {type = "item", name = "basic-steam-engine", amount = 1},
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 25},
      },
      result = "gas-engine",
	  enabled = false,
	  energy_required = 2,
    },
  },
})