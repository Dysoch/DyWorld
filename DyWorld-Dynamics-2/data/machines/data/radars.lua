

local DyWorld_Prototype_0 = DyDs_CopyPrototype("radar", "radar", "burner-radar", true)
DyWorld_Prototype_0.next_upgrade = "radar-1"
DyWorld_Prototype_0.fast_replaceable_group = "radar"
DyWorld_Prototype_0.energy_source = {
      type = "burner",
      fuel_category = "carbon",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    }
DyWorld_Prototype_0.resistances = Resist_Tier_1(0.5)
DyWorld_Prototype_0.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value

data:extend({
  DyWorld_Prototype_0,
  {
    type = "item",
    name = "burner-radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "1",
    place_result = "burner-radar",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "burner-radar",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "iron-plate", amount = 6},
        {type = "item", name = "copper-plate", amount = 1},
      },
      result = "burner-radar",
	  enabled = false,
	  energy_required = 2,
    },
  },
})

local DyWorld_Prototype_1 = DyDs_CopyPrototype("radar", "radar", "radar-1", true)
DyWorld_Prototype_1.max_health = 500
DyWorld_Prototype_1.next_upgrade = "radar-2"
DyWorld_Prototype_1.fast_replaceable_group = "radar"

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "radar-1",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "2",
    place_result = "radar-1",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "burner-radar", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-1",
	  enabled = false,
	  energy_required = 2,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("radar", "radar", "radar-2", true)
DyWorld_Prototype_2.max_health = 1500
DyWorld_Prototype_2.max_distance_of_sector_revealed = 28
DyWorld_Prototype_2.max_distance_of_nearby_sector_revealed = 5
DyWorld_Prototype_2.energy_usage = "900kW"
DyWorld_Prototype_2.next_upgrade = "radar-3"
DyWorld_Prototype_2.fast_replaceable_group = "radar"

data:extend({
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "radar-2",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "3",
    place_result = "radar-2",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "radar-1", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-2",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "radar-1", amount = 1},
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 12*5},
        {type = "item", name = "bronze-plate", amount = 3*5},
      },
      result = "radar-2",
	  enabled = false,
	  energy_required = 10,
    },
  },
})

local DyWorld_Prototype_3 = DyDs_CopyPrototype("radar", "radar", "radar-3", true)
DyWorld_Prototype_3.max_health = 4500
DyWorld_Prototype_3.max_distance_of_sector_revealed = 56
DyWorld_Prototype_3.max_distance_of_nearby_sector_revealed = 7
DyWorld_Prototype_3.energy_usage = "2700kW"
DyWorld_Prototype_3.next_upgrade = "radar-4"
DyWorld_Prototype_3.fast_replaceable_group = "radar"

data:extend({
  DyWorld_Prototype_3,
  {
    type = "item",
    name = "radar-3",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "4",
    place_result = "radar-3",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-3",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "radar-2", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-3",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "radar-2", amount = 1},
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 12*5},
        {type = "item", name = "bronze-plate", amount = 3*5},
      },
      result = "radar-3",
	  enabled = false,
	  energy_required = 10,
    },
  },
})

local DyWorld_Prototype_4 = DyDs_CopyPrototype("radar", "radar", "radar-4", true)
DyWorld_Prototype_4.max_health = 15000
DyWorld_Prototype_4.max_distance_of_sector_revealed = 112
DyWorld_Prototype_4.max_distance_of_nearby_sector_revealed = 9
DyWorld_Prototype_4.energy_usage = "5400kW"
DyWorld_Prototype_4.next_upgrade = nil
DyWorld_Prototype_4.fast_replaceable_group = "radar"

data:extend({
  DyWorld_Prototype_4,
  {
    type = "item",
    name = "radar-4",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "5",
    place_result = "radar-4",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-4",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "radar-3", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-4",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "radar-3", amount = 1},
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 12*5},
        {type = "item", name = "bronze-plate", amount = 3*5},
      },
      result = "radar-4",
	  enabled = false,
	  energy_required = 10,
    },
  },
})