


data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].movement_bonus = 0.25
data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].energy_consumption = "250kW"
data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
data.raw.item["exoskeleton-equipment"].subgroup = DyDs.."equipment-qol" --X
data.raw.item["exoskeleton-equipment"].order = "exo-1"

data:extend({
  {
    type = "recipe",
    name = "exoskeleton-equipment",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 5},
        {type = "item", name = "aluminium-plate", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
      },
      results = 
      {
        {type = "item", name = "exoskeleton-equipment", amount = 1},
      },
	  main_product = "exoskeleton-equipment",
	  energy_required = 15,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_1a = DyDs_CopyPrototype("movement-bonus-equipment", "exoskeleton-equipment", "exoskeleton-equipment-mk2", true)
local DyWorld_Prototype_1b = DyDs_CopyPrototype("item", "exoskeleton-equipment", "exoskeleton-equipment-mk2", true)
local DyWorld_Prototype_1c = DyDs_CopyPrototype("recipe", "exoskeleton-equipment", "exoskeleton-equipment-mk2", true)
local DyWorld_Prototype_2a = DyDs_CopyPrototype("movement-bonus-equipment", "exoskeleton-equipment", "exoskeleton-equipment-mk3", true)
local DyWorld_Prototype_2b = DyDs_CopyPrototype("item", "exoskeleton-equipment", "exoskeleton-equipment-mk3", true)
local DyWorld_Prototype_2c = DyDs_CopyPrototype("recipe", "exoskeleton-equipment", "exoskeleton-equipment-mk3", true)

DyWorld_Prototype_1a.energy_consumption = "750kW"
DyWorld_Prototype_1a.movement_bonus = 0.5
DyWorld_Prototype_1a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_1b.subgroup = DyDs.."equipment-qol"
DyWorld_Prototype_1b.order = "exo-2"
DyWorld_Prototype_1c.category = "assembling-tier-3"
DyWorld_Prototype_1c.normal.energy_required = 30
DyWorld_Prototype_1c.normal.ingredients = {
        {type = "item", name = "exoskeleton-equipment", amount = 1},
        {type = "item", name = "aluminium-plate", amount = 2},
        {type = "item", name = "control-board-3", amount = 1},
      }

DyWorld_Prototype_2a.energy_consumption = "2000kW"
DyWorld_Prototype_2a.movement_bonus = 1
DyWorld_Prototype_2a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_2b.subgroup = DyDs.."equipment-qol"
DyWorld_Prototype_2b.order = "exo-3"
DyWorld_Prototype_2c.category = "assembling-tier-4"
DyWorld_Prototype_2c.normal.energy_required = 60
DyWorld_Prototype_2c.normal.ingredients = {
        {type = "item", name = "exoskeleton-equipment-mk2", amount = 1},
        {type = "item", name = "aluminium-plate", amount = 2},
        {type = "item", name = "control-board-4", amount = 1},
      }

data:extend({
  DyWorld_Prototype_1a, DyWorld_Prototype_1b, DyWorld_Prototype_1c,
  DyWorld_Prototype_2a, DyWorld_Prototype_2b, DyWorld_Prototype_2c,
})

DyWorld_ATTA("exoskeleton-equipment", {"logistica-1"})
DyWorld_ATTA("exoskeleton-equipment-mk2", {"logistica-4"})
DyWorld_ATTA("exoskeleton-equipment-mk3", {"logistica-7"})