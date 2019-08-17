require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw["simple-entity"]["mineable-wreckage"].minable = {
	mining_time = 0.55,
    results = {
		{type = "item", name = "iron-gear-wheel", amount_min = 1, amount_max = 1, probability = 0.25},
		{type = "item", name = "stone-gear-wheel", amount_min = 1, amount_max = 2, probability = 0.25},
		{type = "item", name = "stone-plate", amount_min = 1, amount_max = 1, probability = 0.25},
		{type = "item", name = "stone-brick", amount_min = 1, amount_max = 4, probability = 0.25},
		{type = "item", name = "glass", amount_min = 1, amount_max = 3, probability = 0.25},
		{type = "item", name = "iron-stick", amount_min = 1, amount_max = 5, probability = 0.25},
		{type = "item", name = "copper-plate", amount_min = 1, amount_max = 3, probability = 0.25},
		{type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.25},
		{type = "item", name = "copper-cable", amount_min = 1, amount_max = 4, probability = 0.25},
		{type = "item", name = "simple-control-board", amount_min = 1, amount_max = 2, probability = 0.25},
		{type = "item", name = "basic-control-board", amount_min = 1, amount_max = 1, probability = 0.05},
	},
}