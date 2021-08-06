

local DyWorld_Prototype_1 = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-4", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-4", true)

DyWorld_Prototype_1.rocket_parts_required = 25
DyWorld_Prototype_1.fixed_recipe = "rocket-part-4"
DyWorld_Prototype_1.rocket_entity = "rocket-silo-rocket-4"
DyWorld_Prototype_1.next_upgrade = nil
DyWorld_Prototype_1.fast_replaceable_group = "rocket-silo"
DyWorld_Prototype_1.fluid_boxes = {
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

DyWorld_Prototype_1.rocket_result_inventory_size = 40
DyWorld_Prototype_2.inventory_size = 5

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "rocket-silo-4",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
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
        {type = "item", name = "control-board-5", amount = 1},
        {type = "item", name = "duralumin-plate", amount = 20},
        {type = "item", name = "magnox-plate", amount = 15},
        {type = "fluid", name = "gasoline", amount = 5},
      },
      result = "rocket-part-4",
	  enabled = false,
      hidden = true,
	  energy_required = 5,
    },
  },
})