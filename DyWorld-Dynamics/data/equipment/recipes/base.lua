data:extend({
  {
    type = "recipe",
    name = "solar-panel-equipment",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      results = 
      {
        {type = "item", name = "solar-panel-equipment", amount = 1},
      },
	  main_product = "solar-panel-equipment",
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "belt-immunity-equipment",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "bronze-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 1},
        {type = "item", name = "control-board-1", amount = 5},
      },
      results = 
      {
        {type = "item", name = "belt-immunity-equipment", amount = 1},
      },
	  main_product = "belt-immunity-equipment",
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "night-vision-equipment",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "green-wire", amount = 2},
        {type = "item", name = "rubber", amount = 3},
        {type = "item", name = "control-board-1", amount = 1},
      },
      results = 
      {
        {type = "item", name = "night-vision-equipment", amount = 1},
      },
	  main_product = "night-vision-equipment",
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "exoskeleton-equipment",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 5},
        {type = "item", name = "aluminium-plate", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
      },
      results = 
      {
        {type = "item", name = "exoskeleton-equipment", amount = 1},
      },
	  main_product = "exoskeleton-equipment",
	  energy_required = 15,
	  enabled = false,
    },
  },
})