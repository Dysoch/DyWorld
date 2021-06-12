

DyDS_Add_Ammo({
	name = "762mm-bullet",
	icon = DyDs_path_icon.."bullet-762mm.png",
	order = "copper-cable",
	stack_size = 250,
	ammo_cat = "762mm",
	dmg_amount = 2.5,
	range = 19,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "762mm",
})

DyDS_Add_Ammo({
	name = "762mm-bullet-ap",
	icon = DyDs_path_icon.."bullet-762mm.png",
	order = "copper-cable",
	stack_size = 250,
	ammo_cat = "762mm",
	dmg_amount = 6,
	range = 23,
	piercing = true,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-piercing",
    order = "762mm",
})

data:extend({
	----- Basic 762mm Ammo -----
  {
    type = "recipe",
    name = "762mm-bullet",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "nitrogen", amount = 3},
      },
      results = 
      {
        {type = "item", name = "762mm-bullet", amount_min = 3, amount_max = 7},
      },
	  energy_required = 1,
	  enabled = false,
    },
  },
	----- AP 762mm Ammo -----
  {
    type = "recipe",
    name = "762mm-bullet-ap",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "762mm-bullet", amount = 5},
        {type = "item", name = "steel-plate", amount = 1},
      },
      results = 
      {
        {type = "item", name = "762mm-bullet-ap", amount_min = 3, amount_max = 7},
      },
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})