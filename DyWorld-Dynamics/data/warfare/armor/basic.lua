
  ----- Basic Armor -----
data:extend({
  {
    type = "armor",
    name = "basic-armor",
    icon = "__base__/graphics/icons/light-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "acid",
        decrease = 0,
        percent = 20
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      },
      {
        type = "fire",
        decrease = 0,
        percent = 10
      }
    },
    subgroup = DyDs.."armor",
    order = "basic-armor",
    stack_size = 50,
    durability = 1000,
    infinite = false,
  },
  {
    type = "recipe",
    name = "basic-armor",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 5},
        {type = "item", name = "limestone", amount = 1},
      },
      result = "basic-armor",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 15},
        {type = "item", name = "limestone", amount = 3},
      },
      result = "basic-armor",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
})
  ----- Basic Power Armor -----
data:extend({
  {
    type = "armor",
    name = "basic-power-armor",
    icon = "__base__/graphics/icons/light-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 30,
        percent = 35
      },
      {
        type = "fire",
        decrease = 0,
        percent = 40
      }
    },
    subgroup = DyDs.."armor",
    order = "basic-power-armor",
    stack_size = 1,
    durability = 5000,
    infinite = false,
    equipment_grid = "equipment-grid-1",
  },
  {
    type = "recipe",
    name = "basic-power-armor",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "basic-armor", amount = 1},
        {type = "item", name = "control-board-1", amount = 5},
        {type = "item", name = "bronze-plate", amount = 5},
        {type = "item", name = "iron-plate", amount = 15},
      },
      result = "basic-power-armor",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "basic-armor", amount = 1},
        {type = "item", name = "control-board-1", amount = 15},
        {type = "item", name = "bronze-plate", amount = 20},
        {type = "item", name = "iron-plate", amount = 40},
      },
      result = "basic-power-armor",
	  result_count = 1,
	  energy_required = 75,
	  enabled = false,
    },
  },
})