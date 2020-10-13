

DyDS_Add_Ammo({
	name = "762mm-bullet",
	icon = DyDs_path_icon.."bullet-9mm.png",
	order = "copper-cable",
	stack_size = 1000,
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
	icon = DyDs_path_icon.."bullet-9mm.png",
	order = "copper-cable",
	stack_size = 1000,
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
      result = "762mm-bullet",
	  result_count = 5,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 1*5},
        {type = "fluid", name = "nitrogen", amount = 3*10},
      },
      result = "762mm-bullet",
	  result_count = 3,
	  energy_required = 5,
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
      result = "762mm-bullet-ap",
	  result_count = 5,
	  energy_required = 1.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "762mm-bullet", amount = 7},
        {type = "item", name = "steel-plate", amount = 3},
      },
      result = "762mm-bullet-ap",
	  result_count = 5,
	  energy_required = 7.5,
	  enabled = false,
    },
  },
})