
  ----- Basic Power Armor -----
data:extend({
  {
    type = "armor",
    name = "zaydon-power-armor",
    icon = "__base__/graphics/icons/power-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      Resist("physical", 8, 40),
      Resist("acid", 10, 50),
      Resist("explosion", 50, 50),
      Resist("fire", 0, 60),
      Resist("poison", 0, 20),
      Resist("radiation", 0, 5),
      Resist(0, 0, 0, true),
    },
    subgroup = DyDs.."armor",
    order = "zaydon-power-armor",
    stack_size = 1,
    durability = Dy_Sett.Difficulty == "Normal" and 25000 or Dy_Sett.Difficulty == "Hard" and 15000 or 5000,
    infinite = Dy_Sett.Difficulty == "Easy" and true or false,
    equipment_grid = DyW.Equip.Grid(8, 6, "dy-armor"),
  },
  {
    type = "recipe",
    name = "zaydon-power-armor",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "basic-power-armor", amount = 1},
        {type = "item", name = "control-board-2", amount = 5},
        {type = "item", name = "aluminium-plate", amount = 5},
        {type = "item", name = "titanium-plate", amount = 15},
      },
      result = "zaydon-power-armor",
	  result_count = 1,
	  energy_required = 60,
	  enabled = false,
    },
  },
})