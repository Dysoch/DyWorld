

DyDS_Add_Ammo({
	name = "9mm-bullet",
	icon = DyDs_path_icon.."bullet-9mm.png",
	order = "copper-cable",
	stack_size = 1000,
	ammo_cat = "900mm",
	dmg_amount = 5,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "9mm",
})

DyDS_Add_Ammo({
	name = "9mm-bullet-ap",
	icon = DyDs_path_icon.."bullet-9mm.png",
	order = "copper-cable",
	stack_size = 1000,
	ammo_cat = "900mm",
	dmg_amount = 10,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-piercing",
    order = "9mm",
})

data:extend({
	----- Basic 9mm Ammo -----
  {
    type = "recipe",
    name = "9mm-bullet",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "limestone", amount = 3},
      },
      result = "9mm-bullet",
	  result_count = 5,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 3},
        {type = "item", name = "limestone", amount = 10},
      },
      result = "9mm-bullet",
	  result_count = 3,
	  energy_required = 5,
	  enabled = false,
    },
  },
	----- AP 9mm Ammo -----
  {
    type = "recipe",
    name = "9mm-bullet-ap",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "9mm-bullet", amount = 5},
        {type = "item", name = "tin-plate", amount = 1},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "9mm-bullet-ap",
	  result_count = 5,
	  energy_required = 1.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "9mm-bullet", amount = 7},
        {type = "item", name = "tin-plate", amount = 3},
        {type = "item", name = "lignite", amount = 2},
      },
      result = "9mm-bullet-ap",
	  result_count = 5,
	  energy_required = 7.5,
	  enabled = false,
    },
  },
})