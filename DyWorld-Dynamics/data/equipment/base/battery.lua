
data:extend({
  {
    type = "recipe",
    name = "battery-equipment",
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
        {type = "item", name = "battery-equipment", amount = 1},
      },
	  main_product = "battery-equipment",
	  energy_required = 15,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_1a = DyDs_CopyPrototype("battery-equipment", "battery-equipment", "battery-equipment-1", true)
local DyWorld_Prototype_2a = DyDs_CopyPrototype("battery-equipment", "battery-equipment", "battery-equipment-2", true)
local DyWorld_Prototype_3a = DyDs_CopyPrototype("battery-equipment", "battery-equipment", "battery-equipment-3", true)
local DyWorld_Prototype_1b = DyDs_CopyPrototype("item", "battery-equipment", "battery-equipment-1", true)
local DyWorld_Prototype_2b = DyDs_CopyPrototype("item", "battery-equipment", "battery-equipment-2", true)
local DyWorld_Prototype_3b = DyDs_CopyPrototype("item", "battery-equipment", "battery-equipment-3", true)
local DyWorld_Prototype_1c = DyDs_CopyPrototype("recipe", "battery-equipment", "battery-equipment-1", true)
local DyWorld_Prototype_2c = DyDs_CopyPrototype("recipe", "battery-equipment", "battery-equipment-2", true)
local DyWorld_Prototype_3c = DyDs_CopyPrototype("recipe", "battery-equipment", "battery-equipment-3", true)

DyWorld_Prototype_1a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_1a.energy_source = {
      type = "electric",
      buffer_capacity = "20MJ",
      usage_priority = "tertiary"
    }
DyWorld_Prototype_1b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_1b.order = "battery-1"
DyWorld_Prototype_1c.normal.energy_required = 30

DyWorld_Prototype_2a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_2a.energy_source = {
      type = "electric",
      buffer_capacity = "200MJ",
      usage_priority = "tertiary"
    }
DyWorld_Prototype_2b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_2b.order = "battery-2"
DyWorld_Prototype_2c.normal.ingredients = {{type = "item", name = "battery-equipment-1", amount = 8}}
DyWorld_Prototype_2c.normal.energy_required = 60

DyWorld_Prototype_3a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_3a.energy_source = {
      type = "electric",
      buffer_capacity = "2000MJ",
      usage_priority = "tertiary"
    }
DyWorld_Prototype_3b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_3b.order = "battery-3"
DyWorld_Prototype_3c.normal.ingredients = {{type = "item", name = "battery-equipment-2", amount = 8}}
DyWorld_Prototype_3c.normal.energy_required = 120


data:extend({
  DyWorld_Prototype_1a, DyWorld_Prototype_1b, DyWorld_Prototype_1c,
  DyWorld_Prototype_2a, DyWorld_Prototype_2b, DyWorld_Prototype_2c,
  DyWorld_Prototype_3a, DyWorld_Prototype_3b, DyWorld_Prototype_3c,
})

DyWorld_ATTA("battery-equipment-1", {"intermediates-3"})
DyWorld_ATTA("battery-equipment-2", {"intermediates-6"})
DyWorld_ATTA("battery-equipment-3", {"intermediates-9"})