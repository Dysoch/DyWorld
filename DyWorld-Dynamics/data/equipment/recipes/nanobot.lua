data:extend({
  {
    type = "recipe",
    name = "gun-nano-emitter",
	category = "assembling-tier-1",
	main_product = "gun-nano-emitter",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "control-board-1", amount = 2},
      },
      results = 
      {
        {type = "item", name = "gun-nano-emitter", amount = 1},
      },
	  main_product = "gun-nano-emitter",
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5*5},
        {type = "item", name = "control-board-1", amount = 2*5},
      },
      results = 
      {
        {type = "item", name = "gun-nano-emitter", amount = 1},
      },
	  main_product = "gun-nano-emitter",
	  energy_required = 5*5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "equipment-bot-chip-trees",
	category = "assembling-tier-2",
	main_product = "equipment-bot-chip-trees",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "red-wire", amount = 1},
        {type = "item", name = "control-board-1", amount = 6},
      },
      results = 
      {
        {type = "item", name = "equipment-bot-chip-trees", amount = 1},
      },
	  main_product = "equipment-bot-chip-trees",
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5*5},
        {type = "item", name = "red-wire", amount = 1*6},
        {type = "item", name = "control-board-1", amount = 6*5},
      },
      results = 
      {
        {type = "item", name = "equipment-bot-chip-trees", amount = 1},
      },
	  main_product = "equipment-bot-chip-trees",
	  energy_required = 15*5,
	  enabled = false,
    },
  },
})