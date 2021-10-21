
  ----- Basic Armor -----
data:extend({
  {
    type = "armor",
    name = "basic-armor",
    icon = "__base__/graphics/icons/light-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      Resist("physical", 3, 20),
      Resist("explosion", 5, 20),
      Resist("fire", 0, 10),
    },
    subgroup = DyDs.."armor",
    order = "basic-armor",
    stack_size = 50,
    durability = Dy_Sett.Difficulty == "Normal" and 3000 or Dy_Sett.Difficulty == "Hard" and 1000 or 5000,
    infinite = Dy_Sett.Difficulty == "Easy" and true or false,
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
  },
})
  ----- Basic Power Armor -----
data:extend({
  {
    type = "armor",
    name = "basic-power-armor",
    icon = "__base__/graphics/icons/heavy-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      Resist("physical", 5, 30),
      Resist("acid", 0, 50),
      Resist("explosion", 20, 35),
      Resist("fire", 0, 40),
      Resist(0, 0, 0, true),
    },
    subgroup = DyDs.."armor",
    order = "basic-power-armor",
    stack_size = 1,
    durability = Dy_Sett.Difficulty == "Normal" and 15000 or Dy_Sett.Difficulty == "Hard" and 5000 or 5000,
    infinite = Dy_Sett.Difficulty == "Easy" and true or false,
    equipment_grid = DyW.Equip.Grid(5, 5, "dy-armor"),
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
  },
})