

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

  ----- Nuggets -----
  
DyDS_Add_Item({
	name = "iron-nugget",
	order = "iron-nugget",
	localised_name = {"looped-name.iron-3"},
	stack_size = 5000,
	subgroup = DyDs.."0-resource-3",
})

DyDS_Add_Item({
	name = "copper-nugget",
	order = "copper-nugget",
	localised_name = {"looped-name.copper-3"},
	stack_size = 5000,
	subgroup = DyDs.."0-resource-3",
})

DyDS_Add_Item({
	name = "tin-nugget",
	order = "tin-nugget",
	localised_name = {"looped-name.tin-3"},
	stack_size = 5000,
	subgroup = DyDs.."0-resource-3",
})

  ----- Plates -----
  
DyDS_Add_Tool({
	name = "iron-plate",
	order = "iron-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
	localised_name = {"looped-name.iron-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-2",
})

DyDS_Add_Tool({
	name = "copper-plate",
	order = "copper-plate",
    icon = "__base__/graphics/icons/copper-plate.png",
	localised_name = {"looped-name.copper-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-2",
})

DyDS_Add_Tool({
	name = "steel-plate",
	order = "steel-plate",
    icon = "__base__/graphics/icons/steel-plate.png",
	localised_name = {"looped-name.steel-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-3",
})

DyDS_Add_Tool({
	name = "bronze-plate",
	order = "bronze-plate",
	localised_name = {"looped-name.bronze-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-1",
})

DyDS_Add_Tool({
	name = "tin-plate",
	order = "tin-plate",
	localised_name = {"looped-name.tin-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."metal-2",
})

  ----- Stones -----
  
DyDS_Add_Tool({
	name = "limestone",
	order = "limestone",
    icon = "__base__/graphics/icons/stone.png",
	localised_name = {"looped-name.limestone"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})
  
DyDS_Add_Tool({
	name = "quartzite",
	order = "quartzite",
    icon = "__base__/graphics/icons/stone.png",
	localised_name = {"looped-name.quartzite"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})
  
DyDS_Add_Tool({
	name = "granite",
	order = "granite",
    icon = "__base__/graphics/icons/stone.png",
	localised_name = {"looped-name.granite"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
})
  
DyDS_Add_Tool({
	name = "sandstone",
	order = "sandstone",
    icon = "__base__/graphics/icons/stone.png",
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
    icon = "__base__/graphics/icons/coal.png",
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "4MJ",
    fuel_category = "carbon",
})

DyDS_Add_Item({
	name = "charcoal",
	order = "charcoal",
    icon = "__base__/graphics/icons/coal.png",
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "5MJ",
    fuel_category = "carbon",
})
  
DyDS_Add_Item({
	name = "coal",
	order = "coal",
    icon = "__base__/graphics/icons/coal.png",
	stack_size = 1000,
	subgroup = DyDs.."material-2",
    fuel_value = "15MJ",
    fuel_category = "carbon",
})