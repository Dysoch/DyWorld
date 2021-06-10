


  

DyDS_Add_Item({
	name = "raw-fish-pike",
    icons = {{icon = "__base__/graphics/icons/fish.png", tint = {112, 130, 56}}},
	order = "fish-pike",
	stack_size = 500,
	subgroup = DyDs.."intermediates-bio",
})
  
DyDS_Add_Item({
	name = "raw-fish-salmon",
    icons = {{icon = "__base__/graphics/icons/fish.png", tint = {250, 128, 114}}},
	order = "fish-salmon",
	stack_size = 500,
	subgroup = DyDs.."intermediates-bio",
})

DyDS_Add_Tool({
	name = "raw-fish-pike-filet",
    icons = {{icon = DyDs_path_icon.."fish-raw.png", tint = {112, 130, 56}}},
	order = "fish-pike-filet",
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."intermediates-bio",
})
  
DyDS_Add_Tool({
	name = "raw-fish-salmon-filet",
    icons = {{icon = DyDs_path_icon.."fish-raw.png", tint = {250, 128, 114}}},
	order = "fish-salmon-filet",
	stack_size = 500,
	durability = 1,
	subgroup = DyDs.."intermediates-bio",
})

DyDS_Add_Item({
	name = "cooked-fish-pike-filet",
    icons = {{icon = DyDs_path_icon.."fish-cooked.png", tint = {112, 130, 56}}},
	order = "fish-pike-cooked",
	stack_size = 500,
	subgroup = DyDs.."intermediates-bio",
})
  
DyDS_Add_Item({
	name = "cooked-fish-salmon-filet",
    icons = {{icon = DyDs_path_icon.."fish-cooked.png", tint = {250, 128, 114}}},
	order = "fish-salmon-cooked",
	stack_size = 500,
	subgroup = DyDs.."intermediates-bio",
})