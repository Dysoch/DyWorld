

local Science_Table = {"automation", "logistic", "chemical", "military", "production", "utility", "biological"}

for k,v in pairs(Science_Table) do
data:extend({
  {
    type = "recipe",
    name = v.."-science-pack",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = v.."-science-fluid", amount = 10},
        v == "automation" and {type = "item", name = "iron-plate", amount = 2} or nil,
        v == "logistic" and {type = "item", name = "rubber", amount = 4} or nil,
        v == "chemical" and {type = "item", name = "glass", amount = 3} or nil,
        v == "biological" and {type = "item", name = "brick", amount = 10} or nil,
        v == "military" and {type = "item", name = "lead-plate", amount = 2} or nil,
        v == "production" and {type = "item", name = "polylactic-acid", amount = 3} or nil,
        v == "utility" and {type = "item", name = "tungsten-plate", amount = 2} or nil,
      },
      result = v.."-science-pack",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = v.."-science-pack-advanced",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = v.."-science-fluid-advanced", amount = 10},
        v == "automation" and {type = "item", name = "titanium-plate", amount = 3} or nil,
        v == "logistic" and {type = "item", name = "silver-plate", amount = 6} or nil,
        v == "chemical" and {type = "item", name = "lead-plate", amount = 4} or nil,
        v == "biological" and {type = "item", name = "polylactic-acid", amount = 9} or nil,
        v == "military" and {type = "item", name = "chromium-plate", amount = 7} or nil,
        v == "production" and {type = "item", name = "crystal", amount = 4} or nil,
        v == "utility" and {type = "item", name = "diamond", amount = 2} or nil,
      },
      result = v.."-science-pack-advanced",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = v.."-science-fluid",
	category = "centrifuging",
    normal =
    {
      ingredients = {},
      results =
      {
        {type = "fluid", name = v.."-science-fluid", amount = 20},
      },
	  energy_required = 5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = v.."-science-fluid-advanced",
	category = "centrifuging",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "exotic-partical", amount = 500},
        {type = "fluid", name = v.."-science-fluid", amount = 10},
      },
      results =
      {
        {type = "fluid", name = v.."-science-fluid-advanced", amount = 20},
      },
	  energy_required = 5,
	  enabled = false,
    },
  },
})
DyWorld_ATTA(v.."-science-pack", {v.."-science-pack"})
DyWorld_ATTA(v.."-science-pack-advanced", {v.."-science-pack-advanced"})
DyWorld_ATTA(v.."-science-fluid", {v.."-science-pack"})
DyWorld_ATTA(v.."-science-fluid-advanced", {v.."-science-pack-advanced"})
end

data.raw.recipe["automation-science-fluid"].normal.ingredients = {
    {type = "item", name = "control-board-2", amount = 1},
    {type = "item", name = "construction-robot-1", amount = 1},
    {type = "item", name = "basic-assembler", amount = 1},
    {type = "fluid", name = "water", amount = 250},
}

data.raw.recipe["logistic-science-fluid"].normal.ingredients = {
    {type = "item", name = "loader-2", amount = 1},
    {type = "item", name = "normal-inserter", amount = 1},
    {type = "item", name = "logistic-robot-1", amount = 1},
    {type = "fluid", name = "hydrogen", amount = 250},
}

data.raw.recipe["chemical-science-fluid"].normal.ingredients = {
    {type = "item", name = "oil-refinery", amount = 1},
    {type = "item", name = "chemical-plant", amount = 1},
    {type = "item", name = "naphtha", amount = 10},
    {type = "fluid", name = "heavy-oil", amount = 50},
}

data.raw.recipe["production-science-fluid"].normal.ingredients = {
    {type = "item", name = "blast-furnace", amount = 1},
    {type = "item", name = "lense-2", amount = 1},
    {type = "item", name = "refined-concrete", amount = 5},
    {type = "fluid", name = "methane", amount = 500},
}

data.raw.recipe["utility-science-fluid"].normal.ingredients = {
    {type = "item", name = "radar-3", amount = 1},
    {type = "item", name = "advanced-asteroid-miner", amount = 2},
    {type = "item", name = "rocket-silo-2", amount = 1},
    {type = "fluid", name = "natural-gas", amount = 5000},
}

data.raw.recipe["biological-science-fluid"].normal.ingredients = {
    {type = "item", name = "bio-waste", amount = 20},
    {type = "item", name = "wood-sapling", amount = 5},
    {type = "item", name = "acidic-residue", amount = 1},
    {type = "item", name = "chitin", amount = 1},
    {type = "fluid", name = "water", amount = 2500},
}

data.raw.recipe["military-science-fluid"].normal.ingredients = {
    {type = "item", name = "zaydon-power-armor", amount = 1},
    {type = "item", name = "advanced-762mm-turret", amount = 1},
    {type = "item", name = "860mm-gun", amount = 1},
    {type = "fluid", name = "water", amount = 1000},
}