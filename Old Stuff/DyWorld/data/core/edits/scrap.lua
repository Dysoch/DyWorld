require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw["simple-entity"]["mineable-wreckage"].minable = {
	mining_time = 0.25,
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

data.raw["simple-entity"]["crash-site-lab-broken"].minable = {
	mining_time = 10,
    results = {
		{type = "item", name = "iron-gear-wheel", amount_min = 10, amount_max = 10, probability = 0.5},
		{type = "item", name = "stone-gear-wheel", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "stone-plate", amount_min = 10, amount_max = 10, probability = 0.5},
		{type = "item", name = "stone-brick", amount_min = 10, amount_max = 40, probability = 0.5},
		{type = "item", name = "glass", amount_min = 10, amount_max = 30, probability = 0.5},
		{type = "item", name = "iron-stick", amount_min = 10, amount_max = 50, probability = 0.5},
		{type = "item", name = "copper-plate", amount_min = 10, amount_max = 30, probability = 0.5},
		{type = "item", name = "iron-plate", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "copper-cable", amount_min = 10, amount_max = 40, probability = 0.5},
		{type = "item", name = "simple-control-board", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "basic-control-board", amount_min = 10, amount_max = 10, probability = 0.1},
	},
}

data.raw["simple-entity"]["crash-site-assembling-machine-1-broken"].minable = {
	mining_time = 10,
    results = {
		{type = "item", name = "iron-gear-wheel", amount_min = 10, amount_max = 10, probability = 0.5},
		{type = "item", name = "stone-gear-wheel", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "stone-plate", amount_min = 10, amount_max = 10, probability = 0.5},
		{type = "item", name = "stone-brick", amount_min = 10, amount_max = 40, probability = 0.5},
		{type = "item", name = "glass", amount_min = 10, amount_max = 30, probability = 0.5},
		{type = "item", name = "iron-stick", amount_min = 10, amount_max = 50, probability = 0.5},
		{type = "item", name = "copper-plate", amount_min = 10, amount_max = 30, probability = 0.5},
		{type = "item", name = "iron-plate", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "copper-cable", amount_min = 10, amount_max = 40, probability = 0.5},
		{type = "item", name = "simple-control-board", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "basic-control-board", amount_min = 10, amount_max = 10, probability = 0.1},
	},
}

data.raw["simple-entity"]["crash-site-assembling-machine-2-broken"].minable = {
	mining_time = 10,
    results = {
		{type = "item", name = "iron-gear-wheel", amount_min = 10, amount_max = 10, probability = 0.5},
		{type = "item", name = "stone-gear-wheel", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "stone-plate", amount_min = 10, amount_max = 10, probability = 0.5},
		{type = "item", name = "stone-brick", amount_min = 10, amount_max = 40, probability = 0.5},
		{type = "item", name = "glass", amount_min = 10, amount_max = 30, probability = 0.5},
		{type = "item", name = "iron-stick", amount_min = 10, amount_max = 50, probability = 0.5},
		{type = "item", name = "copper-plate", amount_min = 10, amount_max = 30, probability = 0.5},
		{type = "item", name = "iron-plate", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "copper-cable", amount_min = 10, amount_max = 40, probability = 0.5},
		{type = "item", name = "simple-control-board", amount_min = 10, amount_max = 20, probability = 0.5},
		{type = "item", name = "basic-control-board", amount_min = 10, amount_max = 10, probability = 0.1},
	},
}

data.raw["container"]["crash-site-chest-1"].minable = {
	mining_time = 5,
    results = {
		{type = "item", name = "stone-plate", amount_min = 5, amount_max = 5, probability = 0.5},
		{type = "item", name = "stone-brick", amount_min = 5, amount_max = 20, probability = 0.5},
		{type = "item", name = "iron-stick", amount_min = 5, amount_max = 25, probability = 0.5},
		{type = "item", name = "copper-plate", amount_min = 5, amount_max = 15, probability = 0.5},
		{type = "item", name = "iron-plate", amount_min = 5, amount_max = 10, probability = 0.5},
	},
}

data.raw["container"]["crash-site-chest-2"].minable = {
	mining_time = 5,
    results = {
		{type = "item", name = "stone-plate", amount_min = 5, amount_max = 5, probability = 0.5},
		{type = "item", name = "stone-brick", amount_min = 5, amount_max = 20, probability = 0.5},
		{type = "item", name = "iron-stick", amount_min = 5, amount_max = 25, probability = 0.5},
		{type = "item", name = "copper-plate", amount_min = 5, amount_max = 15, probability = 0.5},
		{type = "item", name = "iron-plate", amount_min = 5, amount_max = 10, probability = 0.5},
	},
}

data:extend(
{
  {
    type = "character-corpse",
    name = "character-corpse-dyworld",
    icon = "__base__/graphics/icons/character.png",
    icon_size = 32,
    minable = {
	  mining_time = 0.75,
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
	},
    time_to_live = 60 * 60 * 10, 
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_priority = 100, -- 0-255 value with 255 being on-top of everything else
    pictures =
    {
      {
        layers =
        {
          character_animations.level1.dead,
          character_animations.level1.dead_mask,
          character_animations.level1.dead_shadow
        }
      },
      {
        layers =
        {
          character_animations.level1.dead,
          character_animations.level1.dead_mask,
          character_animations.level2addon.dead,
          character_animations.level2addon.dead_mask,
          character_animations.level1.dead_shadow
        }
      },
      {
        layers =
        {
          character_animations.level1.dead,
          character_animations.level1.dead_mask,
          character_animations.level3addon.dead,
          character_animations.level3addon.dead_mask,
          character_animations.level1.dead_shadow
        }
      }
    },
    -- The highest index found in the corpse is the graphics variation used
    armor_picture_mapping =
    {
      --nil = 1,
      ["light-armor"] = 2,
    }
  },
})