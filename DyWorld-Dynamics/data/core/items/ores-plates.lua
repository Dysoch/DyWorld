

  ----- Impure Ores -----
  
DyDS_Add_Tool({
	name = "iron-ore-impure",
	order = "iron-ore-impure",
    icon = DyDs_path_icon.."ores/iron-1.png",
	localised_name = {"looped-name.iron-1"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-1",
})

DyDS_Add_Tool({
	name = "copper-ore-impure",
	order = "copper-ore-impure",
    icon = DyDs_path_icon.."ores/copper-1.png",
	localised_name = {"looped-name.copper-1"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-1",
})

DyDS_Add_Tool({
	name = "tin-ore-impure",
	order = "tin-ore-impure",
    icon = DyDs_path_icon.."ores/tin-1.png",
	localised_name = {"looped-name.tin-1"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-1",
})

  ----- Pure Ores -----
  
DyDS_Add_Tool({
	name = "iron-ore",
	order = "iron-ore",
    icon = DyDs_path_icon.."ores/iron-2.png",
	localised_name = {"looped-name.iron-2"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-2",
})

DyDS_Add_Tool({
	name = "copper-ore",
	order = "copper-ore",
    icon = DyDs_path_icon.."ores/copper-2.png",
	localised_name = {"looped-name.copper-2"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-2",
})

DyDS_Add_Tool({
	name = "tin-ore",
	order = "tin-ore",
    icon = DyDs_path_icon.."ores/tin-2.png",
	localised_name = {"looped-name.tin-2"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-2",
}) 

  ----- Slag & Nuggets -----
  
DyDS_Add_Tool({
	name = "slag",
	order = "slag",
    icon = DyDs_path_icon.."slag.png",
	stack_size = 5000,
	durability = 1,
	subgroup = DyDs.."0-resource-3",
})

  ----- Plates -----
  
DyDS_Add_Tool({
	name = "iron-plate",
	order = "iron-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-1.png", tint = {r=82, g=174, b=212}}},
	localised_name = {"looped-name.iron-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-2",
})

DyDS_Add_Tool({
	name = "copper-plate",
	order = "copper-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-1.png", tint = {r=212, g=119, b=82}}},
	localised_name = {"looped-name.copper-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-2",
})

DyDS_Add_Tool({
	name = "steel-plate",
	order = "steel-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-3.png", tint = {r=229, g=227, b=227}}},
	localised_name = {"looped-name.steel-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-3",
})

DyDS_Add_Tool({
	name = "bronze-plate",
	order = "bronze-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-3.png", tint = {r=126, g=112, b=109}}},
	localised_name = {"looped-name.bronze-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-1",
})

DyDS_Add_Tool({
	name = "tin-plate",
	order = "tin-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-2.png", tint = {r=39, g=105, b=135}}},
	localised_name = {"looped-name.tin-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-2",
})

  ----- Stones -----
  
DyDS_Add_Tool({
	name = "limestone",
	order = "limestone",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=141, g=91, b=74}}},
	localised_name = {"looped-name.limestone"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})
  
DyDS_Add_Tool({
	name = "quartzite",
	order = "quartzite",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=170, g=170, b=170}}},
	localised_name = {"looped-name.quartzite"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})
  
DyDS_Add_Tool({
	name = "granite",
	order = "granite",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=146, g=135, b=41}}},
	localised_name = {"looped-name.granite"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})
  
DyDS_Add_Tool({
	name = "sandstone",
	order = "sandstone",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=242, g=244, b=212}}},
	localised_name = {"looped-name.sandstone"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})

  ----- Coal -----
  
DyDS_Add_Item({
	name = "wood",
	order = "wood",
    icon = "__base__/graphics/icons/wood.png",
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "2MJ",
    fuel_category = "carbon",
})
  
DyDS_Add_Item({
	name = "lignite",
	order = "lignite",
    icons = {{icon = "__base__/graphics/icons/coal.png", tint = {r=141, g=91, b=74}}},
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "4MJ",
    fuel_category = "carbon",
})

DyDS_Add_Item({
	name = "charcoal",
	order = "charcoal",
    icons = {{icon = "__base__/graphics/icons/coal.png", tint = {r=182, g=155, b=76}}},
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "5MJ",
    fuel_category = "carbon",
})
  
DyDS_Add_Tool({
	name = "coal",
	order = "coal",
    icon = "__base__/graphics/icons/coal.png",
	stack_size = 1000,
	subgroup = DyDs.."material-2",
    fuel_value = "15MJ",
    fuel_category = "carbon",
	durability = 1,
})