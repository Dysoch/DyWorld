


data.raw.inserter["burner-inserter"].energy_source.fuel_category = "carbon"
data.raw.item["burner-inserter"].stack_size = 200
data.raw.item["burner-inserter"].subgroup = DyDs.."inserter-tier-1"
data.raw.item["burner-inserter"].order = "1"

data.raw.recipe["rocket-part"].hidden = false

data:extend({
  {
    type = "recipe",
    name = "offshore-pump",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "bronze-plate", amount = 5},
      },
      result = "offshore-pump",
      result_count = 1,
	  enabled = false,
	  energy_required = 1,
    },
  },
  {
    type = "recipe",
    name = "burner-inserter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 1},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "iron-ore", amount = 1},
      },
      result = "burner-inserter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-refinery",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "stone-brick", amount = 5},
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "steel-plate", amount = 10},
      },
      results = 
      {
        {type = "item", name = "oil-refinery", amount = 1},
      },
	  main_product = "oil-refinery",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "oil-extractor",
	category = "assembling-tier-2",
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
      result = "oil-extractor",
	  enabled = false,
	  energy_required = 2,
    },
  },
  {
    type = "recipe",
    name = "chemical-plant",
	category = "assembling-tier-2",
	main_product = "chemical-plant",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "copper-plate", amount = 10},
      },
      results = 
      {
        {type = "item", name = "chemical-plant", amount = 1},
      },
	  main_product = "chemical-plant",
	  energy_required = 10,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "engine-unit",
	category = "assembling-tier-2",
	main_product = "engine-unit",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 3},
        {type = "item", name = "rubber", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
		{type = "item", name = "motor", amount = 2},
      },
      results = 
      {
        {type = "item", name = "engine-unit", amount = 1},
      },
	  main_product = "engine-unit",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "concrete",
	category = "centrifuging",
	main_product = "concrete",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "concrete-powder", amount = 10},
        {type = "fluid", name = "water", amount = 100},
      },
      results = 
      {
        {type = "item", name = "concrete", amount_min = 8, amount_max = 10},
      },
	  main_product = "concrete",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "refined-concrete",
	category = "centrifuging",
	main_product = "refined-concrete",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "refined-concrete-powder", amount = 10},
        {type = "fluid", name = "water", amount = 100},
        {type = "fluid", name = "light-oil", amount = 50},
      },
      results = 
      {
        {type = "item", name = "refined-concrete", amount_min = 8, amount_max = 10},
      },
	  main_product = "refined-concrete",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "flying-robot-frame",
	category = "assembling-tier-2",
	main_product = "flying-robot-frame",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "heavy-oil", amount = 15},
        {type = "item", name = "steel-plate", amount = 3},
        {type = "item", name = "engine-unit", amount = 1},
        {type = "item", name = "control-board-1", amount = 2},
      },
      results = 
      {
        {type = "item", name = "flying-robot-frame", amount = 1},
      },
	  main_product = "flying-robot-frame",
	  energy_required = 2.5,
	  enabled = false,
    },
  },
	----- Satellite -----
  {
    type = "recipe",
    name = "satellite",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aluminium-plate", amount = 15},
        {type = "item", name = "magnesium-plate", amount = 5},
        {type = "item", name = "plastic-bar", amount = 10},
        {type = "item", name = "engine-unit", amount = 2},
        {type = "fluid", name = "petroleum-gas", amount = 50},
        {type = "item", name = "solar-cell", amount = 8},
      },
      result = "satellite",
	  enabled = false,
	  energy_required = 15,
    },
  },
})