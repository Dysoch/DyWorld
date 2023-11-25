




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
      off_when_no_fluid_recipe = true,
    }
data.raw.item.centrifuge.subgroup = DyDs.."centrifuge"