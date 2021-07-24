




-- Centrifuge Edits --
data.raw["assembling-machine"]["centrifuge"].fluid_boxes = {
      {
        production_type = "input",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-2, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-2, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    }
	
data:extend({
  {
    type = "recipe",
    name = "centrifuge",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 5},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 4},
      },
      result = "centrifuge",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 5*5},
        {type = "item", name = "iron-plate", amount = 12*3},
        {type = "item", name = "bronze-plate", amount = 4*6},
      },
      result = "centrifuge",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})

data.raw.item.centrifuge.subgroup = DyDs.."centrifuge"