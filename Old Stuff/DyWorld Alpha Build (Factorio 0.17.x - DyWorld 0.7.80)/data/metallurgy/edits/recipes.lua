require "data/prefix"

data.raw.recipe["iron-plate"].ingredients = {{"iron-ore", 2}}
data.raw.recipe["copper-plate"].ingredients = {{"copper-ore", 2}}
data.raw.recipe["tin-plate"].ingredients = {{"tin-ore", 2}}
data.raw.recipe["gold-plate"].ingredients = {{"gold-ore", 2}}
data.raw.recipe["silver-plate"].ingredients = {{"silver-ore", 2}}
data.raw.recipe["lead-plate"].ingredients = {{"lead-ore", 2}}
data.raw.recipe["chromium-plate"].ingredients = {{"chromium-ore", 2}}
data.raw.recipe["tungsten-plate"].ingredients = {{"tungsten-ore", 2}}
data.raw.recipe["zinc-plate"].ingredients = {{"zinc-ore", 2}}
data.raw.recipe["aluminium-plate"].ingredients = {{"aluminium-ore", 2}}
data.raw.recipe["nickel-plate"].ingredients = {{"nickel-ore", 2}}
data.raw.recipe["uranium-plate"].ingredients = {{"uranium-ore", 2}}
data.raw.recipe["lithium-plate"].ingredients = {{"lithium-ore", 2}}
data.raw.recipe["titanium-plate"].ingredients = {{"titanium-ore", 2}}
data.raw.recipe["steel-plate"].ingredients = {{"iron-plate", 8}}


	data.raw.recipe[dy.."ground-mining"].results = {
      {type = "item", name = "stone", amount_min = 1, amount_max = 25, probability = 0.35},
      {type = "item", name = dy.."sand", amount_min = 1, amount_max = 25, probability = 0.15},
      {type = "item", name = dy.."obsidian", amount_min = 1, amount_max = 5, probability = 0.15},
      {type = "item", name = dy.."chitin", amount_min = 1, amount_max = 5, probability = 0.15},
      {type = "item", name = dy.."crystal", amount_min = 1, amount_max = 5, probability = 0.03},
      {type = "item", name = dy.."crystai", amount_min = 1, amount_max = 5, probability = 0.02},
      {type = "item", name = "coal", amount_min = 1, amount_max = 25, probability = 0.09},
      {type = "item", name = "iron-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "copper-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "gold-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "tin-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "silver-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "lead-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "chromium-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "tungsten-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "zinc-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "aluminium-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "nickel-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "lithium-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
      {type = "item", name = "titanium-pebble", amount_min = 1, amount_max = 5, probability = 0.09},
    }
	data.raw.recipe[dy.."sludge-seperation"].results = {
      {type = "item", name = "stone", amount_min = 1, amount_max = 4, probability = 1},
      {type = "item", name = dy.."sand", amount_min = 1, amount_max = 10, probability = 0.75},
      {type = "item", name = "coal", amount_min = 1, amount_max = 4, probability = 0.35},
      {type = "item", name = "iron-pebble", amount_min = 1, amount_max = 10, probability = 0.19},
      {type = "item", name = "copper-pebble", amount_min = 1, amount_max = 10, probability = 0.125},
      {type = "item", name = "gold-pebble", amount_min = 1, amount_max = 10, probability = 0.07},
      {type = "item", name = "tin-pebble", amount_min = 1, amount_max = 10, probability = 0.1},
      {type = "item", name = "silver-pebble", amount_min = 1, amount_max = 10, probability = 0.09},
      {type = "item", name = "lead-pebble", amount_min = 1, amount_max = 10, probability = 0.12},
      {type = "item", name = "chromium-pebble", amount_min = 1, amount_max = 10, probability = 0.14},
      {type = "item", name = "tungsten-pebble", amount_min = 1, amount_max = 10, probability = 0.07},
      {type = "item", name = "nickel-pebble", amount_min = 1, amount_max = 10, probability = 0.09},
      {type = "item", name = "aluminium-pebble", amount_min = 1, amount_max = 10, probability = 0.09},
      {type = "item", name = "zinc-pebble", amount_min = 1, amount_max = 10, probability = 0.09},
      {type = "item", name = "lithium-pebble", amount_min = 1, amount_max = 10, probability = 0.09},
      {type = "item", name = "titanium-pebble", amount_min = 1, amount_max = 10, probability = 0.09},
    }