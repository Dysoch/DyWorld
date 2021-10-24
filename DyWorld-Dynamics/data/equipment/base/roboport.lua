data:extend({
  {
    type = "recipe",
    name = "personal-roboport-equipment",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "ammo-nano-constructors", amount = 1},
      },
      results = 
      {
        {type = "item", name = "personal-roboport-equipment", amount = 1},
      },
	  main_product = "personal-roboport-equipment",
	  energy_required = 60,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_1a = DyDs_CopyPrototype("roboport-equipment", "personal-roboport-equipment", "personal-roboport-equipment-1", true)
local DyWorld_Prototype_2a = DyDs_CopyPrototype("roboport-equipment", "personal-roboport-equipment", "personal-roboport-equipment-2", true)
local DyWorld_Prototype_3a = DyDs_CopyPrototype("roboport-equipment", "personal-roboport-equipment", "personal-roboport-equipment-3", true)
local DyWorld_Prototype_4a = DyDs_CopyPrototype("roboport-equipment", "personal-roboport-equipment", "personal-roboport-equipment-4", true)
local DyWorld_Prototype_1b = DyDs_CopyPrototype("item", "personal-roboport-equipment", "personal-roboport-equipment-1", true)
local DyWorld_Prototype_2b = DyDs_CopyPrototype("item", "personal-roboport-equipment", "personal-roboport-equipment-2", true)
local DyWorld_Prototype_3b = DyDs_CopyPrototype("item", "personal-roboport-equipment", "personal-roboport-equipment-3", true)
local DyWorld_Prototype_4b = DyDs_CopyPrototype("item", "personal-roboport-equipment", "personal-roboport-equipment-4", true)
local DyWorld_Prototype_1c = DyDs_CopyPrototype("recipe", "personal-roboport-equipment", "personal-roboport-equipment-1", true)
local DyWorld_Prototype_2c = DyDs_CopyPrototype("recipe", "personal-roboport-equipment", "personal-roboport-equipment-2", true)
local DyWorld_Prototype_3c = DyDs_CopyPrototype("recipe", "personal-roboport-equipment", "personal-roboport-equipment-3", true)
local DyWorld_Prototype_4c = DyDs_CopyPrototype("recipe", "personal-roboport-equipment", "personal-roboport-equipment-4", true)

DyWorld_Prototype_1a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_1a.charging_station_count = 2
DyWorld_Prototype_1a.robot_limit = 10
DyWorld_Prototype_1a.construction_radius = 15
DyWorld_Prototype_1a.charging_energy = "1000kW"
DyWorld_Prototype_1a.energy_source = {
      type = "electric",
      buffer_capacity = "35MJ",
      input_flow_limit = "3500KW",
      usage_priority = "secondary-input"
    }
DyWorld_Prototype_1b.subgroup = DyDs.."equipment-qol"
DyWorld_Prototype_1b.order = "robo-1"

DyWorld_Prototype_2a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_2a.charging_station_count = 4
DyWorld_Prototype_2a.robot_limit = 20
DyWorld_Prototype_2a.construction_radius = 30
DyWorld_Prototype_2a.charging_energy = "2000kW"
DyWorld_Prototype_2a.energy_source = {
      type = "electric",
      buffer_capacity = "70MJ",
      input_flow_limit = "7000KW",
      usage_priority = "secondary-input"
    }
DyWorld_Prototype_2b.subgroup = DyDs.."equipment-qol"
DyWorld_Prototype_2b.order = "robo-2"
DyWorld_Prototype_2c.normal.ingredients = {{type = "item", name = "personal-roboport-equipment-1", amount = 5}}
DyWorld_Prototype_2c.normal.energy_required = 120
DyWorld_Prototype_2c.hidden = false

DyWorld_Prototype_3a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_3a.charging_station_count = 8
DyWorld_Prototype_3a.robot_limit = 40
DyWorld_Prototype_3a.construction_radius = 60
DyWorld_Prototype_3a.charging_energy = "4000kW"
DyWorld_Prototype_3a.energy_source = {
      type = "electric",
      buffer_capacity = "140MJ",
      input_flow_limit = "14000KW",
      usage_priority = "secondary-input"
    }
DyWorld_Prototype_3b.subgroup = DyDs.."equipment-qol"
DyWorld_Prototype_3b.order = "robo-3"
DyWorld_Prototype_3c.normal.ingredients = {{type = "item", name = "personal-roboport-equipment-2", amount = 5}}
DyWorld_Prototype_3c.normal.energy_required = 180
DyWorld_Prototype_3c.hidden = false

DyWorld_Prototype_4a.categories = {"dy-armor", "dy-vehicle-weak", "dy-vehicle-strong"}
DyWorld_Prototype_4a.charging_station_count = 16
DyWorld_Prototype_4a.robot_limit = 80
DyWorld_Prototype_4a.construction_radius = 120
DyWorld_Prototype_4a.charging_energy = "8000kW"
DyWorld_Prototype_4a.energy_source = {
      type = "electric",
      buffer_capacity = "280MJ",
      input_flow_limit = "28000KW",
      usage_priority = "secondary-input"
    }
DyWorld_Prototype_4b.subgroup = DyDs.."equipment-qol"
DyWorld_Prototype_4b.order = "robo-4"
DyWorld_Prototype_4c.normal.ingredients = {{type = "item", name = "personal-roboport-equipment-3", amount = 5}}
DyWorld_Prototype_4c.normal.energy_required = 250
DyWorld_Prototype_4c.hidden = false


data:extend({
  DyWorld_Prototype_1a, DyWorld_Prototype_1b, DyWorld_Prototype_1c,
  DyWorld_Prototype_2a, DyWorld_Prototype_2b, DyWorld_Prototype_2c,
  DyWorld_Prototype_3a, DyWorld_Prototype_3b, DyWorld_Prototype_3c,
  DyWorld_Prototype_4a, DyWorld_Prototype_4b, DyWorld_Prototype_4c,
})

DyWorld_ATTA("personal-roboport-equipment-1", {"storage-1"})
DyWorld_ATTA("personal-roboport-equipment-2", {"storage-3"})
DyWorld_ATTA("personal-roboport-equipment-3", {"storage-5"})
DyWorld_ATTA("personal-roboport-equipment-4", {"storage-7"})