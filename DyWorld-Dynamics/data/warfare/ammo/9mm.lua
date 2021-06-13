

DyDS_Add_Ammo({
	name = "9mm-bullet",
	icon = DyDs_path_icon.."bullet-9mm.png",
	order = "copper-cable",
	stack_size = 250,
	ammo_cat = "900mm",
	dmg_amount = 5,
	range = 15,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "9mm",
})

DyDS_Add_Ammo({
	name = "9mm-bullet-ap",
	icon = DyDs_path_icon.."bullet-9mm.png",
	order = "copper-cable",
	stack_size = 250,
	ammo_cat = "900mm",
	dmg_amount = 10,
	range = 19,
	piercing = true,
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
        {type = "item", name = "limestone", amount = 2},
      },
      results = 
      {
        {type = "item", name = "9mm-bullet", amount_min = 5, amount_max = 7},
      },
	  energy_required = 1,
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
      results = 
      {
        {type = "item", name = "9mm-bullet-ap", amount_min = 5, amount_max = 7},
      },
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})