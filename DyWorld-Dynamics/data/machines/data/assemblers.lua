
local DyWorld_Prototype_0 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "burner-assembler", true)
DyWorld_Prototype_0.crafting_categories = {"assembling-tier-1"}
DyWorld_Prototype_0.resistances = Resist_Tier_1(0.75)
DyWorld_Prototype_0.fast_replaceable_group = "crafting"
DyWorld_Prototype_0.next_upgrade = "basic-assembler"
DyWorld_Prototype_0.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_0.energy_source = {
      type = "burner",
      fuel_category = "carbon",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 8 or Dy_Sett.Difficulty == "Normal" and 24 or Dy_Sett.Difficulty == "Hard" and 72 or 5,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    }

data:extend({
    DyWorld_Prototype_0,
  {
    type = "item",
    name = "burner-assembler",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."burner-machines",
    order = "burner-assembler",
    place_result = "burner-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "burner-assembler",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 1},
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "tin-plate", amount = 1},
      },
      result = "burner-assembler",
	  enabled = false,
	  energy_required = 2,
    },
  },
})

DyW.Recipe.RL.Clear("burner-assembler")
DyW.Recipe.RL.Add("burner-assembler", {type = "item", name = "control-board-1", amount = 6})
DyW.Recipe.RL.Add("burner-assembler", {type = "item", name = "bronze-plate", amount = 60})
DyW.Recipe.RL.Add("burner-assembler", {type = "item", name = "tin-plate", amount = 12})

local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "basic-assembler", true)
DyWorld_Prototype_1.icon = "__base__/graphics/icons/assembling-machine-2.png"
DyWorld_Prototype_1.crafting_categories = {"assembling-tier-1", "assembling-tier-2"}
DyWorld_Prototype_1.energy_usage = "500kW"
DyWorld_Prototype_1.crafting_speed = 1
DyWorld_Prototype_1.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_1.resistances = Resist_Tier_1(1)
DyWorld_Prototype_1.fast_replaceable_group = "crafting"
DyWorld_Prototype_1.next_upgrade = "advanced-assembler"
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_1.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5,
    }


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-assembler",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "2",
    place_result = "basic-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-assembler",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "basic-assembler",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

DyW.Recipe.RL.Clear("basic-assembler")
DyW.Recipe.RL.Add("basic-assembler", {type = "item", name = "control-board-1", amount = 14})
DyW.Recipe.RL.Add("basic-assembler", {type = "item", name = "iron-plate", amount = 80})
DyW.Recipe.RL.Add("basic-assembler", {type = "item", name = "iron-ingot", amount = 10})
DyW.Recipe.RL.Add("basic-assembler", {type = "item", name = "bronze-plate", amount = 12})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "advanced-assembler", true)
DyWorld_Prototype_2.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_2.crafting_categories = {"assembling-tier-1", "assembling-tier-2", "assembling-tier-3"}
DyWorld_Prototype_2.energy_usage = "2000kW"
DyWorld_Prototype_2.crafting_speed = 2.5
DyWorld_Prototype_2.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_2.resistances = Resist_Tier_1(3.5)
DyWorld_Prototype_2.fast_replaceable_group = "crafting"
DyWorld_Prototype_2.next_upgrade = "nano-assembler"
DyWorld_Prototype_2.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_2.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 10 or Dy_Sett.Difficulty == "Normal" and 30 or Dy_Sett.Difficulty == "Hard" and 90 or 5,
    }
data:extend({
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "advanced-assembler",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "3",
    place_result = "advanced-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-assembler",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 12},
      },
      result = "advanced-assembler",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
})

local DyWorld_Prototype_3 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "nano-assembler", true)
DyWorld_Prototype_3.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_3.crafting_categories = {"assembling-tier-1", "assembling-tier-2", "assembling-tier-3", "assembling-tier-4"}
DyWorld_Prototype_3.energy_usage = "10000kW"
DyWorld_Prototype_3.crafting_speed = 10
DyWorld_Prototype_3.fast_replaceable_group = "crafting"
DyWorld_Prototype_3.next_upgrade = "quantum-assembler"
DyWorld_Prototype_3.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_3.resistances = Resist_Tier_1(1)
DyWorld_Prototype_3.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_3.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 25 or Dy_Sett.Difficulty == "Normal" and 75 or Dy_Sett.Difficulty == "Hard" and 225 or 5,
    }
data:extend({
    DyWorld_Prototype_3,
  {
    type = "item",
    name = "nano-assembler",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "4",
    place_result = "nano-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "nano-assembler",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-4", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 12},
      },
      result = "nano-assembler",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
})

local DyWorld_Prototype_4 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "quantum-assembler", true)
DyWorld_Prototype_4.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_4.crafting_categories = {"assembling-tier-1", "assembling-tier-2", "assembling-tier-3", "assembling-tier-4", "assembling-tier-5"}
DyWorld_Prototype_4.energy_usage = "50000kW"
DyWorld_Prototype_4.crafting_speed = 50
DyWorld_Prototype_4.fast_replaceable_group = "crafting"
DyWorld_Prototype_4.next_upgrade = nil
DyWorld_Prototype_4.fluid_boxes = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes
DyWorld_Prototype_4.resistances = Resist_Tier_1(1)
DyWorld_Prototype_4.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_4.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 100 or Dy_Sett.Difficulty == "Normal" and 300 or Dy_Sett.Difficulty == "Hard" and 900 or 5,
    }

data:extend({
    DyWorld_Prototype_4,
  {
    type = "item",
    name = "quantum-assembler",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "5",
    place_result = "quantum-assembler",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "quantum-assembler",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-5", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 12},
      },
      result = "quantum-assembler",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
})