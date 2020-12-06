



data:extend({
  { 
	type = "recipe",
	name = "aai-strongbox",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 18},
      },
      result = "aai-strongbox",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-strongbox-passive-provider",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-strongbox", amount = 1},
        {type = "item", name = "control-board-2", amount = 4},
      },
      result = "aai-strongbox-passive-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-strongbox-active-provider",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-strongbox", amount = 1},
        {type = "item", name = "control-board-2", amount = 7},
      },
      result = "aai-strongbox-active-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-strongbox-buffer",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-strongbox", amount = 1},
        {type = "item", name = "control-board-2", amount = 7},
      },
      result = "aai-strongbox-buffer",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-strongbox-storage",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-strongbox", amount = 1},
        {type = "item", name = "control-board-2", amount = 4},
      },
      result = "aai-strongbox-storage",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-strongbox-requester",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-strongbox", amount = 1},
        {type = "item", name = "control-board-2", amount = 5},
      },
      result = "aai-strongbox-requester",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  -- Storehouses
  { 
	type = "recipe",
	name = "aai-storehouse",
	enabled = false,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "titanium-plate", amount = 50},
        {type = "item", name = "concrete", amount = 100},
      },
      result = "aai-storehouse",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-storehouse-passive-provider",
	enabled = false,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-storehouse", amount = 1},
        {type = "item", name = "control-board-3", amount = 4},
      },
      result = "aai-storehouse-passive-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-storehouse-active-provider",
	enabled = false,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-storehouse", amount = 1},
        {type = "item", name = "control-board-3", amount = 7},
      },
      result = "aai-storehouse-active-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-storehouse-buffer",
	enabled = false,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-storehouse", amount = 1},
        {type = "item", name = "control-board-3", amount = 7},
      },
      result = "aai-storehouse-buffer",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-storehouse-storage",
	enabled = false,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-storehouse", amount = 1},
        {type = "item", name = "control-board-3", amount = 4},
      },
      result = "aai-storehouse-storage",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-storehouse-requester",
	enabled = false,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-storehouse", amount = 1},
        {type = "item", name = "control-board-3", amount = 5},
      },
      result = "aai-storehouse-requester",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  -- Warehouses
  { 
	type = "recipe",
	name = "aai-warehouse",
	enabled = false,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "titanium-plate", amount = 500},
        {type = "item", name = "refined-concrete", amount = 150},
      },
      result = "aai-warehouse",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-warehouse-passive-provider",
	enabled = false,
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-warehouse", amount = 1},
        {type = "item", name = "control-board-4", amount = 4},
      },
      result = "aai-warehouse-passive-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-warehouse-active-provider",
	enabled = false,
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-warehouse", amount = 1},
        {type = "item", name = "control-board-4", amount = 7},
      },
      result = "aai-warehouse-active-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-warehouse-buffer",
	enabled = false,
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-warehouse", amount = 1},
        {type = "item", name = "control-board-4", amount = 7},
      },
      result = "aai-warehouse-buffer",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-warehouse-storage",
	enabled = false,
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-warehouse", amount = 1},
        {type = "item", name = "control-board-4", amount = 4},
      },
      result = "aai-warehouse-storage",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  { 
	type = "recipe",
	name = "aai-warehouse-requester",
	enabled = false,
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "aai-warehouse", amount = 1},
        {type = "item", name = "control-board-4", amount = 5},
      },
      result = "aai-warehouse-requester",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})