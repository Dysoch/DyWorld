data:extend({
  {
    type = "recipe",
    name = "solar-panel-equipment",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      results = 
      {
        {type = "item", name = "solar-panel-equipment", amount = 1},
      },
	  main_product = "solar-panel-equipment",
	  energy_required = 5,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_1a = DyDs_CopyPrototype("solar-panel-equipment", "solar-panel-equipment", "solar-panel-equipment-1", true)
local DyWorld_Prototype_2a = DyDs_CopyPrototype("solar-panel-equipment", "solar-panel-equipment", "solar-panel-equipment-2", true)
local DyWorld_Prototype_3a = DyDs_CopyPrototype("solar-panel-equipment", "solar-panel-equipment", "solar-panel-equipment-3", true)
local DyWorld_Prototype_4a = DyDs_CopyPrototype("solar-panel-equipment", "solar-panel-equipment", "solar-panel-equipment-4", true)
local DyWorld_Prototype_5a = DyDs_CopyPrototype("solar-panel-equipment", "solar-panel-equipment", "solar-panel-equipment-5", true)
local DyWorld_Prototype_1b = DyDs_CopyPrototype("item", "solar-panel-equipment", "solar-panel-equipment-1", true)
local DyWorld_Prototype_2b = DyDs_CopyPrototype("item", "solar-panel-equipment", "solar-panel-equipment-2", true)
local DyWorld_Prototype_3b = DyDs_CopyPrototype("item", "solar-panel-equipment", "solar-panel-equipment-3", true)
local DyWorld_Prototype_4b = DyDs_CopyPrototype("item", "solar-panel-equipment", "solar-panel-equipment-4", true)
local DyWorld_Prototype_5b = DyDs_CopyPrototype("item", "solar-panel-equipment", "solar-panel-equipment-5", true)
local DyWorld_Prototype_1c = DyDs_CopyPrototype("recipe", "solar-panel-equipment", "solar-panel-equipment-1", true)
local DyWorld_Prototype_2c = DyDs_CopyPrototype("recipe", "solar-panel-equipment", "solar-panel-equipment-2", true)
local DyWorld_Prototype_3c = DyDs_CopyPrototype("recipe", "solar-panel-equipment", "solar-panel-equipment-3", true)
local DyWorld_Prototype_4c = DyDs_CopyPrototype("recipe", "solar-panel-equipment", "solar-panel-equipment-4", true)
local DyWorld_Prototype_5c = DyDs_CopyPrototype("recipe", "solar-panel-equipment", "solar-panel-equipment-5", true)

DyWorld_Prototype_1a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_1a.power = "50kW"
DyWorld_Prototype_1b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_1b.order = "solar-1"
--DyWorld_Prototype_1c.normal.ingredients = {{type = "item", name = "solar-panel-equipment", amount = 10}}
DyWorld_Prototype_1c.normal.energy_required = 60

DyWorld_Prototype_2a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_2a.power = "300kW"
DyWorld_Prototype_2b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_2b.order = "solar-2"
DyWorld_Prototype_2c.normal.ingredients = {{type = "item", name = "solar-panel-equipment-1", amount = 5}}
DyWorld_Prototype_2c.normal.energy_required = 120

DyWorld_Prototype_3a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_3a.power = "1.8MW"
DyWorld_Prototype_3b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_3b.order = "solar-3"
DyWorld_Prototype_3c.normal.ingredients = {{type = "item", name = "solar-panel-equipment-2", amount = 5}}
DyWorld_Prototype_3c.normal.energy_required = 180

DyWorld_Prototype_4a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_4a.power = "10.8MW"
DyWorld_Prototype_4b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_4b.order = "solar-4"
DyWorld_Prototype_4c.normal.ingredients = {{type = "item", name = "solar-panel-equipment-3", amount = 5}}
DyWorld_Prototype_4c.normal.energy_required = 250

DyWorld_Prototype_5a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_5a.power = "64.8MW"
DyWorld_Prototype_5b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_5b.order = "solar-5"
DyWorld_Prototype_5c.normal.ingredients = {{type = "item", name = "solar-panel-equipment-4", amount = 5}}
DyWorld_Prototype_5c.normal.energy_required = 500


data:extend({
  DyWorld_Prototype_1a, DyWorld_Prototype_1b, DyWorld_Prototype_1c,
  DyWorld_Prototype_2a, DyWorld_Prototype_2b, DyWorld_Prototype_2c,
  DyWorld_Prototype_3a, DyWorld_Prototype_3b, DyWorld_Prototype_3c,
  DyWorld_Prototype_4a, DyWorld_Prototype_4b, DyWorld_Prototype_4c,
  DyWorld_Prototype_5a, DyWorld_Prototype_5b, DyWorld_Prototype_5c,
})
