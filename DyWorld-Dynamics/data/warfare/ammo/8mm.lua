

DyDS_Add_Ammo({
	name = "860mm-bullet",
  loc_name = "8.60mm",
	icon = DyDs_path_icon.."bullet-860mm.png",
	stack_size = 250,
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
  loc_name = "8.60mm",
	icon = DyDs_path_icon.."bullet-860mm.png",
	stack_size = 250,
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
        {type = "item", name = "limestone", amount = 2},
      },
      results = 
      {
        {type = "item", name = "860mm-bullet", amount_min = 5, amount_max = 7},
      },
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
      results = 
      {
        {type = "item", name = "860mm-bullet-ap", amount_min = 5, amount_max = 7},
      },
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})