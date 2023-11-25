

local DyWorld_Prototype_1a = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-1", true)
local DyWorld_Prototype_1b = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-1", true)
DyWorld_Prototype_1a.rocket_parts_required = 1
DyWorld_Prototype_1a.fixed_recipe = "rocket-part-1"
DyWorld_Prototype_1a.rocket_entity = "rocket-silo-rocket-1"
DyWorld_Prototype_1a.next_upgrade = "rocket-silo-2"
DyWorld_Prototype_1a.fast_replaceable_group = "rocket-silo"
DyWorld_Prototype_1a.rocket_result_inventory_size = 4
DyWorld_Prototype_1b.inventory_size = 1

data:extend({
  DyWorld_Prototype_1a,
  DyWorld_Prototype_1b,
  {
    type = "item",
    name = "rocket-silo-1",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."rocket-silo",
    order = "1",
    place_result = "rocket-silo-1",
    stack_size = 1,
  },
  {
    type = "item",
    name = "rocket-part-1",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "rocket-silo-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10},
        {type = "item", name = "steel-plate", amount = 80},
        {type = "item", name = "aluminium-plate", amount = 20},
        {type = "item", name = "concrete", amount = 20},
      },
      result = "rocket-silo-1",
	  enabled = false,
	  energy_required = 25,
    },
  },
  {
    type = "recipe",
    name = "rocket-part-1",
	category = "rocket-building",
    hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 40},
        {type = "item", name = "steel-plate", amount = 85},
        {type = "item", name = "titanium-plate", amount = 75},
        {type = "item", name = "coal", amount = 15},
      },
      result = "rocket-part-1",
	  enabled = false,
      hidden = true,
	  energy_required = 60,
    },
  },
})

local DyWorld_Prototype_2a = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-2", true)
local DyWorld_Prototype_2b = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-2", true)
DyWorld_Prototype_2a.rocket_parts_required = 1
DyWorld_Prototype_2a.fixed_recipe = "rocket-part-2"
DyWorld_Prototype_2a.rocket_entity = "rocket-silo-rocket-2"
DyWorld_Prototype_2a.next_upgrade = "rocket-silo-3"
DyWorld_Prototype_2a.fast_replaceable_group = "rocket-silo"
DyWorld_Prototype_2a.fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -5} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 5} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-5, 0} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {5, 0} }}
      },
    }
DyWorld_Prototype_2a.rocket_result_inventory_size = 10
DyWorld_Prototype_2b.inventory_size = 2

data:extend({
  DyWorld_Prototype_2a,
  DyWorld_Prototype_2b,
  {
    type = "item",
    name = "rocket-silo-2",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."rocket-silo",
    order = "2",
    place_result = "rocket-silo-2",
    stack_size = 1,
  },
  {
    type = "item",
    name = "rocket-part-2",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "rocket-silo-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "rocket-silo-1", amount = 1},
        {type = "item", name = "control-board-3", amount = 10},
        {type = "item", name = "polycarbonate", amount = 4},
        {type = "item", name = "concrete", amount = 50},
        {type = "item", name = "steel-plate", amount = 80},
        {type = "item", name = "titanium-plate", amount = 200},
      },
      result = "rocket-silo-2",
	  enabled = false,
	  energy_required = 25,
    },
  },
  {
    type = "recipe",
    name = "rocket-part-2",
	category = "rocket-building",
    hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-3", amount = 18},
        {type = "item", name = "polycarbonate", amount = 75},
        {type = "item", name = "low-density-structure", amount = 20},
        {type = "fluid", name = "natural-gas", amount = 250},
      },
      result = "rocket-part-2",
	  enabled = false,
      hidden = true,
	  energy_required = 60,
    },
  },
})

local DyWorld_Prototype_3a = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-3", true)
local DyWorld_Prototype_3b = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-3", true)
DyWorld_Prototype_3a.rocket_parts_required = 1
DyWorld_Prototype_3a.fixed_recipe = "rocket-part-3"
DyWorld_Prototype_3a.rocket_entity = "rocket-silo-rocket-3"
DyWorld_Prototype_3a.next_upgrade = "rocket-silo-4"
DyWorld_Prototype_3a.fast_replaceable_group = "rocket-silo"
DyWorld_Prototype_3a.fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -5} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 5} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-5, 0} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {5, 0} }}
      },
    }
DyWorld_Prototype_3a.rocket_result_inventory_size = 20
DyWorld_Prototype_3b.inventory_size = 3

data:extend({
  DyWorld_Prototype_3a,
  DyWorld_Prototype_3b,
  {
    type = "item",
    name = "rocket-silo-3",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."rocket-silo",
    order = "3",
    place_result = "rocket-silo-3",
    stack_size = 1,
  },
  {
    type = "item",
    name = "rocket-part-3",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "rocket-silo-3",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "rocket-silo-2", amount = 1},
        {type = "item", name = "control-board-4", amount = 10},
        {type = "fluid", name = "lubricant", amount = 50},
        {type = "item", name = "refined-concrete", amount = 50},
        {type = "item", name = "duralumin-plate", amount = 250},
      },
      result = "rocket-silo-3",
	  enabled = false,
	  energy_required = 25,
    },
  },
  {
    type = "recipe",
    name = "rocket-part-3",
	category = "rocket-building",
    hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-4", amount = 20},
        {type = "item", name = "duralumin-plate", amount = 100},
        {type = "item", name = "magnox-plate", amount = 50},
        {type = "fluid", name = "gasoline", amount = 250},
      },
      result = "rocket-part-3",
	  enabled = false,
      hidden = true,
	  energy_required = 60,
    },
  },
})

local DyWorld_Prototype_4a = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-4", true)
local DyWorld_Prototype_4b = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-4", true)
DyWorld_Prototype_4a.rocket_parts_required = 1
DyWorld_Prototype_4a.fixed_recipe = "rocket-part-4"
DyWorld_Prototype_4a.rocket_entity = "rocket-silo-rocket-4"
DyWorld_Prototype_4a.next_upgrade = nil
DyWorld_Prototype_4a.fast_replaceable_group = "rocket-silo"
DyWorld_Prototype_4a.fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -5} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 5} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-5, 0} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {5, 0} }}
      },
    }
DyWorld_Prototype_4a.rocket_result_inventory_size = 40
DyWorld_Prototype_4b.inventory_size = 5

data:extend({
  DyWorld_Prototype_4a,
  DyWorld_Prototype_4b,
  {
    type = "item",
    name = "rocket-silo-4",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."rocket-silo",
    order = "4",
    place_result = "rocket-silo-4",
    stack_size = 1,
  },
  {
    type = "item",
    name = "rocket-part-4",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "rocket-silo-4",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "rocket-silo-3", amount = 1},
        {type = "item", name = "control-board-5", amount = 10},
        {type = "fluid", name = "sulfuric-acid", amount = 50},
        {type = "item", name = "purple-gold-plate", amount = 250},
        {type = "item", name = "magnox-plate", amount = 250},
      },
      result = "rocket-silo-4",
	  enabled = false,
	  energy_required = 25,
    },
  },
  {
    type = "recipe",
    name = "rocket-part-4",
	category = "rocket-building",
    hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-5", amount = 20},
        {type = "item", name = "duralumin-plate", amount = 250},
        {type = "item", name = "magnox-plate", amount = 350},
        {type = "fluid", name = "gasoline", amount = 500},
      },
      result = "rocket-part-4",
	  enabled = false,
      hidden = true,
	  energy_required = 60,
    },
  },
})