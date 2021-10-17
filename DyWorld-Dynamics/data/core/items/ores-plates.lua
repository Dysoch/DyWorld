
for k,v in pairs(Dy_Metals) do
	if v.Ore_1 == "item" then
DyDS_Add_Item({
	name = k.."-ore-impure",
	order = k.."-ore-impure",
    icons = {{icon = DyDs_path_icon.."ores/impure-ore.png", tint = Dy_Metal_Colors[k]}},
	localised_name = {"looped-name."..k.."-1"},
	stack_size = 1000,
	subgroup = DyDs.."0-resource-1",
})	
	elseif v.Ore_1 == "tool" then
DyDS_Add_Tool({
	name = k.."-ore-impure",
	order = k.."-ore-impure",
    icons = {{icon = DyDs_path_icon.."ores/impure-ore.png", tint = Dy_Metal_Colors[k]}},
	localised_name = {"looped-name."..k.."-1"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."0-resource-1",
})
	end
DyDS_Add_Item({
	name = k.."-ore",
	order = k.."-ore",
    icons = {{icon = DyDs_path_icon.."ores/pure-ore.png", tint = Dy_Metal_Colors[k]}},
	localised_name = {"looped-name."..k.."-2"},
	stack_size = 1000,
	subgroup = DyDs.."0-resource-2",
})	
	if v.Ingot == "item" then
DyDS_Add_Item({
	name = k.."-ingot",
	order = k.."-ingot",
    icons = {{icon = DyDs_path_icon.."ores/ingot.png", tint = Dy_Metal_Colors[k]}},
	localised_name = {"looped-name."..k.."-3"},
	stack_size = 500,
	subgroup = DyDs.."0-resource-3",
})	
	elseif v.Ingot == "tool" then
DyDS_Add_Tool({
	name = k.."-ingot",
	order = k.."-ingot",
    icons = {{icon = DyDs_path_icon.."ores/ingot.png", tint = Dy_Metal_Colors[k]}},
	localised_name = {"looped-name."..k.."-3"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."0-resource-3",
})
	end
DyDS_Add_Item({
	name = k.."-plate",
	order = k.."-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-"..v.Tier..".png", tint = Dy_Metal_Colors[k]}},
	localised_name = {"looped-name."..k.."-4"},
	stack_size = 500,
	subgroup = DyDs.."0-resource-4",
})	
end

  ----- Slag & Nuggets -----
  
DyDS_Add_Tool({
	name = "slag",
	order = "slag",
    icon = DyDs_path_icon.."slag.png",
	stack_size = 5000,
	durability = 1,
	subgroup = DyDs.."0-resource-5",
	Chemical_Formula = "C-",
})

  ----- Plates -----
DyDS_Add_Item({
	name = "steel-plate",
	order = "steel-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-3.png", tint = Steel_Color}},
	localised_name = {"looped-name.steel-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."0-resource-4",
	Chemical_Formula = "Fe-C-",
})

DyDS_Add_Tool({
	name = "bronze-plate",
	order = "bronze-plate",
    icons = {{icon = DyDs_path_icon.."base-plate-3.png", tint = Bronze_Color}},
	localised_name = {"looped-name.bronze-4"},
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."0-resource-4",
	Chemical_Formula = "Sn-Cu-",
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
	Chemical_Formula = "Si-O2-",
})
  
DyDS_Add_Tool({
	name = "quartzite",
	order = "quartzite",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=170, g=170, b=170}}},
	localised_name = {"looped-name.quartzite"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-2",
	Chemical_Formula = "Si-O2-",
})
  
DyDS_Add_Tool({
	name = "granite",
	order = "granite",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=146, g=135, b=41}}},
	localised_name = {"looped-name.granite"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-2",
	Chemical_Formula = "Si-O2-",
})
  
DyDS_Add_Tool({
	name = "sandstone",
	order = "sandstone",
    icons = {{icon = "__base__/graphics/icons/stone.png", tint = {r=242, g=244, b=212}}},
	localised_name = {"looped-name.sandstone"},
	stack_size = 1000,
	durability = 1,
	subgroup = DyDs.."material-1",
	Chemical_Formula = "Si-O2-",
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
	Chemical_Formula = "C-",
})
  
DyDS_Add_Item({
	name = "lignite",
	order = "lignite",
    icons = {{icon = "__base__/graphics/icons/coal.png", tint = {r=116, g=66, b=49}}},
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "4MJ",
    fuel_category = "carbon",
	Chemical_Formula = "C-",
})

DyDS_Add_Item({
	name = "charcoal",
	order = "charcoal",
    icons = {{icon = "__base__/graphics/icons/coal.png", tint = {r=202, g=175, b=96}}},
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "5MJ",
    fuel_category = "carbon",
	Chemical_Formula = "C-",
})

DyDS_Add_Item({
	name = "carbon",
	order = "carbon",
    icons = {{icon = DyDs_path_icon.."carbon.png"}},
	stack_size = 1000,
	subgroup = DyDs.."material-1",
    fuel_value = "2.5MJ",
    fuel_category = "carbon",
	Chemical_Formula = "C-",
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
	Chemical_Formula = "C-",
})
data.raw.item.coal = nil

data.raw.item["iron-plate"].Chemical_Formula = "Fe-"
data.raw.item["copper-plate"].Chemical_Formula = "Cu-"
data.raw.item["steel-plate"].Chemical_Formula = "Fe-C-"