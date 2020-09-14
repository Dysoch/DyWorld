data:extend({
  {
    type = "recipe",
    name = "ammo-nano-constructors",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 25},
        {type = "item", name = "copper-plate", amount = 10},
        {type = "item", name = "iron-plate", amount = 30},
        {type = "item", name = "bronze-plate", amount = 40},
        {type = "item", name = "copper-cable", amount = 50},
        {type = "item", name = "control-board-1", amount = 50},
      },
      result = "ammo-nano-constructors",
	  result_count = 1,
	  energy_required = 600,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 25*6},
        {type = "item", name = "copper-plate", amount = 10*6},
        {type = "item", name = "iron-plate", amount = 30*6},
        {type = "item", name = "bronze-plate", amount = 40*6},
        {type = "item", name = "copper-cable", amount = 50*6},
        {type = "item", name = "control-board-1", amount = 50*6},
      },
      result = "ammo-nano-constructors",
	  result_count = 1,
	  energy_required = 3600,
	  enabled = false,
    },
  },
})