require "data/prefix"

--data.raw.player.player.collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-14"}
data.raw["fluid-wagon"]["fluid-wagon"].capacity = 250000 

data.raw["assembling-machine"].centrifuge.collision_box = {{-2.4, -2.4}, {2.4, 2.4}}
data.raw["assembling-machine"].centrifuge.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
data.raw["assembling-machine"].centrifuge.crafting_speed = 1
data.raw["assembling-machine"].centrifuge.ingredient_count = 25
data.raw["assembling-machine"].centrifuge.fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {3, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {3, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-2, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-2, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    }

data.raw["simple-entity"]["sand-rock-big"].minable.hardness = ( Materials["Stone"].Hardness / 2)
data.raw["simple-entity"]["rock-big"].minable.hardness = ( Materials["Stone"].Hardness / 2)
data.raw["simple-entity"]["rock-huge"].minable.hardness = ( Materials["Stone"].Hardness / 2)