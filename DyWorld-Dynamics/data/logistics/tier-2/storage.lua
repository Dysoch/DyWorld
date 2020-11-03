data:extend({
  {
    type = "recipe",
    name = "logistic-chest-storage",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "logistic-chest-storage",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "logistic-chest-buffer",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "logistic-chest-buffer",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "logistic-chest-requester",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "logistic-chest-requester",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "logistic-chest-active-provider",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "logistic-chest-active-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "logistic-chest-passive-provider",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "logistic-chest-passive-provider",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})

data.raw["logistic-container"]["logistic-chest-passive-provider"].localised_name = {"looped-name.storage-chest-1"}
data.raw["logistic-container"]["logistic-chest-passive-provider"].inventory_size = 50
data.raw.item["logistic-chest-passive-provider"].localised_name = {"looped-name.storage-chest-1"}

data.raw["logistic-container"]["logistic-chest-storage"].localised_name = {"looped-name.storage-chest-2"}
data.raw["logistic-container"]["logistic-chest-storage"].inventory_size = 50
data.raw.item["logistic-chest-storage"].localised_name = {"looped-name.storage-chest-2"}

data.raw["logistic-container"]["logistic-chest-active-provider"].localised_name = {"looped-name.storage-chest-3"}
data.raw["logistic-container"]["logistic-chest-active-provider"].inventory_size = 50
data.raw.item["logistic-chest-active-provider"].localised_name = {"looped-name.storage-chest-3"}

data.raw["logistic-container"]["logistic-chest-requester"].localised_name = {"looped-name.storage-chest-4"}
data.raw["logistic-container"]["logistic-chest-requester"].inventory_size = 50
data.raw.item["logistic-chest-requester"].localised_name = {"looped-name.storage-chest-4"}

data.raw["logistic-container"]["logistic-chest-buffer"].localised_name = {"looped-name.storage-chest-5"}
data.raw["logistic-container"]["logistic-chest-buffer"].inventory_size = 50
data.raw.item["logistic-chest-buffer"].localised_name = {"looped-name.storage-chest-5"}