
local DyWorld_Prototype_1a = DyDs_CopyPrototype("generator-equipment", "fusion-reactor-equipment", "fusion-reactor-equipment-1", true)
local DyWorld_Prototype_2a = DyDs_CopyPrototype("generator-equipment", "fusion-reactor-equipment", "fusion-reactor-equipment-2", true)
local DyWorld_Prototype_3a = DyDs_CopyPrototype("generator-equipment", "fusion-reactor-equipment", "fusion-reactor-equipment-3", true)
local DyWorld_Prototype_1b = DyDs_CopyPrototype("item", "fusion-reactor-equipment", "fusion-reactor-equipment-1", true)
local DyWorld_Prototype_2b = DyDs_CopyPrototype("item", "fusion-reactor-equipment", "fusion-reactor-equipment-2", true)
local DyWorld_Prototype_3b = DyDs_CopyPrototype("item", "fusion-reactor-equipment", "fusion-reactor-equipment-3", true)
local DyWorld_Prototype_1c = DyDs_CopyPrototype("recipe", "fusion-reactor-equipment", "fusion-reactor-equipment-1", true)
local DyWorld_Prototype_2c = DyDs_CopyPrototype("recipe", "fusion-reactor-equipment", "fusion-reactor-equipment-2", true)
local DyWorld_Prototype_3c = DyDs_CopyPrototype("recipe", "fusion-reactor-equipment", "fusion-reactor-equipment-3", true)

DyWorld_Prototype_1a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_1a.power = "3MW"
DyWorld_Prototype_1a.energy_source = {
      type = "burner",
      usage_priority = "secondary-output"
    }
DyWorld_Prototype_1a.burner =
    {
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      effectivity = 0.5,
      fuel_categories = {"fission"},
    }
DyWorld_Prototype_1b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_1b.order = "solar-1"
--DyWorld_Prototype_1c.normal.ingredients = {{type = "item", name = "fusion-reactor-equipment", amount = 10}}
--DyWorld_Prototype_1c.normal.energy_required = 300

DyWorld_Prototype_2a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_2a.power = "25MW"
DyWorld_Prototype_2a.energy_source = {
      type = "burner",
      usage_priority = "secondary-output"
    }
DyWorld_Prototype_2a.burner =
    {
      fuel_inventory_size = 2,
      burnt_inventory_size = 2,
      effectivity = 1,
      fuel_categories = {"fusion", "fission"},
    }
DyWorld_Prototype_2b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_2b.order = "solar-2"
--DyWorld_Prototype_2c.normal.ingredients = {{type = "item", name = "fusion-reactor-equipment-1", amount = 5}}
--DyWorld_Prototype_2c.normal.energy_required = 600

DyWorld_Prototype_3a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_3a.power = "180MW"
DyWorld_Prototype_3a.energy_source = {
      type = "burner",
      usage_priority = "secondary-output"
    }
DyWorld_Prototype_3a.burner =
    {
      fuel_inventory_size = 5,
      burnt_inventory_size = 5,
      effectivity = 2,
      fuel_categories = {"fusion", "fission"},
    }
DyWorld_Prototype_3b.subgroup = DyDs.."equipment-energy"
DyWorld_Prototype_3b.order = "solar-3"
--DyWorld_Prototype_3c.normal.ingredients = {{type = "item", name = "fusion-reactor-equipment-2", amount = 5}}
--DyWorld_Prototype_3c.normal.energy_required = 1200


data:extend({
  DyWorld_Prototype_1a, DyWorld_Prototype_1b, DyWorld_Prototype_1c,
  DyWorld_Prototype_2a, DyWorld_Prototype_2b, DyWorld_Prototype_2c,
  DyWorld_Prototype_3a, DyWorld_Prototype_3b, DyWorld_Prototype_3c,
})

DyWorld_ATTA("fusion-reactor-equipment-1", {"reactor-1"})
DyWorld_ATTA("fusion-reactor-equipment-2", {"reactor-3"})
DyWorld_ATTA("fusion-reactor-equipment-3", {"reactor-5"})