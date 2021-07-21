



local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "centrifuge", "thermo-centrifuge", true)
DyWorld_Prototype_1.fluid_boxes = {
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
      off_when_no_fluid_recipe = true
    }
DyWorld_Prototype_1.energy_source = {
      type = "heat",
	  default_temperature = 15,
      emissions_per_minute = 10,
      max_temperature = 100000,
      min_working_temperature = 500,
      minimum_glow_temperature = 80,
      specific_heat = "100MJ",
      max_transfer = "2GW",
      connections =
      {
        {
          position = {0, -1.1},
          direction = defines.direction.north
        },
        {
          position = {1.1, 0},
          direction = defines.direction.east
        },
        {
          position = {-1.1, 0},
          direction = defines.direction.west
        },
        {
          position = {0, 1.1},
          direction = defines.direction.south
        },
      },
    }
DyWorld_Prototype_1.crafting_categories = {"thermo-centrifuge"}

data:extend({
  DyWorld_Prototype_1,
})
DyDS_Add_Item({
	name = "thermo-centrifuge",
    icon = data.raw.item.centrifuge.icon,
	order = "fission-3",
	stack_size = 50,
	subgroup = DyDs.."reactor",
	place_result = "thermo-centrifuge",
})
DyDS_Add_Recipe_Item({
	name = "thermo-centrifuge",
})

DyDS_Recipe_Set_Tier("thermo-centrifuge", "2")
DyDS_Add_Ingredient_To_Recipe("thermo-centrifuge", {type = "item", name = "concrete", amount = 5})
DyDS_Add_Ingredient_To_Recipe("thermo-centrifuge", {type = "item", name = "control-board-2", amount = 1})
DyDS_Add_Ingredient_To_Recipe("thermo-centrifuge", {type = "item", name = "centrifuge", amount = 1})
DyDS_Add_Ingredient_To_Recipe("thermo-centrifuge", {type = "item", name = "heat-pipe-fission", amount = 4})
DyDS_Recipe_Set_Time("thermo-centrifuge", 10)