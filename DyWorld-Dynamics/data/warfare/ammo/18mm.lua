

DyDS_Add_Ammo_Shotgun({
	name = "1853mm-bullet",
	icon = DyDs_path_icon_base.."shotgun-shell.png",
	order = "copper-cable",
	stack_size = 1000,
	ammo_cat = "1853mm",
	dmg_amount = 4.5,
	range = 21,
	repeat_count = 12,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "1853mm",
})

DyDS_Add_Ammo_Shotgun({
	name = "1853mm-bullet-ap",
	icon = DyDs_path_icon_base.."shotgun-shell.png",
	order = "copper-cable",
	stack_size = 1000,
	ammo_cat = "1853mm",
	dmg_amount = 11,
	range = 28,
	repeat_count = 12,
	piercing = true,
	dmg_type = "physical",
	magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-piercing",
    order = "1853mm",
})

data:extend({
	----- Basic 1853mm Ammo -----
  {
    type = "recipe",
    name = "1853mm-bullet",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "granite", amount = 12},
      },
      result = "1853mm-bullet",
	  result_count = 10,
	  energy_required = 1,
	  enabled = false,
    },
  },
	----- AP 1853mm Ammo -----
  {
    type = "recipe",
    name = "1853mm-bullet-ap",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "1853mm-bullet", amount = 10},
        {type = "item", name = "titanium-plate", amount = 1},
      },
      result = "1853mm-bullet-ap",
	  result_count = 10,
	  energy_required = 1.5,
	  enabled = false,
    },
  },
})