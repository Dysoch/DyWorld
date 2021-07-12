

local DyWorld_Prototype_1 = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-2", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-2", true)

DyWorld_Prototype_1.rocket_parts_required = 25
DyWorld_Prototype_1.fixed_recipe = "rocket-part-2"
DyWorld_Prototype_1.rocket_entity = "rocket-silo-rocket-2"
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

DyWorld_Prototype_1.rocket_result_inventory_size = 10
DyWorld_Prototype_2.inventory_size = 2

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "rocket-silo-2",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
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
        {type = "item", name = "control-board-3", amount = 1},
        {type = "item", name = "polycarbonate", amount = 4},
        {type = "item", name = "low-density-structure", amount = 1},
        {type = "fluid", name = "natural-gas", amount = 5},
      },
      result = "rocket-part-2",
	  enabled = false,
      hidden = true,
	  energy_required = 5,
    },
  },
})