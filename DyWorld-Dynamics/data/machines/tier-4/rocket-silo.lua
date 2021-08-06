

local DyWorld_Prototype_1 = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-3", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-3", true)

DyWorld_Prototype_1.rocket_parts_required = 25
DyWorld_Prototype_1.fixed_recipe = "rocket-part-3"
DyWorld_Prototype_1.rocket_entity = "rocket-silo-rocket-3"
DyWorld_Prototype_1.next_upgrade = "rocket-silo-4"
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

DyWorld_Prototype_1.rocket_result_inventory_size = 20
DyWorld_Prototype_2.inventory_size = 3

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "rocket-silo-3",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
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
        {type = "item", name = "control-board-4", amount = 1},
        {type = "item", name = "duralumin-plate", amount = 5},
        {type = "item", name = "magnox-plate", amount = 3},
        {type = "fluid", name = "gasoline", amount = 5},
      },
      result = "rocket-part-3",
	  enabled = false,
      hidden = true,
	  energy_required = 5,
    },
  },
})