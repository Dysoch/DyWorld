require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local k = "bullet"
local v = 0.1

data:extend(
{
  {
    type = "technology",
    name = k.."-ammo-enhancement-1",
	localised_name = {"looped-name.ammo-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = k,
        modifier = v 
      },
    },
    prerequisites = {"military"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 5 
    },
    order = "c-c-a",
    max_level = "3",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-ammo-enhancement-4",
	localised_name = {"looped-name.ammo-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = k,
        modifier = v * 2
      },
    },
    prerequisites = {k.."-ammo-enhancement-1", "logistic-science-pack"},
    unit =
    {
      count_formula = "200*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 10 
    },
    order = "c-c-a",
    max_level = "6",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-ammo-enhancement-7",
	localised_name = {"looped-name.ammo-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = k,
        modifier = v * 3
      },
    },
    prerequisites = {k.."-ammo-enhancement-4", "military-science-pack"},
    unit =
    {
      count_formula = "300*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 15 
    },
    order = "c-c-a",
    max_level = "9",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-ammo-enhancement-10",
	localised_name = {"looped-name.ammo-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = k,
        modifier = v * 4
      },
    },
    prerequisites = {k.."-ammo-enhancement-7", "chemical-science-pack"},
    unit =
    {
      count_formula = "400*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 20 
    },
    order = "c-c-a",
    max_level = "12",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-ammo-enhancement-13",
	localised_name = {"looped-name.ammo-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = k,
        modifier = v * 5
      },
    },
    prerequisites = {k.."-ammo-enhancement-10", "utility-science-pack"},
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
      },
      time = 30 
    },
    order = "c-c-a",
    max_level = "15",
	upgrade = true,
  },
  {
    type = "technology",
    name = k.."-ammo-enhancement-16",
	localised_name = {"looped-name.ammo-enhancement", {"looped-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = k,
        modifier = v * 8
      },
    },
    prerequisites = {k.."-ammo-enhancement-13", "space-science-pack"},
    unit =
    {
      count_formula = "1000*L",
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