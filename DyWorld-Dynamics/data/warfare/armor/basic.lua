
  ----- Basic Ballistic Ammo -----
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