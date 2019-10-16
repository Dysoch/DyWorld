require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local k = "sniper"
local v = 0.0125

data:extend(
{
  {
    type = "technology",
    name = k.."-gun-enhancement-1",
	localised_name = {"looped-name.gun-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = k,
        modifier = v
      },
    },
    prerequisites = {"military-2", "logistic-science-pack"},
    unit =
    {
      count_formula = "50*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 5 
    },
    order = "c-c-a",
    max_level = "3",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-gun-enhancement-4",
	localised_name = {"looped-name.gun-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = k,
        modifier = v * 2
      },
    },
    prerequisites = {k.."-gun-enhancement-1", "military-science-pack"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 10 
    },
    order = "c-c-a",
    max_level = "6",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-gun-enhancement-7",
	localised_name = {"looped-name.gun-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = k,
        modifier = v * 3
      },
    },
    prerequisites = {k.."-gun-enhancement-4", "chemical-science-pack"},
    unit =
    {
      count_formula = "150*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
    max_level = "9",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-gun-enhancement-10",
	localised_name = {"looped-name.gun-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = k,
        modifier = v * 4
      },
    },
    prerequisites = {k.."-gun-enhancement-7", "utility-science-pack"},
    unit =
    {
      count_formula = "200*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 20 
    },
    order = "c-c-a",
    max_level = "12",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-gun-enhancement-13",
	localised_name = {"looped-name.gun-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = k,
        modifier = v * 5
      },
    },
    prerequisites = {k.."-gun-enhancement-10"},
    unit =
    {
      count_formula = "250*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 30 
    },
    order = "c-c-a",
    max_level = "15",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-gun-enhancement-16",
	localised_name = {"looped-name.gun-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = k,
        modifier = v * 8
      },
    },
    prerequisites = {k.."-gun-enhancement-13", "space-science-pack"},
    unit =
    {
      count_formula = "500*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
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