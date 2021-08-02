

DyDS_Add_Ammo_2({
	name = "9mm",
	loc_name = "9mm",
	icon = DyDs_path_icon.."bullet-9mm.png",
	range = 15,
	dmg_types = {
		["physical"] = 5,
		["impact"] = 2.5,
	},
	base_ingredients = {
		{type = "item", name = "limestone", amount = 2},
	},
	tier = 1,
})

DyDS_Add_Ammo_2({
	name = "762mm",
	loc_name = "7.62mm",
	icon = DyDs_path_icon.."bullet-762mm.png",
	range = 19,
	dmg_types = {
		["physical"] = 2.5,
		["impact"] = 1.25,
	},
	base_ingredients = {
		{type = "fluid", name = "nitrogen", amount = 3},
	},
	tier = 2,
})

DyDS_Add_Ammo_2({
	name = "860mm",
	loc_name = "8.60mm",
	icon = DyDs_path_icon.."bullet-860mm.png",
	range = 85,
	dmg_types = {
		["sonic"] = 20,
		["physical"] = 25,
		["impact"] = 12.5,
	},
	base_ingredients = {
		{type = "fluid", name = "nitrogen", amount = 3},
	},
	tier = 3,
})