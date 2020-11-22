

DyDS_Add_Ammo({
	name = "860mm-bullet",
	icon = DyDs_path_icon.."bullet-860mm.png",
	order = "copper-cable",
	stack_size = 50,
	ammo_cat = "860mm",
	dmg_amount = 25,
	direction_deviation = 0.005,
	starting_speed = 2.5,
	range = 85,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "860mm",
})

DyDS_Add_Ammo({
	name = "860mm-bullet-ap",
	icon = DyDs_path_icon.."bullet-860mm.png",
	order = "copper-cable",
	stack_size = 50,
	ammo_cat = "860mm",
	dmg_amount = 50,
	direction_deviation = 0.005,
	starting_speed = 2.5,
	range = 120,
	piercing = true,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-piercing",
    order = "860mm",
})

data:extend({
	----- Basic 860mm Ammo -----
  {
    type = "recipe",
    name = "860mm-bullet",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "limestone", amount = 3},
      },
      result = "860mm-bullet",
	  result_count = 5,
	  energy_required = 1,
	  enabled = false,
    },
  },
	----- AP 860mm Ammo -----
  {
    type = "recipe",
    name = "860mm-bullet-ap",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "860mm-bullet", amount = 5},
        {type = "item", name = "tin-plate", amount = 1},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "860mm-bullet-ap",
	  result_count = 5,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})