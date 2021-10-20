

local DyWorld_Prototype_1 = DyDs_CopyPrototype("car", "car", "car-1", true)

DyWorld_Prototype_1.max_health = 750
DyWorld_Prototype_1.guns = {"vehicle-9mm-gun"}
DyWorld_Prototype_1.burner.fuel_category = "carbon"
DyWorld_Prototype_1.equipment_grid = DyW.Equip.Grid(6, 6, "vehicle")

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item-with-entity-data",
    name = "car-1",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."vehicles",
    order = "1",
    place_result = "car-1",
    stack_size = 1,
  },
  {
    type = "recipe",
    name = "car-1",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "basic-boiler", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "9mm-pistol", amount = 1},
      },
      result = "car-1",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("car", "car", "boat-1", true)

DyWorld_Prototype_2.max_health = 500
DyWorld_Prototype_2.guns = {"vehicle-9mm-gun"}
DyWorld_Prototype_2.burner.fuel_category = "carbon"
DyWorld_Prototype_2.collision_mask = {"ground-tile", "train-layer"}
DyWorld_Prototype_2.equipment_grid = DyW.Equip.Grid(8, 4, "vehicle")

data:extend({
    DyWorld_Prototype_2,
  {
    type = "item-with-entity-data",
    name = "boat-1",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."vehicles",
    order = "1",
    place_result = "boat-1",
    stack_size = 1,
  },
  {
    type = "recipe",
    name = "boat-1",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 25},
        {type = "item", name = "basic-boiler", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "9mm-pistol", amount = 1},
      },
      result = "boat-1",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})