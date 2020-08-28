require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "technology",
    name = "steel-axe-2",
    icon_size = 32,
    icon = "__base__/graphics/icons/steel-axe.png",
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.1
      }
    },
    prerequisites = {"steel-axe"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30 
    },
    order = "c-c-a",
    max_level = "6",
	upgrade = true,
  },
  {
    type = "technology",
    name = "steel-axe-7",
    icon_size = 32,
    icon = "__base__/graphics/icons/steel-axe.png",
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.2
      }
    },
    prerequisites = {"steel-axe-2"},
    unit =
    {
      count_formula = "150*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 35 
    },
    order = "c-c-a",
    max_level = "11",
	upgrade = true,
  },
  {
    type = "technology",
    name = "steel-axe-12",
    icon_size = 32,
    icon = "__base__/graphics/icons/steel-axe.png",
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.3
      }
    },
    prerequisites = {"steel-axe-7"},
    unit =
    {
      count_formula = "250*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 40 
    },
    order = "c-c-a",
    max_level = "16",
	upgrade = true,
  },
  {
    type = "technology",
    name = "steel-axe-17",
    icon_size = 32,
    icon = "__base__/graphics/icons/steel-axe.png",
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.4
      }
    },
    prerequisites = {"steel-axe-12"},
    unit =
    {
      count_formula = "500*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 45 
    },
    order = "c-c-a",
    max_level = "21",
	upgrade = true,
  },
  {
    type = "technology",
    name = "steel-axe-22",
    icon_size = 32,
    icon = "__base__/graphics/icons/steel-axe.png",
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.5
      }
    },
    prerequisites = {"steel-axe-17"},
    unit =
    {
      count_formula = "1000*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60 
    },
    order = "c-c-a",
    max_level = "infinite",
	upgrade = true,
  },
}
)