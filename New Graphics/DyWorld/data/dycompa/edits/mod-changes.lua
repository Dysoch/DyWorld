require "data/core/functions/prefix"

  -- ReforestedWood --
if mods["ReforestedWood"] then
data.raw["resource"]["reforested-wood"].minable.mining_time = 7.5
data.raw["resource"]["reforested-wood"].minable.fluid_amount = 25
data.raw["resource"]["reforested-wood"].autoplace.richness_multiplier_distance_bonus = 0.1
data.raw["resource"]["reforested-wood"].autoplace.richness_base = 10
data.raw["resource"]["reforested-wood"].autoplace.sharpness = 0.99999
data.raw["resource"]["reforested-wood"].autoplace.coverage = 0.0015 / 2
data.raw["resource"]["reforested-wood"].autoplace.starting_area_size = 1 * 10
data.raw["resource"]["reforested-wood"].autoplace.starting_area_amount = 10
data.raw["resource"]["reforested-wood"].minable.result = nil
data.raw["resource"]["reforested-wood"].minable.results = 
    {{name = "wood", amount_min = 1, amount_max = 1, probability = 1},
    {name = "acorn", amount_min = 1, amount_max = 1, probability = 0.005}}   
end

-- Junk Trains 2
if mods["JunkTrain2"] then
    --if settings.startup["JunkTrain-Dyworld"].value  then
    data.raw.recipe["JunkTrain"].ingredients = {
        {"heated-furnace", 1},
        {"boiler-water", 1},
        {"iron-gear-wheel", 10},
        {"heat-pipe", 20}
      }
    data.raw.recipe["ScrapTrailer"].ingredients = {
        {"stone-plate", 20},
        {"iron-gear-wheel", 5},
        {"storehouse-basic", 1}
      }
    data.raw.recipe["train-stop-scrap"].ingredients = {
        {"iron-plate",4},
        {"small-lamp",2},
        {"copper-cable", 6},
        {"stone-plate", 10}
      }
    data.raw.recipe["rail-signal-scrap"].ingredients = {
        {"iron-stick",1},
        {"small-lamp",2},
        {"copper-cable", 6},
        {"stone-plate", 4}
      }
    data.raw.recipe["rail-chain-signal-scrap"].ingredients = {
        {"iron-stick",1},
        {"small-lamp",2},
        {"copper-cable", 12},
        {"stone-plate", 4}
      }
    data.raw.recipe["scrap-rail"].ingredients = {
        {"stone-brick", 1},
        {"iron-stick", 1},
        {"stone-plate", 1}
      }
    --end
end

 -- Nanobots --
if mods["Nanobots"] then
data.raw.ammo["ammo-nano-constructors"].magazine_size = 100
end

 -- HeatPipeAlwaysGlow --
if mods["HeatPipeAlwaysGlow"] then
	if data.raw.technology["heat-pipes"] then
		data.raw.technology["heat-pipes"].prerequisites = {"nuclear-energy-1"}
	end
end

 -- Alien Loot Economy --
if mods["alien-module"] then
data:extend({
	{
		type = "recipe",
		name = "alien-ore-to-gold-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "gold-ore",
		result_count = 5
	},
	{
		type = "recipe",
		name = "alien-ore-to-nickel-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "nickel-ore",
		result_count = 5
	},
	{
		type = "recipe",
		name = "alien-ore-to-silver-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "silver-ore",
		result_count = 5
	},
	{
		type = "recipe",
		name = "alien-ore-to-tin-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "tin-ore",
		result_count = 5
	},
	{
		type = "recipe",
		name = "alien-ore-to-nickel-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "nickel-ore",
		result_count = 5
	},
	{
		type = "recipe",
		name = "alien-ore-to-lead-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "lead-ore",
		result_count = 5
	},
	{
		type = "recipe",
		name = "alien-ore-to-cobalt-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "cobalt-ore",
		result_count = 3
	},
	{
		type = "recipe",
		name = "alien-ore-to-arditium-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "arditium-ore",
		result_count = 3
	},
	{
		type = "recipe",
		name = "alien-ore-to-titanium-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "titanium-ore",
		result_count = 2
	},
	{
		type = "recipe",
		name = "alien-ore-to-tungsten-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "tungsten-ore",
		result_count = 2
	},
	{
		type = "recipe",
		name = "alien-ore-to-neutronium-ore",
		enabled = true,
		energy_required = 10,
		ingredients = { { "artifact-ore", 1 } },
		result = "neutronium-ore",
		result_count = 1
	},
})
end
